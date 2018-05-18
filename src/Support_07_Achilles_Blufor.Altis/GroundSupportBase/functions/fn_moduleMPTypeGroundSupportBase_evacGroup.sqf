/*--------------------------------------------------------------------------------------------------

	FUNCTION IS MEANT TO RUN ON SERVER

--------------------------------------------------------------------------------------------------*/
private["_player","_units","_vehicle","_fakePlayer","_t","_pos","_dir","_posATL"];
private _group   	= _this select 0;
private _base    	= _this select 1;

//exit if group or base is not valid
if (isNull _group || {isNull _base}) exitWith {};

//flag group as 'evacing'
// if (_group getVariable ["bis_evacing",false]) exitWith {};
// _group setVariable ["bis_evacing",true,true];

//debug
/*
{
	["[i] %1 | %2 | %3 | %4 | DMG: %5",_x,typeOf _x,["dead","alive"] select (alive _x),["cannot move","can move"] select (canMove _x),damage _x,["non-player","player"] select (isPlayer _x)] call bis_fnc_logFormat;
}
forEach (units _group);
*/

_player  = objNull;
_vehicle = objNull;
_fakePlayer = objNull;
_units   = units _group;

{
	if (isPlayer _x) then {_player = _x};
	if (vehicle _x != _x) then {_vehicle = vehicle _x};
}
forEach _units;

//remove player from operations for the crew
_units = _units - [_player,objNull];

//get pos & dir for dummy player
if (!isNull _vehicle) then
{
	_pos = getPos _vehicle;
	_dir = getDir _vehicle;
}
else
{
	_pos = getPos leader _group;
	_dir = getDir leader _group;
};

//do black in on player & wait
if (!isNull _player && {alive _player}) then
{
	_pos = getPos _player;
	_posATL = getPosATL _player;
	_dir = getDir _player;

	[["bis_evac",true,0.5],"BIS_fnc_blackOut",_player] call bis_fnc_MP; sleep 0.75;

	//move player out
	[[_player,_base],"bis_fnc_moduleMPTypeGroundSupportBase_hidePlayer",_player] call bis_fnc_mp;

	//wait for the player to be really out
	if (!isNull _vehicle && {vehicle _player == _vehicle}) then
	{
		//["[ ] Player |%1| is still in the vehicle |%2|.",_player,_vehicle] call bis_fnc_logFormat;

		waitUntil{vehicle _player == _player};

		//["[ ] Player |%1| left vehicle |%2|.",_player,_vehicle] call bis_fnc_logFormat;
	};

	//create replacement of the player
	_group = createGroup (side group _player);
	_fakePlayer = _group createUnit [typeOf _player, _pos, [], 0, "FORM"];
	_fakePlayer setDir _dir;
	_fakePlayer enableFatigue false;
	_fakePlayer allowFleeing 0;

	//do the player's part
	[[_fakePlayer,_base,_vehicle],"bis_fnc_moduleMPTypeGroundSupportBase_respawnPlayer",_player] call bis_fnc_mp;

	//move non-player units to the dummy player group
	{
		[_x] joinSilent _group;
	}
	forEach _units;

	//update units array
	_units = units _group;

	//update the vehicle group flag
	_vehicle setVariable ["bis_crewGroup",_group];

	//move dummy player into the vehicle
	_fakePlayer assignAsDriver _vehicle;
	[_fakePlayer] orderGetIn true;
	_fakePlayer moveInDriver _vehicle;

	//wait for the dummy driver to get in
	if (!isNull _vehicle && {vehicle _fakePlayer != _vehicle}) then
	{
		//["[ ] Fake player |%1| is still not in the vehicle |%2|.",_fakePlayer,_vehicle] call bis_fnc_logFormat;

		waitUntil{vehicle _fakePlayer == _vehicle};

		//["[ ] Fake player |%1| got into the vehicle |%2|.",_fakePlayer,_vehicle] call bis_fnc_logFormat;
	};
};

