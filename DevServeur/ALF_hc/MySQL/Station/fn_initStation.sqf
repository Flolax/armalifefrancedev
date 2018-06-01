/*
	File: fn_initStation.sqf
	Author: ALF Nanou

	This file is for Nanou's HeadlessClient.
*/
private["_queryResult","_query","_count"];
_count = (["SELECT COUNT(*) FROM station WHERE owned='1'",2] call HC_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	_query = format["SELECT station.id, station.pid, station.pos, players.name FROM station INNER JOIN players WHERE station.owned='1' AND station.pid = players.playerid LIMIT %1,10",_x];
	_queryResult = [_query,2,true] call HC_fnc_asyncCall;
	if(count _queryResult isEqualTo 0) exitWith {};
	{
		_pos = call compile format["%1",_x select 2];
		_house = nearestObject [_pos, "House"];
		_house setVariable ["station_owner",[_x select 1,_x select 3],true];
		_house setVariable ["station_id",_x select 0,true];
	} forEach _queryResult;
};
