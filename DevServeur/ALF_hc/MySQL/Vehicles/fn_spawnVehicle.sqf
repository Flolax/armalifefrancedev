#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Sends the query request to the database, if an array is returned then it creates
	the vehicle if it's not in use or dead.
*/
private["_vid","_sp","_pid","_query","_vehicle","_nearVehicles","_name","_dir","_damage"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_sp = [_this,2,[],[[],""]] call BIS_fnc_param;
_unit = [_this,3,objNull,[objNull]] call BIS_fnc_param;
_price = [_this,4,0,[0]] call BIS_fnc_param;
_dir = [_this,5,0,[0]] call BIS_fnc_param;
_spawntext = _this select 6;
_ownerID = _unit GVAR["life_clientID",-1];
_unit_return = _unit;
_name = name _unit;

if(EQUAL(_vid,-1) OR EQUAL(_pid,"")) exitWith {};

_query = format["SELECT id, classname, type, pid, alive, active, plate, gear, fuel, damage, insure FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid];

_queryResult = [_query,2] call HC_fnc_asyncCall;

if(_queryResult isEqualType "") exitWith {};

_vInfo = _queryResult;
if(isNil "_vInfo") exitWith {};
if(EQUAL(count _vInfo,0)) exitWith {};

if(EQUAL(SEL(_vInfo,4),0)) exitWith {};

if(EQUAL(SEL(_vInfo,5),1)) exitWith {};

if(!(_sp isEqualType "")) then {
	_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
} else {
	_nearVehicles = [];
};

if(count _nearVehicles > 0) exitWith {
	[_price,_unit_return] remoteExecCall ["life_fnc_garageRefund",_unit];
	[1,(localize "STR_Garage_SpawnPointError")] remoteExecCall ["life_fnc_broadcast",_unit];
};

_query = format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid];
[_query,1] spawn HC_fnc_asyncCall;

_gear = [_vInfo select 7] call HC_fnc_mresToArray;
_damage = [_vInfo select 9] call HC_fnc_mresToArray;
_new = [(_vInfo select 6)] call HC_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_plate = _new;
_insure = _vInfo select 10;

if(_sp isEqualType "") then {
	_vehicle = createVehicle[(_vInfo select 1),[0,0,999],[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	sleep 0.6;
} else {
	_vehicle = createVehicle [(_vInfo select 1),_sp,[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_vehicle setPos _sp;
	_vehicle setVectorUp (surfaceNormal _sp);
	_vehicle setDir _dir;
};
_vehicle allowDamage true;
[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",_unit];
[_pid,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
_vehicle lock 2;
_vehicle setVariable ["vehicle_info_owners",[[_pid,_name]],true];
_vehicle setVariable ["dbInfo",[_vInfo select 3,_plate,_insure],true];
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
[_vehicle] call life_fnc_clearVehicleAmmo;

_vehicle setFuel (_vInfo select 8);

if (count _gear > 0) then {
	_items = _gear select 0;
	_mags = _gear select 1;
	_weapons = _gear select 2;
	_backpacks = _gear select 3;
	for "_i" from 0 to ((count (_items select 0)) - 1) do {
		_vehicle addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
	};
	for "_i" from 0 to ((count (_mags select 0)) - 1) do {
		_vehicle addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
	};
	for "_i" from 0 to ((count (_weapons select 0)) - 1) do {
		_vehicle addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
	};
	for "_i" from 0 to ((count (_backpacks select 0)) - 1) do {
		_vehicle addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
	};
};

if (count _damage > 0) then {
	_parts = getAllHitPointsDamage _vehicle;

	for "_i" from 0 to ((count _damage) - 1) do {
		_vehicle setHitPointDamage [format["%1",((_parts select 0) select _i)],(_damage select _i)];
	};
};

if((_vInfo select 10) isEqualTo 1) then {
  ["Garage","Votre véhicule est disponible et assuré.","success",false] remoteExec ["ALF_fnc_doMsg",_unit];
  _vehicle animate ["assu",0];
} else {
  ["Garage","Votre véhicule est disponible et non assuré, attention vous n'êtes pas en règle.","warning",false] remoteExec ["ALF_fnc_doMsg",_unit];
  _vehicle animate ["assu",1];
};

_vehicle setObjectTextureGlobal [1, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 0]];
_vehicle setObjectTextureGlobal [2, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 1]];
_vehicle setObjectTextureGlobal [3, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 3]];
_vehicle setObjectTextureGlobal [4, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 4]];
_vehicle setObjectTextureGlobal [5, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 5]];
_vehicle setObjectTextureGlobal [6, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 7]];
_vehicle setObjectTextureGlobal [7, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 8]];
