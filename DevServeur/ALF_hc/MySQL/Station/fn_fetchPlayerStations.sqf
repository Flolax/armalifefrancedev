#include "\ALF_hc\hc_macros.hpp"
/*
	File : fn_fetchPlayerStation.sqf
	Author: ALF Nanou
*/
private["_query","_stations"];
params [
	["_uid","",[""]]
];
if(_uid isEqualTo "") exitWith {};

_query = format["SELECT pid, pos FROM station WHERE pid='%1' AND owned='1'",_uid];
_stations = [_query,2,true] call HC_fnc_asyncCall;

_return = [];
{
	_pos = call compile format["%1",_x select 1];
	_station = nearestObject [_pos, "House"];
	_station allowDamage false;
	_return pushBack [_x select 1];
} forEach _stations;

missionNamespace setVariable [format["stations_%1",_uid],_return];
