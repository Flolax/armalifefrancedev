/*
	File: fn_initStation.sqf
	Author: ALF Nanou
*/
if(count life_stations isEqualTo 0) exitWith {}; //Nothing to do.

{
	_position = call compile format["%1",_x select 0];
	_house = nearestObject [_position, "House"];
	_house setVariable ["uid",round(random 99999),true];

	_marker = createMarkerLocal [format["station_%1",(_house getVariable "uid")],_position];
	_marker setMarkerTextLocal "Station Total";
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Fuelstation";
} forEach life_stations;
