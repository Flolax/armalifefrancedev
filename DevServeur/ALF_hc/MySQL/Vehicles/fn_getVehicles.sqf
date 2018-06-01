#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_getVehicles.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Sends a request to query the database information and returns vehicles.
*/
private["_pid","_type","_unit","_ret","_queryResult","_plate"];
_pid = [_this,0,"",[""]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;
_unit = [_this,2,objNull,[objNull]] call BIS_fnc_param;

//Error checks
if(_pid isEqualTo "" OR _type isEqualTo "" OR isNull _unit) exitWith {
	if(!isNull _unit) then {
		[[]] remoteExec ["life_fnc_impoundMenu",_unit];
	};
};

_query = format["SELECT id, classname, type, pid, alive, active, plate, fuel, insure FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND type='%2'",_pid,_type];

_queryResult = [_query,2,true] call HC_fnc_asyncCall;

if(_queryResult isEqualType "") exitWith {
	[[]] remoteExec ["life_fnc_impoundMenu",_unit];
};

//plate
{
	_plate = [(_x select 6)] call HC_fnc_mresToArray;
	if(_plate isEqualType "") then {_plate = call compile format["%1", _plate];};
	_x set[6,_plate];
} forEach _queryResult;

[_queryResult] remoteExec ["life_fnc_impoundMenu",_unit];
