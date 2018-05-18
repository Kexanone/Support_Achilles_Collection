params ["_respawnPoints", ["_objectToRespawn", objNull, [objNull]]];
private _emptyPoint = objNull;

{
	_point = _x;
	_objects = (nearestObjects [_point, ["Car","Air"], 15]) - [_objectToRespawn];
	_objects append ((nearestObjects [_point, ["CAManBase"], 15]) select {alive _x});

	if (count _objects == 0) exitWith
	{
		_emptyPoint = _point;
	};
}
forEach _respawnPoints;

_emptyPoint;
