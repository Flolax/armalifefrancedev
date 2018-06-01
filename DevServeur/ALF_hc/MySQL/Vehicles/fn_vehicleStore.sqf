#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_vehicleStore.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Stores the vehicle in the 'Garage'
*/
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_vehItems","_vehMags","_vehWeapons","_vehBackpacks","_cargo","_storetext","_fuel","_damage"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_unit = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_storetext = [_this,2,"",[""]] call BIS_fnc_param;
_ownerID = _unit getVariable ["life_clientID",-1];

if(isNull _vehicle OR isNull _unit) exitWith {life_garage_store = false; _ownerID publicVariableClient "life_garage_store";};
_vInfo = _vehicle getVariable["dbInfo",[]];

// not persistent so just do this!
if(count _vInfo isEqualTo 0) exitWith {
	[1,(localize "STR_Garage_Store_NotPersistent")] remoteExecCall ["life_fnc_broadcast",_ownerID];
	life_garage_store = false;
	_ownerID publicVariableClient "life_garage_store";
};

if(count _vInfo > 0) then {
	_plate = _vInfo select 1;
	_plate = [_plate] call HC_fnc_mresArray;
	_uid = _vInfo select 0;
};

if(_uid != getPlayerUID _unit) exitWith {
	[1,(localize "STR_Garage_Store_NoOwnership")] remoteExecCall ["life_fnc_broadcast",_ownerID];
	life_garage_store = false;
	_ownerID publicVariableClient "life_garage_store";
};

// save damage.
_damage = getAllHitPointsDamage _vehicle;
_damage = _damage select 2;
_damage = [_damage] call HC_fnc_mresArray;

// save cargo?
_vehItems = getItemCargo _vehicle;
_vehMags = getMagazineCargo _vehicle;
_vehWeapons = getWeaponCargo _vehicle;
_vehBackpacks = getBackpackCargo _vehicle;
_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
if((count (_vehItems select 0) isEqualTo 0) && (count (_vehMags select 0) isEqualTo 0) && (count (_vehWeapons select 0) isEqualTo 0) && (count (_vehBackpacks select 0) isEqualTo 0)) then {_cargo = [];};
_cargo = [_cargo] call HC_fnc_mresArray;

// save fuel
_fuel = (fuel _vehicle);

_query = format["UPDATE vehicles SET active='0', fuel='%3', damage='%4', gear='%5' WHERE pid='%1' AND plate='%2'",_uid , _plate, _fuel, _damage, _cargo];
_thread = [_query,1] call HC_fnc_asyncCall;

if(!isNil "_vehicle" && {!isNull _vehicle}) then {
	deleteVehicle _vehicle;
};

life_garage_store = false;
_ownerID publicVariableClient "life_garage_store";
[1,_storetext] remoteExecCall ["life_fnc_broadcast",_ownerID];
