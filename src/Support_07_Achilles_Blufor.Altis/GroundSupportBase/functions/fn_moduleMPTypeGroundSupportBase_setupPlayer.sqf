//["[ ] setupPlayer.sqf input: %1",_this] call bis_fnc_logFormat;

_this spawn
{
	waitUntil {!isNull player && {isPlayer player} && {alive player}};
	waitUntil {player getvariable ["bis_fnc_selectRespawnTemplate_respawned",false]};

	_this params["_player",["_body",objNull]];

	//dispose of the dead player body
	if (!isNull _body) then
	{
		deleteVehicle _body;
	};

	private["_base","_distance","_bases"];

	_bases = allMissionObjects "ModuleMPTypeGroundSupportBase_F";

	waitUntil
	{
		sleep 0.1;

		_base = objNull;
		_distance = 10e10;

		{
			if (player distance _x < _distance) then
			{
				_distance = player distance _x;
				_base = _x;
			};
		}
		forEach _bases;

		!(isNull _base)
	};

	if (isNull _base) exitWith
	{
		["[x][%1] Player unit cannot detect base upon respawn!",player] call bis_fnc_error;
	};

	player setVariable ["bis_base",_base,true];

	(group player) call bis_fnc_moduleSpawnAI_startGarbageCollector;

	//reset bonus score counter
	player setVariable ["bis_bonusScore",0,true];

	//remove all possible waypoints player might have
	while {count waypoints (group player) > 0} do {deleteWaypoint [(group player),0];};
	
	// Kex: replaced the FSM with event handlers
	/////////////////////////////////////////////////////
		player setVariable ["bis_fsm",[_base] execFSM "\A3\Missions_F_Heli\MPTypes\GroundSupportBase\fsms\player.fsm"];
	/////////////////////////////////////////////////////
};