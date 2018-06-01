/*
	File : fn_updateHousemobiliers.sqf
	Author: NiiRoZz

	This file is for Nanou's HeadlessClient.

	Description:
	Update inventory "i" in mobilier
*/
private["_mobilierID","_mobiliers","_query","_vehItems","_vehMags","_vehWeapons","_vehBackpacks","_cargo"];
_mobilier = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _mobilier) exitWith {};
_mobilierID = _mobilier getVariable["mobilier_id",-1];
if(_houseID isEqualTo -1) exitWith {};

_vehItems = getItemCargo _mobilier;
_vehMags = getMagazineCargo _mobilier;
_vehWeapons = getWeaponCargo _mobilier;
_vehBackpacks = getBackpackCargo _mobilier;
_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];

_cargo = [_cargo] call HC_fnc_mresArray;

_query = format["UPDATE mobiliers SET gear='%1' WHERE id='%2'",_cargo,_mobilierID];

[_query,1] call HC_fnc_asyncCall;
