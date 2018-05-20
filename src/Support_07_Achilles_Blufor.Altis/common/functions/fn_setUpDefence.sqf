#define GARRISON_BUILDING_BASE_NAME_LIST	["Cargo_HQ_base_F","Cargo_Patrol_base_F","Cargo_Tower_base_F"]
#define CARGO_HQ_BASE_F_POS_IDX_LIST		[4,5,6,7,8]
#define CARGO_PATROL_BASE_F_POS_IDX_LIST	[0,1]
#define CARGO_TOWER_BASE_F_POS_IDX_LIST		[10,11,12,13,14,15,16,17]
#define SIDE_VAR							east
#define POSSIBLE_UNIT_CLASSES				["O_Sharpshooter_F","O_HeavyGunner_F","O_soldier_GL_F","O_soldier_AR_F","O_soldier_M_F","O_soldier_AA_F"]


params ["_centerPos", "_radius", "_isLarge"];
private _buildings = nearestObjects [_centerPos, GARRISON_BUILDING_BASE_NAME_LIST, _radius, true];
if !(_buildings isEqualTo []) then 
{
	private _group = createGroup SIDE_VAR;
	{
		private _building = _x;
		private _posIdxList = switch (true) do
		{
			case (_building isKindOf "Cargo_HQ_base_F"):
			{
				CARGO_HQ_BASE_F_POS_IDX_LIST;
			};
			case (_building isKindOf "Cargo_Patrol_base_F"):
			{
				CARGO_PATROL_BASE_F_POS_IDX_LIST;
			};
			default
			{
				CARGO_TOWER_BASE_F_POS_IDX_LIST;
			};
		};
		_posIdxList = _posIdxList call BIS_fnc_arrayShuffle;
		for "_" from 1 to (ceil random 2) do
		{
			private _posIdx = floor random count _posIdxList;
			private _unit = _group createUnit [selectRandom POSSIBLE_UNIT_CLASSES, [0,0,0], [], 0, "NONE"];
			_unit setPosATL (_building buildingPos (_posIdxList select _posIdx));
			_unit setDir random 360;
			_unit forceSpeed 0;
			_posIdxList deleteAt _posIdx;
		};
	} forEach _buildings;
};

for "_" from 1 to ([1, 2] select _isLarge) do
{
	private _group = [_centerPos, SIDE_VAR, 4] call BIS_fnc_spawnGroup;
	[_group, _centerPos, 50] call BIS_fnc_taskPatrol;
};
