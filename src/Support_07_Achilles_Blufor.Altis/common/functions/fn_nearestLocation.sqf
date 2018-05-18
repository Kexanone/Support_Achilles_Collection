/*
	Author: 
		Karel Moricky, optimised by Killzone_Kid

	Description:
		Returns description of the given position relative to nearest location (e.g. "E of Kavala)

	Parameter(s):
		0: Position (See BIS_fnc_position for supported formats or [])

	Returns:
		STRING - position description
*/

params
[
	["_position", cameraOn, [[]], 3],
	["_locationTypes", [], [[]]]
];

// switch to PositionAGL
_position = _position call BIS_fnc_position;

private _location = locationNull;
if (_locationTypes isEqualTo []) then
{
	_location = nearestLocation [_position, ""];
}
else
{
	private _mapCenter = worldSize / 2;

	//--- find the nearest to the given position location with text 
	{
		if !(text _x isEqualTo "") exitWith {_location = _x};
	} 
	forEach nearestLocations 
	[
		[_mapCenter, _mapCenter],
		["NameVillage", "NameCity", "NameCityCapital", "NameLocal", "NameMarine"],
		sqrt (2 * _mapCenter ^ 2),
		_position
	];

	//--- no suitable location exists
	if (isNull _location) exitWith 
	{
		format 
		[
			localize "STR_A3_BIS_fnc_locationDescription_grid", 
			mapGridPosition _position
		]
	};

	//--- location exists and close
	if (_position in _location) exitWith 
	{
		format 
		[
			localize "STR_A3_BIS_fnc_locationDescription_near", 
			text _location
		]
	};
};
_location;
