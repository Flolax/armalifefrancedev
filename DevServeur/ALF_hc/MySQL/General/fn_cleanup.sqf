#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_cleanup.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Server-side cleanup script on vehicles.
	Sort of a lame way but whatever.
*/
private "_deleted";
_deleted = false;
for "_i" from 0 to 1 step 0 do {
	private["_veh","_units","_fuel"];
	sleep (30 * 60);
	{
		_protect = false;
		_veh = _x;
		_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");

		if(!isNil {_veh getVariable "NPC"} && {_veh getVariable "NPC"}) then {_protect = true;};

		if((_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) && {!(_protect)}) then {
			_dbInfo = _veh getVariable["dbInfo",[]];
			_units = {(_x distance _veh < 300)} count playableUnits;
			_fuel = fuel _veh;
			_pos = getPosATL _veh;
			_dir =  getDir _veh;
			_position = [[_pos,_dir]] call HC_fnc_mresArray;
			_damage = getAllHitPointsDamage _veh;
			_damage = _damage select 2;
			_damage = [_damage] call HC_fnc_mresArray;
			if(count crew _x isEqualTo 0) then {
				switch (true) do {
					case ((_x getHitPointDamage "HitEngine") > 0.7 && _units isEqualTo 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitLFWheel") > 0.98 && _units isEqualTo 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitLF2Wheel") > 0.98 && _units isEqualTo 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitRFWheel") > 0.98 && _units isEqualTo 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitRF2Wheel") > 0.98 && _units isEqualTo 0) : {deleteVehicle _x; _deleted = true;};
					//case (_units isEqualTo 0): {deleteVehicle _x; _deleted = true;};
				};
			};

			if(_deleted) then {
				waitUntil {isNull _veh};
				_deleted = false;
			};

			if(isNull _veh) then {
				if(count _dbInfo > 0) then {
					_uid = _dbInfo select 0;
					_plate = _dbInfo select 1;

					_query = format["UPDATE vehicles SET active='0', fuel='%3', position='%4', damage='%5' WHERE pid='%1' AND plate='%2'",_uid,_plate,_fuel,_position,_damage];

					[_query,1] call HC_fnc_asyncCall;
				};
			};
		};
	} forEach vehicles;

	sleep (3 * 60); //3 minute cool-down before next cycle.
	{
		if((typeOf _x) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"]) then {
			deleteVehicle _x;
		};
	} forEach (allMissionObjects "Thing");

	sleep (2 * 60);
	{
		if ((count (magazineCargo _x)) < 1) then {
			deleteVehicle _x;
		};
	} forEach (allMissionObjects "GroundWeaponHolder");
};
