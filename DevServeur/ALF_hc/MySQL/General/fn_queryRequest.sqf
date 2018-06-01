#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Handles the incoming request and sends an asynchronous query
	request to the database.

	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private _uid = [_this,0,"",[""]] call BIS_fnc_param;
private _ownerID = [_this,1,objNull,[objNull]] call BIS_fnc_param;

if(isNull _ownerID) exitWith {};
//													0				1			2			3						4					5					6						7				8			9				10			11				12			13
private _query = format["SELECT playerid, name, cash, adminlevel, premium, coplevel, mediclevel, licenses, gear, stats, arrested, alive, position, firstspawn FROM players WHERE playerid='%1'",_uid];
private _queryResult = [_query,2] call HC_fnc_asyncCall;

if(_queryResult isEqualType "") exitWith {
	[] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

if(count _queryResult isEqualTo 0) exitWith {
	[] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

//Blah conversion thing from a2net->extdb
private _tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call HC_fnc_numberSafe];

//Licenses
private _new = [(_queryResult select 7)] call HC_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_queryResult set[7,_new];
//Convert tinyint to boolean
private _old = _queryResult select 7;
for "_i" from 0 to (count _old)-1 do {
	private _data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call HC_fnc_bool)]];
};
_queryResult set[7,_old];

//player gear
_new = [(_queryResult select 8)] call HC_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_queryResult set[8,_new];

//player_stats
_new = [(_queryResult select 9)] call HC_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_queryResult set[9,_new];

//arrested
_queryResult set[10,([_queryResult select 10,1] call HC_fnc_bool)];

//Position
_queryResult set[11,([_queryResult select 11,1] call HC_fnc_bool)];
_new = [(_queryResult select 12)] call HC_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_queryResult set[12,_new];

//FirstJoin?
_queryResult set[13,([_queryResult select 13,1] call HC_fnc_bool)];

//Phone
private _phonequery = format ["SELECT time, number, contacts, time FROM phone WHERE playerid='%1'",_uid];
private _phoneresult = [_phonequery,2] call HC_fnc_asyncCall;
if(count _phoneresult > 0) then {
	private _phonetime = [_phoneresult select 0] call HC_fnc_numberSafe;
	private _phonenumber = _phoneresult select 1;
	private _phonecontact = [(_phoneresult select 2)] call HC_fnc_mresToArray;
	if(_phonecontact isEqualType "") then {_phonecontact = call compile format["%1", _phonecontact];};
	private _phonefinal = [_phonetime,_phonenumber,_phonecontact];
	_queryResult set[14,_phonefinal];
} else {
	_queryResult set[14,[]];
};

//house set 15
private _houseData = _uid spawn HC_fnc_fetchPlayerHouses;
waitUntil {scriptDone _houseData};
_queryResult pushBack (missionNamespace getVariable[format["houses_%1",_uid],[]]);

//gang set 16
_gangData = _uid spawn HC_fnc_queryPlayerGang;
waitUntil{scriptDone _gangData};
_queryResult pushBack (missionNamespace getVariable[format["gang_%1",_uid],[]]);

//key vehicles set 17
life_keyreceived = false;
life_keyreceivedvar = [];
[_uid] remoteExecCall ["TON_fnc_recupkeyforHC",RSERV];
waitUntil {life_keyreceived};
private _keyArr = life_keyreceivedvar;
_queryResult set[17,_keyArr];

//Bank System
private _bankquery = format ["SELECT numacc, livreta, laactive, livretb, lbactive, livretc, lcactive, activecb FROM bank WHERE playerid='%1'",_uid];
private _bankresult = [_bankquery,2] call HC_fnc_asyncCall;
if(count _bankresult > 0) then {
	_bankresult set[0,_bankresult select 0];
	_tmp = _bankresult select 1;
	_bankresult set[1,[_tmp] call HC_fnc_numberSafe];
	_bankresult set[2,([_bankresult select 2,1] call HC_fnc_bool)];
	_tmp = _bankresult select 3;
	_bankresult set[3,[_tmp] call HC_fnc_numberSafe];
	_bankresult set[4,([_bankresult select 4,1] call HC_fnc_bool)];
	_tmp = _bankresult select 5;
	_bankresult set[5,[_tmp] call HC_fnc_numberSafe];
	_bankresult set[6,([_bankresult select 6,1] call HC_fnc_bool)];
	_queryResult set[18,_bankresult];
} else {
	_queryResult set[18,[]];
};

//Hsbc System
private _hsbcquery = format ["SELECT numacc, soldehsbc, hsbcactive FROM hsbc WHERE playerid='%1'",_uid];
private _hsbcresult = [_hsbcquery,2] call HC_fnc_asyncCall;
if(count _hsbcresult > 0) then {
	_hsbcresult set[0,_hsbcresult select 0];
	_tmp = _hsbcresult select 1;
	_hsbcresult set[1,[_tmp] call HC_fnc_numberSafe];
	_hsbcresult set[2,([_hsbcresult select 2,1] call HC_fnc_bool)];
	_queryResult set[19,_hsbcresult];
} else {
	_queryResult set[19,[]];
};

//Station set 20
private _stationData = _uid spawn HC_fnc_fetchPlayerStations;
waitUntil {scriptDone _stationData};
_queryResult pushBack (missionNamespace getVariable[format["stations_%1",_uid],[]]);

_queryResult remoteExec ["SOCK_fnc_requestReceived",_ownerID];
