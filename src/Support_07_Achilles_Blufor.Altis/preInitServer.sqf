/* 
	TO DO: Determine whehter the init line is public or not!!!
	TO DO: Replace CARRIER_LOCATION with the result of the mission params (probably same for most constants)
*/

// location specific params
#define MAX_LOCATION_DISTANCE		5150
#define CONSIDERED_LOCATION_TYPES	["Airport","NameLocal","NameCity","NameCityCapital","NameVillage"]
#define LARGE_LOCATION_TYPES		["Airport","NameCity","NameCityCapital"]
#define LARGE_LOCATION_WEIGHT		1
#define SMALL_LOCATION_WEIGHT		0.5
#define LOCATION_MAX_SIZE_CUTOFF	300

// define spawn attributes
#define MANPOWER_INF_OPFOR			"20"
#define MANPOWER_MOTOR_OPFOR		"27"
#define MANPOWER_ARMOR_OPFOR		"50"		// armored AND mechanized => increasing variation
// summariezed in a list
#define MANPOWER_TYPE_LIST_OPFOR	[MANPOWER_INF_OPFOR, MANPOWER_MOTOR_OPFOR, MANPOWER_ARMOR_OPFOR]
#define MANPOWER_INF_BLUFOR			"26"
#define MANPOWER_MOTOR_BLUFOR		"20"
#define MANPOWER_ARMOR_BLUFOR		"20"		// armored AND mechanized => increasing variation
// summariezed in a list
#define MANPOWER_TYPE_LIST_BLUFOR	[MANPOWER_INF_BLUFOR, MANPOWER_MOTOR_BLUFOR, MANPOWER_ARMOR_BLUFOR]
// [15s, 30s, 60s, 120s] select RATE_IDX
#define SPAWN_INF_RATE_IDX			"1"
#define SPAWN_MOTOR_RATE_IDX		"2"
#define SPAWN_ARMOR_RATE_IDX		"3"
// summarized in a list
#define SPAWN_RATE_IDX_TYPE_LIST	[SPAWN_INF_RATE_IDX, SPAWN_MOTOR_RATE_IDX, SPAWN_ARMOR_RATE_IDX]
#define SPAWN_OPFOR_SIDE			"East"
#define SPAWN_BLUFOR_SIDE			"West"

// define spawn point attributes
#define SPAWN_OPFOR_FACTION			"OPF_F"
#define SPAWN_BLUFOR_FACTION		"BLU_F"
#define SPAWN_WEIGHT_INF			"10"
#define SPAWN_WEIGHT_MOTOR			"10"
#define SPAWN_WEIGHT_MECH			"5"
#define SPAWN_WEIGHT_ARMOR			"5"
// combine the weights in a list for the spawn point attributes
#define SPAWN_TYPE_WEIGHT_LIST		[[SPAWN_WEIGHT_INF, "0", "0", "0"], ["0", SPAWN_WEIGHT_MOTOR, "0", "0"], ["0", "0", SPAWN_WEIGHT_MECH, SPAWN_WEIGHT_ARMOR]]

// define sector attributes
#define SECTOR_MODULE_OWNER_LIMIT	"0.8"
#define SECTOR_MODULE_PLAYER_COST	"0"
#define SECTOR_MODULE_INF_COST		"0.01"
#define SECTOR_MODULE_WHEELED_COST	"0.02"
#define SECTOR_MODULE_TRACKED_COST	"0.04"
#define SECTOR_MODULE_AIR_COST		"0"
#define SECTOR_MODULE_WATER_COST	"0"
#define SECTOR_MODULE_SCORE_REWARD	"0"

// sector parameters
#define TOTAL_NUMBER_OF_SECTORS		9
#define NUMBER_OF_BLUFOR_SECTORS	2
#define NUMBER_OF_OPFOR_SECTORS		5

// sector area parameters
#define MIN_AREA_RADIUS				50
#define MAX_AREA_RADIUS				150

// server preinit
if !(isServer) exitWith {};

/*
private _carrierPosition = [3000.13,16000,0]; 
private _carrierPosDiff =  _carrierPosition vectorDiff getPosWorld this;
{ 
 _x setPosWorld (_carrierPosDiff vectorAdd getPosWorld _x); 
} forEach (nearestObjects [getPos this, [], 300]); 
[this] call BIS_fnc_Carrier01PosUpdate;
*/

// mission params init
call Mission_fnc_missionParamsInit;

// create custom locations (local!!! => only the server can see them)
{
	_x params ["_type", "_name", "_pos", "_radius"];
	private _location = createLocation [_type, _pos, _radius, _radius];
	_location setText _name;
	
} forEach
[
	#include "custom\definedLocations.hpp"
];

