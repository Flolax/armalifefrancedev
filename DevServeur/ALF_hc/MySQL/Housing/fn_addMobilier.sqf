#include "\ALF_hc\hc_macros.hpp"
/*
	File : fn_addmobilier
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
	Add mobilier in Database
*/
private["_mobilierPos","_query","_className","_dir"];
params [
	["_uid","",[""]],
	["_mobilier",objNull,[objNull]]
];

if(isNull _mobilier OR _uid isEqualTo "") exitWith {};

_mobilierPos = getPosATL _mobilier;
_className = typeOf _mobilier;
_dir = [vectorDir _mobilier] + [vectorUp _mobilier];

_query = format["INSERT INTO mobiliers (pid, pos, classname, gear, owned, dir) VALUES('%1', '%2', '%3', '""[]""', '1', '%4')",_uid,_mobilierPos,_className,_dir];
[_query,1] call HC_fnc_asyncCall;

sleep 0.3;

_query = format["SELECT id FROM mobiliers WHERE pos='%1' AND pid='%2' AND owned='1'",_mobilierPos,_uid];
_queryResult = [_query,2] call HC_fnc_asyncCall;

_mobilier setVariable ["mobilier_id",(_queryResult select 0),true];
