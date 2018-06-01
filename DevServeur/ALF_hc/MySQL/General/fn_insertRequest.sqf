#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_insertRequest.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Does something with inserting... Don't have time for
	descriptions... Need to write it...
*/
private["_queryResult","_query"];
params [
	"_uid",
	"_name",
	["_money",-1,[0]],
	["_returnToSender",objNull,[objNull]]
];

//Error checks
if((_uid isEqualTo "") OR (_name isEqualTo "")) exitWith {};
if(isNull _returnToSender) exitWith {};

_query = format["SELECT playerid, name FROM players WHERE playerid='%1'",_uid];

_queryResult = [_query,2] call HC_fnc_asyncCall;

//Double check to make sure the client isn't in the database...
if(_queryResult isEqualType "") exitWith {[] remoteExecCall ["SOCK_fnc_dataQuery",_returnToSender];}; //There was an entry!
if(count _queryResult != 0) exitWith {[] remoteExecCall ["SOCK_fnc_dataQuery",_returnToSender];};

//Clense and prepare some information.
_name = [_name] call HC_fnc_mresString; //Clense the name of bad chars.
_money = [_money] call HC_fnc_numberSafe;

//Prepare the query statement..
_query = format["INSERT INTO players (playerid, name, cash, licenses, gear) VALUES('%1', '%2', '%3','""[]""','""[]""')",
	_uid,
	_name,
	_money
];

[_query,1] call HC_fnc_asyncCall;
[] remoteExecCall ["SOCK_fnc_dataQuery",_returnToSender];
