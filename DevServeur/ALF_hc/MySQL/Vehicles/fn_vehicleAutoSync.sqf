#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_vehicleAutoSync.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
	Server-side position script on vehicles.
	Sort of a lame way but whatever.
*/
for "_i" from 0 to 1 step 0 do {
	sleep (5 * 60);
	{
		private _protect = false;
		private _veh = _x;
		if(!isNil {_veh getVariable "NPC"} && {_veh getVariable "NPC"}) then {_protect = true;};
		if((alive _veh) && {!(_protect)}) then {
			private _dbInfo = _veh getVariable["dbInfo",[]];
			if(count _dbInfo > 0) then {
				private _fuel = fuel _veh;
				private _pos = getPosATL _veh;
				private _dir =  getDir _veh;
				private _position = [[_pos,_dir]] call HC_fnc_mresArray;
				private _damage = getAllHitPointsDamage _veh;
				_damage = _damage select 2;
				_damage = [_damage] call HC_fnc_mresArray;
				private _vehItems = getItemCargo _veh;
				private _vehMags = getMagazineCargo _veh;
				private _vehWeapons = getWeaponCargo _veh;
				private _vehBackpacks = getBackpackCargo _veh;
				private _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
				if((count (_vehItems select 0) isEqualTo 0) && (count (_vehMags select 0) isEqualTo 0) && (count (_vehWeapons select 0) isEqualTo 0) && (count (_vehBackpacks select 0) isEqualTo 0)) then {
					_cargo = [];
				};
				_cargo = [_cargo] call HC_fnc_mresArray;
				private _uid = _dbInfo select 0;
				private _plate = _dbInfo select 1;
				_plate = [_plate] call HC_fnc_mresArray;
				private _query = format["UPDATE vehicles SET fuel='%3', position='%4', damage='%5', gear='%6' WHERE pid='%1' AND plate='%2'",_uid,_plate,_fuel,_position,_damage,_cargo];
				[_query,1] call HC_fnc_asyncCall;
			};
		};
	} forEach (allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship" + allMissionObjects "Armored" + allMissionObjects "Submarine");
};
