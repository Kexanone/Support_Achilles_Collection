/*--------------------------------------------------------------------------------------------------

	RELOCATE THE CARRIER

--------------------------------------------------------------------------------------------------*/

/*
if (isServer) then
{
	private _carrierPosition = call Mission_fnc_carrier_getPos;
	if (this distance _carrierPosition > 1000) then
	{
		private _carrierPosDiff =  _carrierPosition vectorDiff getPosWorld this;
		{
			_x setPosWorld (_carrierPosDiff vectorAdd getPosWorld _x);
		} forEach (nearestObjects [getPos this, [], 300]);
		[this] call BIS_fnc_Carrier01PosUpdate;
	};
};
*/


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

[east, west call BIS_fnc_respawnTickets] call BIS_fnc_respawnTickets;

diag_log "tfadfadf";
