#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_silentGearSave.sqf
	Author: ALF Nanou
*/
private ["_unit","_container"];
_unit = _this select 0;
_container = _this select 1;
if(isNull _unit) exitWith {};

if((typeOf _container) in ALF_Mobiliers_Objects) exitWith {
	[_container] remoteExecCall ["HC_fnc_updateHousemobiliers",HC_Life];
	[2] call SOCK_fnc_updatePartial;
};

if((_container isKindOf "Car") || (_container isKindOf "Air") || (_container isKindOf "Ship")) then {
	[_container,1] remoteExecCall ["HC_fnc_vehicleUpdate",HC_Life];
};

[2] call SOCK_fnc_updatePartial;
