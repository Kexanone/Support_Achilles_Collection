/* 
	TO DO: Determine whehter the init line is public or not!!!
	TO DO: Replace CARRIER_LOCATION with the result of the mission params (probably same for most constants)
*/

#define CARRIER_LOCATION			[3000.13,16000,0]

// location specific params
#define MAX_LOCATION_DISTANCE		5150
#define CONSIDERED_LOCATION_TYPES	["Airport","NameLocal","NameCity","NameCityCapital","NameVillage"]
#define LARGE_LOCATION_TYPES		["Airport","NameCity","NameCityCapital"]
#define LARGE_LOCATION_WEIGHT		1
#define SMALL_LOCATION_WEIGHT		0.5
#define LOCATION_MAX_SIZE_CUTOFF	300

// define sector attributes
#define SECTOR_MODULE_OWNER_LIMIT	'0.8'
#define SECTOR_MODULE_PLAYER_COST	'0'
#define SECTOR_MODULE_INF_COST		'0.01'
#define SECTOR_MODULE_WHEELED_COST	'0.02'
#define SECTOR_MODULE_TRACKED_COST	'0.04'
#define SECTOR_MODULE_AIR_COST		'0'
#define SECTOR_MODULE_WATER_COST	'0'
#define SECTOR_MODULE_SCORE_REWARD	'0'

// sector parameters
#define TOTAL_NUMBER_OF_SECTORS		9
#define NUMBER_OF_BLUFOR_SECTORS	2
#define NUMBER_OF_OPFOR_SECTORS		5

// sector area parameters
#define MIN_AREA_RADIUS				50
#define MAX_AREA_RADIUS				150

// server preinit
if !(isServer) exitWith {};

private _logicGroup = createGroup sideLogic;
private _sectors = [];
private _locations = nearestLocations [CARRIER_LOCATION, CONSIDERED_LOCATION_TYPES, MAX_LOCATION_DISTANCE];
reverse _locations;
private _weights = _locations apply {[SMALL_LOCATION_WEIGHT, LARGE_LOCATION_WEIGHT] select (type _x in LARGE_LOCATION_TYPES)};

for "_i_sector" from 1 to TOTAL_NUMBER_OF_SECTORS do
{
	if (_locations isEqualTo []) exitWith {};
	
	// select a location and remove it from the available locations
	private _location = _locations selectRandomWeighted _weights;
	private _locationIdx = _locations find _location;
	_locations deleteAt _locationIdx;
	_weights deleteAt _locationIdx;
	
	// determine the sector side (the enemy has a higher priority)
	private _sectorSide = switch (true) do
	{
		case (_i_sector <= NUMBER_OF_OPFOR_SECTORS):
		{
			"2"
		};
		case (_i_sector <= NUMBER_OF_OPFOR_SECTORS + NUMBER_OF_BLUFOR_SECTORS):
		{
			"1"
		};
		default
		{
			"-1"
		};
	};
	
	// get location data
	private _locationName = text _location;
	private _locationRadii = size _location;
	private _locationMaxRadius = ((selectMax _locationRadii) max MIN_AREA_RADIUS) min LOCATION_MAX_SIZE_CUTOFF;
	private _locationMinRadius = ((selectMin _locationRadii) max MIN_AREA_RADIUS) min MAX_AREA_RADIUS;
	private _sectorRadius = [_locationMinRadius, _locationMaxRadius] select (type _location in LARGE_LOCATION_TYPES);
	private _locationPos = locationPosition _location;
	
	// create a location area + trigger and sync them
	private _areaTrigger = createTrigger ["EmptyDetector", _locationPos, true];
	_areaTrigger setTriggerArea [_sectorRadius, _sectorRadius, 0, false];
	private _area = _logicGroup createUnit ["LocationArea_F", _locationPos, [], 0, "NONE"];
	private _areaVarName = "mission_var_area_" + str _i_sector;
	missionNamespace setVariable [_areaVarName, _area];
	_area synchronizeObjectsAdd [_areaTrigger];
	
	// create a sector module and synchronize
	private _sectorVarName = "mission_var_sector_" + str _i_sector;
	"ModuleSector_F" createUnit [_locationPos, _logicGroup, 
	"
		if (isServer) then
		{
			" + _sectorVarName + " = this;
			this setVariable ['Name','" + _locationName + "', true];
			this setVariable ['DefaultOwner', '" + _sectorSide + "', true];
			this setVariable ['OwnerLimit',  SECTOR_MODULE_OWNER_LIMIT, true];
			this setVariable ['CostPlayers', SECTOR_MODULE_INF_COST, true];
			this setVariable ['CostInfantry', SECTOR_MODULE_INF_COST, true];
			this setVariable ['CostWheeled', SECTOR_MODULE_WHEELED_COST, true];
			this setVariable ['CostTracked', SECTOR_MODULE_TRACKED_COST, true];
			this setVariable ['CostAir', SECTOR_MODULE_AIR_COST, true];
			this setVariable ['CostWater', SECTOR_MODULE_WATER_COST, true];
			this setVariable ['ScoreReward', SECTOR_MODULE_SCORE_REWARD, true];
			this synchronizeObjectsAdd [missionNamespace getVariable ['" + _areaVarName + "', objNull]];
		};
	"];
	_sectors pushBack (missionNamespace getVariable [_sectorVarName, objNull]);
};

// synchronize sectors to the main module
_sectors spawn
{
	waitUntil{!isNil "Mission_var_groundSupportModule"};
	Mission_var_groundSupportModule synchronizeObjectsAdd _this;
};
