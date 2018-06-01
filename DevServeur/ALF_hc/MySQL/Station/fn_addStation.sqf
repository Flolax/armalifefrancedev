#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_addStation.sqf
	ALF Nanou

	This file is for Nanou's HeadlessClient.
*/
private["_stationPos","_query"];
params [
	["_uid","",[""]],
	["_station",objNull,[objNull]]
];
if(isNull _station OR _uid isEqualTo "") exitWith {};

_stationPos = getPosATL _station;

_query = format["INSERT INTO stations (pid, pos, owned) VALUES('%1', '%2', '1')",_uid,_stationPos];
[_query,1] call HC_fnc_asyncCall;

sleep 0.3;

_query = format["SELECT id FROM stations WHERE pos='%1' AND pid='%2' AND owned='1'",_stationPos,_uid];
_queryResult = [_query,2] call HC_fnc_asyncCall;

_station setVariable ["station_id",(_queryResult select 0),true];
