/*--------------------------------------------------------------------------------------------------

	INIT PLANE & EVAC SKIN CLEAN-UP

--------------------------------------------------------------------------------------------------*/

{
	// initialize planes
	private _base = _x;
	{
		[_x, _base] spawn bis_fnc_moduleMPTypeGroundSupportBase_setupVehicle;
	} forEach ([_base, ["Plane"], false] call BIS_fnc_synchronizedObjects);
	/*
	// add evac sink clean-up
	{
		{
			_x addEventHandler ["GetIn", {deleteVehicle param[2]}];
		} forEach ([_x,["Car"],false] call BIS_fnc_synchronizedObjects);
	} forEach ([_base, ["LocationEvacPoint_F"], true] call BIS_fnc_synchronizedObjects);
	*/
} forEach (allMissionObjects "ModuleMPTypeGroundSupportBase_F");

/*--------------------------------------------------------------------------------------------------

	SET ENEMY TICKETS

--------------------------------------------------------------------------------------------------*/

[independent, west call BIS_fnc_respawnTickets] call BIS_fnc_respawnTickets;
