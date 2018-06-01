#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_buyVehicle.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
*/
private["_classname","_query","_queryresult","_dispo","_newdispo"];
_classname = _this select 0;

_query = format["SELECT dispo FROM shop WHERE classname='%1'",_classname];
_queryresult = [_query,2] call HC_fnc_asyncCall;

_dispo = _queryresult select 0;

_newdispo = _dispo - 1;
if(_newdispo < 0) then {_newdispo = 0;};

_query = format["UPDATE shop SET dispo='%1' WHERE classname='%2'",_newdispo,_classname];
[_query,1] call HC_fnc_asyncCall;
