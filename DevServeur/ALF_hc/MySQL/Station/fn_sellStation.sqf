/*
	File: fn_sellStation.sqf
	Author: ALF Nanou

	This file is for Nanou's HeadlessClient.
*/
private["_station","_stationID","_ownerID","_stationPos","_query","_radius","_containers"];
_station = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _station) exitWith {};

_stationID = _station getVariable["station_id",-1];
if(_stationID isEqualTo -1) then {
	_stationPos = getPosATL _station;
	_ownerID = (_station getVariable "station_owner") select 0;
	_query = format["UPDATE station SET owned='0', pos='[]', bank='0' WHERE pid='%1' AND pos='%2' AND owned='1'",_ownerID,_stationPos];
} else {
	_query = format["UPDATE station SET owned='0', pos='[]', bank='0' WHERE id='%1'",_stationID];
};

_station setVariable ["station_id",nil,true];
_station setVariable ["station_owner",nil,true];

[_query,1] call HC_fnc_asyncCall;
_station setVariable ["station_sold",nil,true];
["CALL deleteOldStations",1] call HC_fnc_asyncCall;