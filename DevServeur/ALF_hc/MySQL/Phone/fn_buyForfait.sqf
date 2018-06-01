#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_buyForfait.sqf
	Author: ALF Team
	Description:

*/
private["_uid","_mode","_metod","_time","_query","_unit"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,1,[0]] call BIS_fnc_param;
_unit = [_this,2,objNull,[objNull]] call BIS_fnc_param;

_metod = 0;
_time = 0;

//On check si il existe
_query = format["SELECT offre, time FROM phone WHERE playerid='%1'",_uid];
private _queryResult = [_query,2] call HC_fnc_asyncCall;

if (count _queryResult isEqualTo 0) then {
	_metod = 2;
} else {
	_metod = 1;
	_time = _queryResult select 1;
};

switch (_metod) do {
	case 1 : {
		switch (_mode) do {
			case 1 : {
				_time = _time + (60 * 24);
			};
			case 2 : {
				_time = _time + (60 * 24) * 3;
			};
			case 3 : {
				_time = _time + (60 * 24) * 7;
			};
			case 4 : {
				_time = _time + (60 * 24) * 14;
			};
		};
		_query = format["UPDATE phone SET offre='1', time='%1' WHERE playerid='%2'",_time,_uid];
	};
	case 2 : {
		switch (_mode) do {
			case 1 : {
				_time = (60 * 24);
			};
			case 2 : {
				_time = (60 * 24) * 3;
			};
			case 3 : {
				_time = (60 * 24) * 7;
			};
			case 4 : {
				_time = (60 * 24) * 14;
			};
		};
		_query = format["INSERT INTO phone (playerid, offre, time, contacts) VALUES ('%1', '1', '%2','""[]""')",_uid,_time];
		[_uid,_unit] spawn HC_fnc_createPhoneNumber;
	};
};

[_query,1] call HC_fnc_asyncCall;

[_time] remoteExecCall ["ALF_fnc_updateForfait",_unit];
