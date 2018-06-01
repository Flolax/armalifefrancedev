#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_inventoryClosed.sqf
	Author: Bryan "Tonic" Boardwine
	Modified : NiiRoZz

	Description:
	1 : Used for syncing house mobilier data but when the inventory menu
	is closed a sync request is sent off to the server.
	2 : Used for syncing vehicle inventory when save vehicle gear are activated
*/
private "_obj";
_obj = param [1,objNull,[objNull]];
if(isNull _obj) exitWith {}; //MEH

if((typeOf _obj) in ALF_Mobiliers_Objects) exitWith {
	[_obj] remoteExecCall ["HC_fnc_updateHousemobiliers",HC_Life];
	[2] call SOCK_fnc_updatePartial;
};

if((_obj isKindOf "Car") || (_obj isKindOf "Air") || (_obj isKindOf "Ship")) then {
	[_obj,1] remoteExecCall ["HC_fnc_vehicleUpdate",HC_Life];
};

[2] call SOCK_fnc_updatePartial;
