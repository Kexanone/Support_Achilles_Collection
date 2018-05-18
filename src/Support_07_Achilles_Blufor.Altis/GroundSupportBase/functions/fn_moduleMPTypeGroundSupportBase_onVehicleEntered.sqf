/*
vehicle: Object - Vehicle the event handler is assigned to
position: String - Can be either "driver", "gunner", "commander" or "cargo"
unit: Object - Unit that entered the vehicle
*/

private["_vehicle","_position","_unit","_crewGroup"];

_vehicle  = [_this,0,objNull,[objNull]] call bis_fnc_param;
_position = [_this,1,"",[""]] call bis_fnc_param;
_unit     = [_this,2,objNull,[objNull]] call bis_fnc_param;

if (isNull _vehicle || isNull _unit || _position == "") exitWith
{
	["[x][%1|%2|%3] Event script 'GetIn' failed!",_vehicle,_position,_unit] call bis_fnc_error;
};

if !(isPlayer _unit) exitWith {};

if (driver _vehicle != _unit) exitWith
{
	["[i][%1|%2|%3] Wrong vehicle seat entered!",_vehicle,_position,_unit] call bis_fnc_logFormat;
	moveOut _unit;
};

// Kex: if the player has not the correct slot:
private _requiredClass = ["_pilot_", "_helipilot_"] select (_vehicle isKindOf "Helicopter" || {_vehicle isKindOf "VTOL_Base_F"});
if ((toLower typeOf _unit) find  _requiredClass == -1) exitWith
{
	moveOut _unit;
	"You are not trained for this aircraft!" remoteExecCall ["hint", _unit];
};

//a player is entering vehicle occupied by another player
private["_anotherPlayer"];

_anotherPlayer = false;

{
	if (isPlayer _x) exitWith {_anotherPlayer = true};
}
forEach ((crew _vehicle) - [_unit]);

if (_anotherPlayer) exitWith
{
	//["[i][%1|%2|%3] Another player is already in the vehicle!",_vehicle,_position,_unit] call bis_fnc_logFormat;
	moveOut _unit;
};

//join in the crew group
private _prevGroup = group _unit;
_crewGroup = _vehicle getVariable ["bis_crewGroup",grpNull];
if !(isNull _crewGroup) then
{
	[_unit] joinSilent _crewGroup;
	_unit assignAsDriver _vehicle;
	deleteGroup _prevGroup;

	//make player the leader of the group
	[[[_crewGroup,_unit],
	{
		(_this select 0) selectLeader (_this select 1);
	}
	],"bis_fnc_call",leader _crewGroup] call bis_fnc_MP;
}
else
{
	// Kex: required for jets
	_vehicle setVariable ["bis_crewGroup", _prevGroup, true];
};
/*
_vehicle setVariable ["bis_driver", _unit, true];
//
private _ehIdGetOut = _vehicle addEventHandler ["GetOut", {params["_vehicle", "", "_unit"]; [_vehicle] remoteExecCall ["BIS_fnc_moduleMPTypeGroundSupportBase_onVehicleFubar", 2]}];
private _vehicleEhs = _vehicle getVariable ["BIS_var_groundSupport_vehicleEhs", []];
_vehicleEhs pushBack [_ehIdGetOut,"GetOut"];
_vehicle setVariable ["BIS_var_groundSupport_vehicleEhs", _vehicleEhs];
*/
