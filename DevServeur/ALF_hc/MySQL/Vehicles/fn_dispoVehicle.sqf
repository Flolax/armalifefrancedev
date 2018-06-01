#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_dispoVehicle.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
*/
private["_classname","_unit","_query","_queryresult"];
_classname = _this select 0;
_unit = _this select 1;

_query = format["SELECT dispo FROM shop WHERE classname='%1'",_classname];
_queryresult = [_query,2] call HC_fnc_asyncCall;

_dispo = _queryresult select 0;
[_classname,_dispo] remoteExec ["life_fnc_dispoVehicle",_unit];
