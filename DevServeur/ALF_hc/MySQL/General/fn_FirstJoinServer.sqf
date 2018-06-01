/*
	File: fn_FirstJoinServer.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:

*/
private["_uid","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;

//Get to those error checks.
if(_uid isEqualTo "") exitWith {};

_query = format["UPDATE players SET firstSpawn='0' WHERE playerid='%1'",_uid];
[_query,1] call HC_fnc_asyncCall;
