#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_spawnVehicleLaunch.sqf
	Author: ALF Team
	This file is for Nanou's HeadlessClient.

	Description:
	Spawn Vehicle when server start by ALF Team.
*/

_count = (["SELECT COUNT(*) FROM vehicles WHERE alive='1' AND active='1'",2] call HC_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	//Etape 1: On recupere les véhicules sorties. active = 1;
	//                                   0      				  1     				2     					3        				4     					   5      				6						 7						8
	_query = format["SELECT vehicles.classname, vehicles.pid, vehicles.plate, vehicles.gear, vehicles.position, vehicles.fuel, vehicles.damage, players.name, vehicles.insure
	 FROM vehicles
	 INNER JOIN players
	 WHERE players.playerid = vehicles.pid
	 AND vehicles.active = '1' AND vehicles.alive = '1' LIMIT %1,10",_x];
	_queryResult = [_query,2,true] call HC_fnc_asyncCall;
	if(count _queryResult isEqualTo 0) exitWith {};

	{
		//Etape 2: On définie les variables.
		_vInfo = _x;
		_pid = _vInfo select 1;
		_name = _vInfo select 7;
		_plate = _vInfo select 2;

		_gear = [_vInfo select 3] call HC_fnc_mresToArray;
		if(_gear isEqualType "") then {_gear = call compile format["%1", _gear];};

		_position = [_vInfo select 4] call HC_fnc_mresToArray;
		if(_position isEqualType "") then {_position = call compile format["%1", _position];};

		_fuel = _vInfo select 5;

		_damage = [_vInfo select 6] call HC_fnc_mresToArray;
		if(_damage isEqualType "") then {_damage = call compile format["%1", _damage];};

		_sp = _position select 0;
		_dir = _position select 1;
		_insure = _vInfo select 8;

		//Compil plate
		_new = [(_plate)] call HC_fnc_mresToArray;
		if(_new isEqualType "") then {_new = call compile format["%1", _new];};
		_plate = _new;

		//Etape 3: On applique !
		_vehicle = createVehicle[(_vInfo select 0),[0,0,999],[],0,"NONE"];
		waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
		_vehicle allowDamage false;
		_vehicle setPosATL _sp;
		_vehicle setDir _dir;
		_vehicle setFuel _fuel;
		_vehicle allowDamage true;
		_vehicle lock 2;

		_vehicle setVariable ["vehicle_info_owners",[[_pid,_name]],true];
		_vehicle setVariable ["dbInfo",[_pid,_plate,_insure],true];
		_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
		[_vehicle] call life_fnc_clearVehicleAmmo;

		[_pid,_vehicle] remoteExecCall ["TON_fnc_addkeyforHC",RSERV];

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

		_parts = getAllHitPointsDamage _vehicle;
		for "_i" from 0 to ((count _damage) - 1) do {
		_vehicle setHitPointDamage [format["%1",((_parts select 0) select _i)],(_damage select _i)];
		};

		if (_insure isEqualTo 1) then { _vehicle animate ["assu",0]; } else { _vehicle animate ["assu",1]; };

		_vehicle setObjectTextureGlobal [1, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 0]];
		_vehicle setObjectTextureGlobal [2, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 1]];
		_vehicle setObjectTextureGlobal [3, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 3]];
		_vehicle setObjectTextureGlobal [4, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 4]];
		_vehicle setObjectTextureGlobal [5, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 5]];
		_vehicle setObjectTextureGlobal [6, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 7]];
		_vehicle setObjectTextureGlobal [7, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 8]];

	} forEach _queryResult;
};
