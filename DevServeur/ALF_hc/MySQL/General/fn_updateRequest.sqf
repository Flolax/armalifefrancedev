/*
	File: fn_updateRequest.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Updates ALL player information in the database.
	Information gets passed here from the client side file: core\session\fn_updateRequest.sqf
*/
private["_uid","_cash","_bank","_licenses","_gear","_stats","_position","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_cash = [_this,1,0,[0]] call BIS_fnc_param;
_licenses = [_this,2,[],[[]]] call BIS_fnc_param;
_gear = [_this,3,[],[[]]] call BIS_fnc_param;
_stats = [_this,4,[100,100,0,0],[[]]] call BIS_fnc_param;
_position = [_this,7,[],[[]]] call BIS_fnc_param;

//Get to those error checks.
if(_uid isEqualTo "") exitWith {};

//Parse and setup some data.
_gear = [_gear] call HC_fnc_mresArray;
_stats = [_stats] call HC_fnc_mresArray;
_cash = [_cash] call HC_fnc_numberSafe;
_position = [_position] call HC_fnc_mresArray;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
	_bool = [(_licenses select _i) select 1] call HC_fnc_bool;
	_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call HC_fnc_mresArray;

_query = format["UPDATE players SET cash='%1', licenses='%2', gear='%3', arrested='%4', stats='%5', alive='%6', position='%7' WHERE playerid='%8'",
_cash,
_licenses,
_gear,
[_this select 5] call HC_fnc_bool,
_stats,
[_this select 6] call HC_fnc_bool,
_position,
_uid];

_queryResult = [_query,1] call HC_fnc_asyncCall;
