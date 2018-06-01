/*
	File: fn_createPhoneNumber.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:

*/
private["_uid","_nb","_nbf","_query","_queryresult"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_unit = [_this,1,objNull,[objNull]] call BIS_fnc_param;

sleep 1;
_nb = random[10000000, 50000000, 99999999];
_nb = [_nb] call HC_fnc_numberSafe;
_nbf = format["06%1", _nb];

_query = format["SELECT number FROM phone WHERE number='%1'",_nbf];
_queryresult = [_query,2] call HC_fnc_asyncCall;

if((count _queryresult) isEqualTo 0) then {
	_query = format["UPDATE phone SET number='%1' WHERE playerid='%2'",_nbf,_uid];
	[_query,1] call HC_fnc_asyncCall;
	_unit setVariable ["myPhoneNumber",[_uid,_nbf],true];
} else {
	[_uid,_unit] call HC_fnc_createPhoneNumber;
};
