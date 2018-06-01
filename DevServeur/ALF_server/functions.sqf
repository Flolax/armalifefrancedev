#include "script_macros.hpp"
/*
	File: functions.sqf
	Author:

	Description:

*/
TON_fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item in _x) exitWith
		{
			_return = _forEachIndex;
		};
	} forEach _stack;

	_return;
";
publicVariable "TON_fnc_index";

TON_fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;

	{
		if(_x in _valid) then
		{}
		else
		{
			_return = false;
		};
	} forEach _array;
	_return;
";

publicVariable "TON_fnc_isnumber";

TON_fnc_clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player isEqualTo _unit && (group player) isEqualTo _group) then
	{
		life_my_gang = objNull;
		[player] joinSilent (createGroup civilian);
		hint ""Tu as été viré du groupe."";
	};
";

publicVariable "TON_fnc_clientGangKick";

TON_fnc_clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	if(isNil ""_unit"") exitWith {};
	if(player isEqualTo _unit && !(_vehicle in life_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		[""INFO"", format[""Tu as reçu les clés de ce véhicule: %1"",_name], ""success"", false] spawn ALF_fnc_doMsg;
		life_vehicles pushBack _vehicle;
		[getPlayerUID player,_vehicle,1] remoteExecCall [""TON_fnc_keyManagement"",RSERV];
	};
";

publicVariable "TON_fnc_clientGetKey";

TON_fnc_clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player isEqualTo _unit && (group player) isEqualTo _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint ""Tu es maintenant le leader du groupe."";
	};
";

publicVariable "TON_fnc_clientGangLeader";

TON_fnc_clientGangLeft =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player isEqualTo _unit && (group player) isEqualTo _group) then
	{
		life_my_gang = objNull;
		[player] joinSilent (createGroup civilian);
		hint ""Tu as quitté le groupe."";
	};
";

publicVariable "TON_fnc_clientGangLeft";
