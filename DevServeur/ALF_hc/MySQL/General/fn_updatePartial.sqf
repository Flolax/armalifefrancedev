/*
	File: fn_updatePartial.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Takes partial data of a player and updates it, this is meant to be
	less network intensive towards data flowing through it for updates.
*/
private["_uid","_value","_value1","_value2","_mode","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,2,-1,[0]] call BIS_fnc_param;

if(_uid isEqualTo "") exitWith {}; //Bad.
_query = "";

switch(_mode) do {
	case 0: {
		_value = [_this,1,0,[0]] call BIS_fnc_param;
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE players SET cash='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 1: {
		_value = [_this,1,[],[[]]] call BIS_fnc_param;
		//Does something license related but I can't remember I only know it's important?
		for "_i" from 0 to count(_value)-1 do {
			_bool = [(_value select _i) select 1] call HC_fnc_bool;
			_value set[_i,[(_value select _i) select 0,_bool]];
		};
		_value = [_value] call HC_fnc_mresArray;
		_query = format["UPDATE players SET licenses='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 2: {
		_value = [_this,1,[],[[]]] call BIS_fnc_param;
		_value = [_value] call HC_fnc_mresArray;
		_query = format["UPDATE players SET gear='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 3: {
		_value = [_this,1,false,[true]] call BIS_fnc_param;
		_value = [_value] call HC_fnc_bool;
		_value2 = [_this,3,[],[[]]] call BIS_fnc_param;
		_value2 = if(count _value2 isEqualTo 3) then {_value2} else {[0,0,0]};
		_value2 = [_value2] call HC_fnc_mresArray;
		_query = format["UPDATE players SET alive='%1', position='%2' WHERE playerid='%3'",_value,_value2,_uid];
	};

	case 4: {
		_value = [_this,1,false,[true]] call BIS_fnc_param;
		_value = [_value] call HC_fnc_bool;
		_query = format["UPDATE players SET arrested='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 5: {
		_array = [_this,1,[],[[]]] call BIS_fnc_param;
		[_uid,_array,0] remoteExecCall ["TON_fnc_keyManagement",RSERV];
	};

	////////////////// Bank System + Hsbc ///////////////////
	case 6: {
		_value = [_this,1,0,[0]] call BIS_fnc_param;
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE bank SET livreta='%1' WHERE playerid='%2'",_value,_uid];
	};
	case 7: {
		_value = [_this,1,0,[0]] call BIS_fnc_param;
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE bank SET livretb='%1' WHERE playerid='%2'",_value,_uid];
	};
	case 8: {
		_value = [_this,1,0,[0]] call BIS_fnc_param;
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE bank SET livretc='%1' WHERE playerid='%2'",_value,_uid];
	};
	case 9: {
		_value1 = [_this,1,0,[0]] call BIS_fnc_param;
		_value1 = [_value1] call HC_fnc_numberSafe;
		_value2 = [_this,3,0,[0]] call BIS_fnc_param;
		_value2 = [_value2] call HC_fnc_numberSafe;
		_value3 = [_this,4,0,[0]] call BIS_fnc_param;
		_value3 = [_value3] call HC_fnc_numberSafe;
		_query = format["UPDATE bank SET livreta='%1', livretb='%2', livretc='%3' WHERE playerid='%4'",_value1,_value2,_value3,_uid];
	};
	case 10: {
		_value = [_this,1,0,[0]] call BIS_fnc_param;
		_value = [_value] call HC_fnc_numberSafe;
		_query = format["UPDATE hsbc SET soldehsbc='%1' WHERE playerid='%2'",_value,_uid];
	};
	/////////////////////////////////////////////////

};

if(_query isEqualTo "") exitWith {};

[_query,1] call HC_fnc_asyncCall;