// get near locations
private _carrierPosition = Mission_var_carrierPosition;
private _locations = nearestLocations [_carrierPosition, CONSIDERED_LOCATION_TYPES, MAX_LOCATION_DISTANCE];
// filter blacklisted locations
_locations = _locations select
{
	private _location = _x;
	{
		(getPos _location distance2D _x < 50)
	} count
	[
		#include "custom\blacklistedLocations.hpp"
	] == 0
};
// set weights for the location
private _weights = _locations apply {[SMALL_LOCATION_WEIGHT, LARGE_LOCATION_WEIGHT] select (type _x in LARGE_LOCATION_TYPES)};


private _logicGroup = createGroup sideLogic;
private _sectors = [];
// select <faction> select <groupType (e.g. motorized)>
private _spawnPointVarNamesNestedList = [[[],[],[]], [[],[],[]]];

for "_i_sector" from 1 to TOTAL_NUMBER_OF_SECTORS do
{
	if (_locations isEqualTo []) exitWith {};
	
	// select a location and remove it from the available locations
	private _location = _locations selectRandomWeighted _weights;
	private _locationIdx = _locations find _location;
	_locations deleteAt _locationIdx;
	_weights deleteAt _locationIdx;
	
	// get location data
	private _locationName = text _location;
	private _locationIsLarge = (type _location in LARGE_LOCATION_TYPES);
	private _locationRadii = size _location;
	private _locationMaxRadius = ((selectMax _locationRadii) max MIN_AREA_RADIUS) min LOCATION_MAX_SIZE_CUTOFF;
	private _locationMinRadius = ((selectMin _locationRadii) max MIN_AREA_RADIUS) min MAX_AREA_RADIUS;
	private _sectorRadius = [_locationMinRadius, _locationMaxRadius] select _locationIsLarge;
	private _locationPos = locationPosition _location;
	
	// create a camp if nothing is there...
	if (nearestObjects [_locationPos, ["building"], _sectorRadius*2/3, true] isEqualTo []) then
	{
		[_locationPos, sideUnknown, missionConfigFile >> "cfgGroups" >> "Empty" >> "Mission_comp_MilitaryStructures" >> "Mission_comp_MilitaryStructures_Camps" >> format ["Mission_comp_MilitaryStructures_Camps_%1", round random 1]] call BIS_fnc_spawnGroup;
	};
	
	// determine the sector side (the enemy has a higher priority)
	private _sectorSide = "-1";
	switch (true) do
	{
		case (_i_sector <= NUMBER_OF_OPFOR_SECTORS):
		{
			_sectorSide = "0";
			// The enemy will defend his locations
			[_locationPos, _sectorRadius, _locationIsLarge] call Mission_fnc_setUpDefence;
		};
		case (_i_sector <= NUMBER_OF_OPFOR_SECTORS + NUMBER_OF_BLUFOR_SECTORS):
		{
			_sectorSide = "1";
		};
		default
		{
			_sectorSide = "-1";
		};
	};
	
	// create a location area + trigger and sync them
	private _areaTrigger = createTrigger ["EmptyDetector", _locationPos, true];
	_areaTrigger setTriggerArea [_sectorRadius, _sectorRadius, 0, false];
	private _waypointPos = [_locationPos, 0, _sectorRadius/3, 10, 0, 0.5] call BIS_fnc_findSafePos;
	if (_waypointPos distance2D _locationPos > _sectorRadius) then
	{
		_waypointPos = [_locationPos, 0, _sectorRadius*2/3, 10, 0, 0.5] call BIS_fnc_findSafePos;
		if (_waypointPos distance2D _locationPos > _sectorRadius) then
		{
			_waypointPos = _locationPos;
		};
	};
	private _area = _logicGroup createUnit ["LocationArea_F", _waypointPos, [], 0, "NONE"];
	private _areaVarName = "mission_var_area_" + str _i_sector;
	missionNamespace setVariable [_areaVarName, _area];
	_area synchronizeObjectsAdd [_areaTrigger];
	
	// create unlock logic and trigger for spawn modules
	// east
	private _unlockEastTrigger = createTrigger ["EmptyDetector", _locationPos, true];
	_unlockEastTrigger setTriggerActivation ["EAST", "PRESENT", true];
	private _unlockEast = _logicGroup createUnit ["MiscUnlock_F", _locationPos, [], 0, "NONE"];
	private _unlockEastVarName = "mission_var_unlockEast_" + str _i_sector;
	missionNamespace setVariable [_unlockEastVarName, _unlockEast];
	_unlockEast synchronizeObjectsAdd [_unlockEastTrigger];
	// west
	private _unlockWestTrigger = createTrigger ["EmptyDetector", _locationPos, true];
	_unlockWestTrigger setTriggerActivation ["WEST", "PRESENT", true];
	_unlockWestTrigger setTriggerStatements ["this", "systemChat 'We have captured " + _locationName +"'", "systemChat 'We have lost " + _locationName +"'"];
	private _unlockWest = _logicGroup createUnit ["MiscUnlock_F", _locationPos, [], 0, "NONE"];
	private _unlockWestVarName = "mission_var_unlockWest_" + str _i_sector;
	missionNamespace setVariable [_unlockWestVarName, _unlockWest];
	_unlockWest synchronizeObjectsAdd [_unlockWestTrigger];
	
	// create spawn point modules (for each side and for each type (e.g. motorized))
	{
		_x params ["_faction", "_unlockTrigger"];
		private _factionIdx = _forEachIndex;
		{
			_x params ["_infWeight", "_motWeight", "_mecWeight", "_armWeight"];
			private _typeIdx = _forEachIndex;
			private _spawnPointVarName =  ["mission_var_spawnPoint", _i_sector, _factionIdx, _typeIdx] joinString "_";
			"ModuleSpawnAIPoint_F" createUnit [_waypointPos, _logicGroup,
			"
				if (isServer) then
				{
					" + _spawnPointVarName + " = this;
					this setVariable ['Faction','" + _faction + "', true];
					this setVariable ['Infantry', " + _infWeight + ", true];
					this setVariable ['Motorized', " + _motWeight + ", true];
					this setVariable ['Mechanized', " + _mecWeight + ", true];
					this setVariable ['Armored', " + _armWeight + ", true];
				};
			"];
			private _spawnPoint = missionNamespace getVariable [_spawnPointVarName, objNull];
			_spawnPoint synchronizeObjectsAdd [_unlockTrigger];
			(_spawnPointVarNamesNestedList select _factionIdx select _typeIdx) pushBack _spawnPointVarName;
		} forEach SPAWN_TYPE_WEIGHT_LIST;
	} forEach [[SPAWN_OPFOR_FACTION, _unlockEastTrigger], [SPAWN_BLUFOR_FACTION, _unlockWestTrigger]];
	
	
	// create a sector module and synchronize
	private _sectorVarName = "mission_var_sector_" + str _i_sector;
	"ModuleSector_F" createUnit [_locationPos, _logicGroup, 
	"
		if (isServer) then
		{
			" + _sectorVarName + " = this;
			this setVariable ['Name','" + _locationName + "', true];
			this setVariable ['DefaultOwner', '" + _sectorSide + "', true];
			this setVariable ['OwnerLimit', '" + SECTOR_MODULE_OWNER_LIMIT + "', true];
			this setVariable ['CostPlayers', '" + SECTOR_MODULE_INF_COST + "', true];
			this setVariable ['CostInfantry', '" + SECTOR_MODULE_INF_COST + "', true];
			this setVariable ['CostWheeled', '" + SECTOR_MODULE_WHEELED_COST + "', true];
			this setVariable ['CostTracked', '" + SECTOR_MODULE_TRACKED_COST + "', true];
			this setVariable ['CostAir', '" + SECTOR_MODULE_AIR_COST + "', true];
			this setVariable ['CostWater', '" + SECTOR_MODULE_WATER_COST + "', true];
			this setVariable ['ScoreReward', '" + SECTOR_MODULE_SCORE_REWARD + "', true];
			this synchronizeObjectsAdd
			[
				missionNamespace getVariable ['" + _areaVarName + "', objNull],
				missionNamespace getVariable ['" + _unlockEastVarName + "', objNull],
				missionNamespace getVariable ['" + _unlockWestVarName + "', objNull]
			];
		};
	"];
	_sectors pushBack (missionNamespace getVariable [_sectorVarName, objNull]);
};

// create the spawn modules
{
	_x params ["_side", "_faction", "_manpowerTypeList"];
	private _sideIdx = _forEachIndex;
	{
		private _manpower = _x;
		private _typeIdx = _forEachIndex;
		private _spawnRate = SPAWN_RATE_IDX_TYPE_LIST select _typeIdx;
		private _spawnPointVarNamesToSync = _spawnPointVarNamesNestedList select _sideIdx select _typeIdx;
		"ModuleSpawnAI_F" createUnit [_carrierPosition, _logicGroup, 
	"
		if (isServer) then
		{
			this setVariable ['Side','" + _side + "', true];
			this setVariable ['Faction','" + _faction + "', true];
			this setVariable ['ManpowerCap', " + _manpower + ", true];
			this setVariable ['SpawnRate', " + _spawnRate + ", true];
			this setVariable ['Infantry', 0, true];
			this setVariable ['Motorized', 0, true];
			this setVariable ['Mechanized', 0, true];
			this setVariable ['Armored', 0, true];
			this synchronizeObjectsAdd (" + str _spawnPointVarNamesToSync  + " apply {missionNamespace getVariable [_x, objNull]});
		};
	"]; 
	} forEach _manpowerTypeList;
} forEach [[SPAWN_OPFOR_SIDE, SPAWN_OPFOR_FACTION, MANPOWER_TYPE_LIST_OPFOR], [SPAWN_BLUFOR_SIDE, SPAWN_BLUFOR_FACTION, MANPOWER_TYPE_LIST_BLUFOR]];

// synchronize sectors to the main module
_sectors spawn
{
	waitUntil{!isNil "Mission_var_groundSupportModule"};
	Mission_var_groundSupportModule synchronizeObjectsAdd _this;
};