//start garbage collector on the group
_group call bis_fnc_moduleSpawnAI_startGarbageCollector;

//make sure the group is local to server
if (!local _group || {!local _vehicle}) then
{
	//["[ ] Locality of group |%1| is going to move to server.",_group] call bis_fnc_logFormat;
	_group setGroupOwner 2;

	waitUntil
	{
		sleep 0.1;
		(local _group && {{!local _x} count (units _group) == 0}) && {(isNull _vehicle || {(!isNull _vehicle && {local _vehicle && {{!local _x} count (crew _vehicle) == 0}})})}
	};

	//["[ ] Locality of group |%1| was changed to server.",_group] call bis_fnc_logFormat;

	/*
	["[x] Owner of group %1: %2",_group,groupOwner _group] call bis_fnc_logFormat;
	{
		["[x] Owner of unit %1: %2",_x,owner _x] call bis_fnc_logFormat;
	}
	forEach (units _group);
	["[x] Owner of vehicle %1: %2",_vehicle,owner _vehicle] call bis_fnc_logFormat;
	*/
};

//group is not in the vehicle
if (isNull _vehicle) then
{
	_fakePlayer setPosATL _posATL;
	_fakePlayer setDir _dir;
};

//send the crew and the dummy player out of the vehicle
if !(isNull _vehicle) then
{
	if (1 == getNumber (configfile >> "CfgVehicles" >> typeOf _vehicle >> "EjectionSystem" >> "EjectionSeatEnabled")) then
	{
		[_vehicle] remoteExecCall ["BIS_fnc_PlaneEjection", _vehicle];
	}
	else
	{
		{
			if (alive _x) then
			{
				//["[ ] Unit |%1| unassigned and commanded out of the vehicle |%2|.",_x,_vehicle] call bis_fnc_logFormat;

				unassignVehicle _x;
				commandGetOut _x;
				// note: isTouchingGround can be true even if both ATL and ASL z are > 15 (e.g. carrier)
				if (!isTouchingGround _vehicle && {getPosATL _vehicle select 2 > 15 && {getPosASL _vehicle select 2 > 15}}) then
				{
						moveOut _x;
						sleep 1;
						// if the unit already has a chute
						if (backpack _x != "" and {getText (configfile >> "CfgVehicles" >> backpack _x >> "backpackSimulation") isEqualTo "ParachuteSteerable"}) then
						{
							_x action ["openParachute"];
						} else
						{
							private _chute = "Steerable_Parachute_F" createVehicle [0,0,0];
							_chute setPosATL (getPosATL _x);
							_chute setDir (getDir _x);
							_chute setVelocity (velocity _x);
							_x moveInDriver _chute;
						};
				};
			};
		} forEach _units; _units = _units - [objNull];

		_units orderGetIn false;
		_group leaveVehicle _vehicle;
	};
	/*
	_t = time + 10;

	waitUntil{({vehicle _x != _vehicle} count _units == 0) || {time > _t}};

	//delete the crew that did not get out of the vehicle in time
	if (time > _t) then
	{
		{
			if (vehicle _x == _vehicle) then
			{
				//["[i] Unit |%1| is stuck in crashed |%2| in time and will be deleted!",_x,_vehicle] call bis_fnc_logFormat;
				[_vehicle,_x] call bis_fnc_deleteVehicleCrew;
			};
		}
		forEach _units;
	};
	*/
};

if (!isNull _group && count units _group > 0) then
{
	[_group, (getPosATL leader _group vectorDiff [100, 0, 0])] remoteExecCall ["move", leader _group];
};
/*
sleep 20;
// delete the group
if (!isNull _group && count units _group > 0) then
{
	{if !(isPlayer _x) then {deleteVehicle _x}} forEach units _group;
};
deleteGroup _group;
// delete vehicle
deleteVehicle _vehicle;
*/