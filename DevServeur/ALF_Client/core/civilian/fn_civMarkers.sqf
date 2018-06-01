/*
	File: fn_civMarkers.sqf
*/
waitUntil {sleep 0.3; visibleMap};
private["_markers","_members"];
_markers = [];
_members = [];
for "_i" from 0 to 1 step 0 do {
	sleep 0.5;
	_members = units (group player);
	{
		if(_x != player) then {
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorCivilian";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal "Membre";
			_markers pushBack [_marker,_x];
		};
	} forEach _members;
	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit" && !isNull _unit) then {
				  _marker setMarkerPosLocal (visiblePosition _unit);
			};
		} forEach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};
	{deleteMarkerLocal (_x select 0);} forEach _markers;
	_markers = [];
	_members = [];
	if(!visibleMap) exitWith {};
};
