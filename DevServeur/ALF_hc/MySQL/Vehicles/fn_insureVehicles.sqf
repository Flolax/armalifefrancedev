#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_insureVehicles.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
	Insure vehicles
*/
private["_vid","_pid","_query"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_unit = _this select 2;

_query = format["UPDATE vehicles SET insure='1' WHERE pid='%1' AND id='%2'",_pid,_vid];
[_query,1] call HC_fnc_asyncCall;

["Assurance","Tu as assuré ton véhicule, tu es en règle.","success",false] remoteExec ["ALF_fnc_doMsg",_unit];
