#include "initBriefing.hpp"

// add the intro music
["intro", "onPreloadFinished",
{
	// play the intro music
	playMusic (selectRandom ["EventTrack01_F_Jets", "LeadTrack01_F_Jets", "LeadTrack02_F_Jets"]);
	// if High Command: open the HC menu
	if (player == missionNamespace getVariable ["Mission_var_HcUnit", objNull]) then
	{
		hcShowBar true;
	};
}, []] call BIS_fnc_addStackedEventHandler;

// add maintainance action
[player, BIS_Base_Blufor] call Mission_fnc_carrier_addMaintainanceAction;
player addEventHandler ["Respawn",{[param[0], BIS_Base_Blufor] call Mission_fnc_carrier_addMaintainanceAction}];

// save custom inventories
[player, [missionNamespace, "mission_var_loadout"]] call BIS_fnc_saveInventory;

/*
// add killed EH
player addEventHandler ["Killed", {params ["_unit"]; private _vehicle = vehicle _unit; if (_unit != _vehicle) then {[_vehicle] remoteExecCall ["BIS_fnc_moduleMPTypeGroundSupportBase_onVehicleFubar", 2]}}];
*/