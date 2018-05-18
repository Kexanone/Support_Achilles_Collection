params ["_base", "_class", "_pylonMagazines", "_paintjobs"];

//["[i] Vehicle respawn called: _base = %1 | _vehicleClass = %2",_base,_vehicleClass] call bis_fnc_logFormat;

private _respawnPoints = (_base getVariable ["respawnPoints",[]]) select {(str _x) select [0, count _class] == _class};

if (count _respawnPoints == 0) exitWith
{
	format["[x] Base |%1| doesn't have respawn points defined!",_base] call bis_fnc_error;
};

_respawnPoints = _respawnPoints call BIS_fnc_arrayShuffle;
private _emptyPoint = objNull;
private _vehicle = objNull;
waitUntil
{
	sleep 1;
	
	// Kex: time-critical: switch to unscheduled environment
	isNil
	{
		_emptyPoint = [_respawnPoints, _vehicle] call BIS_fnc_moduleMPTypeGroundSupportBase_selectRespawnPoint;
		if !(isNull _emptyPoint) then
		{
			_vehicle = createVehicle [_class,getPos _emptyPoint,[],0,"NONE"];
			_vehicle setDir (getDir _emptyPoint);
			_vehicle setVectorUp [0,0,1];
			_vehicle setPosATL (getPosATL _emptyPoint);
		}
		else
		{
			["[x] There is no empty respawn point for side %1!",_base getVariable ["side",[]]] call bis_fnc_logFormat;
		};
	};
	!(isNull _emptyPoint)
};

// Kex: set pylon and paintjob
{_vehicle setPylonLoadOut [_forEachIndex + 1, _x]} forEach _pylonMagazines;
{_vehicle setObjectTextureGlobal [_forEachIndex, _x]} forEach _paintjobs;

//_gVar = format["bis_heli%1",round random 1000];
//missionNamespace setVariable [_gVar,_vehicle,true];
//["[i] Vehicle |%4| respawned at base: _base = %1 | _vehicle = %2 | _class = %3",_base,_vehicle,_class,_gVar] call bis_fnc_logFormat;

[_vehicle,_base] spawn bis_fnc_moduleMPTypeGroundSupportBase_setupVehicle;

//play notification to the side about new helicopter being deployed
["PlaySentenceGlobal", [_base getVariable "side", "10_NewChopper", false]] call BIS_fnc_moduleMPTypeGroundSupport_playSentence;