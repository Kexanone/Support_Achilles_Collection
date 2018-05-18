#define DELETION_TIME_BASE		9
#define DELETION_TIME_OUTSIDE	45

params ["_vehicle"];
systemChat str "Triggered";

// prevent multiple execution
if (isNull _vehicle) exitWith {};
if (_vehicle getVariable ["BIS_groundSupport_isFubar", false]) exitWith {};
_vehicle setVariable ["BIS_groundSupport_isFubar", true];
// remove all Ehs
private _vehicleEhs = _vehicle getVariable ["BIS_var_groundSupport_vehicleEhs", []];
{_x params ["_id", "_type"]; _vehicle removeEventHandler [_type, _id]} forEach _vehicleEhs;

// play sentence
["PlaySentenceGlobal", [side _unit, "65_ChopperDown", false]] call BIS_fnc_moduleMPTypeGroundSupport_playSentence;

// evacuate the crew
private _unit = _vehicle getVariable ["bis_driver", objNull];
private _group = _vehicle getVariable ["bis_crewGroup", grpNull];
if (isNull _group) then {_group = group _unit};
private _respawnParams = _vehicle getVariable ["BIS_var_groundSupport_respawnParams", [objNull, "", [], []]];
_respawnParams params ["_base"];

if (count units _group > 1 and {_unit in units _group}) then
{
	[_unit] joinSilent (createGroup side _unit);
};
systemChat str "Evac";
[_group, _base] spawn bis_fnc_moduleMPTypeGroundSupportBase_evacGroup;

// delete and respawn the vehicle
private _deletionTime = [DELETION_TIME_BASE, DELETION_TIME_OUTSIDE] select (_base distance _vehicle > 180);
[_vehicle, _deletionTime] spawn {params["_vehicle", "_deletionTime"]; sleep _deletionTime; if !(isNull _vehicle) then {deleteVehicle _vehicle}};
_respawnParams spawn bis_fnc_moduleMPTypeGroundSupportBase_respawnVehicle;
