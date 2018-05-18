params
[
	["_vehicle", objNull, [objNull]],
	["_base", objNull, [objNull]]
];
private _vehicleClass = typeOf _vehicle;

if (isNull _vehicle) exitWith
{
	["[x] Cannot re-setup the vehicle upon respawn!"] call bis_fnc_error;
};

//setup vehicle lock
[_vehicle,"init"] call bis_fnc_moduleMPTypeGroundSupportBase_lockHelicopter;

//gather info about helicopter initial state
_vehicle setVariable ["bis_initDamage",damage _vehicle,true];
_vehicle setVariable ["bis_initFuel",fuel _vehicle,true];
_vehicle setVariable ["bis_initMagazines",_vehicle call bis_fnc_moduleMPTypeGroundSupportBase_getVehicleAmmo,true];

//resupply vehicle
_vehicle call bis_fnc_moduleMPTypeGroundSupportBase_resupplyVehicle;

//clear vehicle cargo
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

// Kex: save pylon and paintjob
private _pylonMagazines = getPylonMagazines _vehicle;
private _paintjobs = getObjectTextures _vehicle;

// Kex: turn off engineOn
_vehicle engineOn false;

private _group = group _vehicle;

//add even handler: GetIn & GetOut
_vehicle setVariable ["bis_crewGroup",_group,true];
_vehicle addEventHandler ["GetIn",bis_fnc_moduleMPTypeGroundSupportBase_onVehicleEntered];
_vehicle addEventHandler ["GetOut",bis_fnc_moduleMPTypeGroundSupportBase_onVehicleLeft];
//add even handler: RopeAttach to flag sling loaded cargo with last owner
_vehicle addEventHandler ["RopeAttach", { if ((_this select 2) isKindOf "ReammoBox_F") then { (_this select 2) setVariable ["BIS_lastSlingloadOwner", driver (_this select 0), true]; }; }];

//start vehicle simulation
_vehicle setVelocity [0,0,1];

// Kex: replaced the FSM with event handlers
/////////////////////////////////////////////////////
	//start the helicopter fsm
	_fsm = [_vehicle,_base] execFSM "GroundSupportBase\fsms\helicopter.fsm";
	_vehicle setVariable ["bis_fsm",_fsm,true];

	waitUntil{sleep 1; completedFSM _fsm;};
/////////////////////////////////////////////////////
/*
// add event handlers which trigger the respawn
private _ehIdHandleDamage = _vehicle addEventHandler ["HandleDamage", {params ["_vehicle"]; if !(canMove _vehicle) then {[_vehicle] call BIS_fnc_moduleMPTypeGroundSupportBase_onVehicleFubar}}];
private _ehIdFuel = _vehicle addEventHandler ["Fuel", {params ["_vehicle", "_fuelState"]; systemChat str _fuelState; if !(_fuelState) then {[_vehicle] call BIS_fnc_moduleMPTypeGroundSupportBase_onVehicleFubar}}];
private _ehIdDeleted = _vehicle addEventHandler ["Deleted", {[param[0]] call BIS_fnc_moduleMPTypeGroundSupportBase_onVehicleFubar}];
_vehicle setVariable ["BIS_var_groundSupport_vehicleEhs", [[_ehIdHandleDamage,"HandleDamage"], [_ehIdFuel,"Fuel"], [_ehIdDeleted,"Deleted"]]];

//["[i] Vehicle is going to respawn: _vehicle = %1 | _base = %2 | _vehicleClass = %3",_vehicle,_base,_vehicleClass] call bis_fnc_logFormat;

//respawn helicopter
_vehicle setVariable ["BIS_var_groundSupport_respawnParams", [_base ,_vehicleClass, _pylonMagazines, _paintjobs]];
*/

// Kex: replaced the FSM with event handlers
/////////////////////////////////////////////////////
	[_base ,_vehicleClass, _pylonMagazines, _paintjobs] call bis_fnc_moduleMPTypeGroundSupportBase_respawnVehicle;
/////////////////////////////////////////////////////