#include "\ALF_hc\hc_macros.hpp"
/*
	File : fn_fetchPlayerHouses.sqf
	Author: Bryan "Tonic" Boardwine
	Modified : NiiRoZz

	This file is for Nanou's HeadlessClient.

	Description:
	1. Fetches all the players houses and sets them up.
	2. Fetches all the players mobiliers and sets them up.
*/
private["_query","_mobiliers","_mobilierss","_houses"];
params [
	["_uid","",[""]]
];
if(_uid isEqualTo "") exitWith {};

_query = format["SELECT pid, pos, classname, gear, dir, id FROM mobiliers WHERE pid='%1' AND owned='1'",_uid];
_mobiliers = [_query,2,true] call HC_fnc_asyncCall;

_mobilierss = [];
{
	_position = call compile format["%1",_x select 1];
	_house = nearestObject [_position, "House"];
	_direction = call compile format["%1",_x select 4];
	_owner = _x select 0;
	_id = _x select 5;
	_gear = [_x select 3] call HC_fnc_mresToArray;
	if(_gear isEqualType "") then {_gear = call compile format["%1", _gear];};
	_mobilier = createVehicle[(_x select 2),[0,0,999],[],0,"NONE"];
	waitUntil {!isNil "_mobilier" && {!isNull _mobilier}};
	_mobilierss pushBack _mobilier;
	_mobilier allowDamage false;
	_mobilier setPosATL _position;
	_mobilier setVectorDirAndUp _direction;
	//Fix position for more accurate positioning
	_posX = (_position select 0);
	_posY = (_position select 1);
	_posZ = (_position select 2);
	_currentPos = getPosATL _mobilier;
	_fixX = (_currentPos select 0) - _posX;
	_fixY = (_currentPos select 1) - _posY;
	_fixZ = (_currentPos select 2) - _posZ;
	_mobilier setPosATL [(_posX - _fixX), (_posY - _fixY), (_posZ - _fixZ)];
	_mobilier setVectorDirAndUp _direction;
	_mobilier setVariable ["mobilier_owner",[_owner],true];
	_mobilier setVariable ["mobilier_id",_id,true];
	clearWeaponCargoGlobal _mobilier;
	clearItemCargoGlobal _mobilier;
	clearMagazineCargoGlobal _mobilier;
	clearBackpackCargoGlobal _mobilier;
	if (count _gear > 0) then {
		_items = _gear select 0;
		_mags = _gear select 1;
		_weapons = _gear select 2;
		_backpacks = _gear select 3;
		for "_i" from 0 to ((count (_items select 0)) - 1) do {
			_mobilier addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
		};
		for "_i" from 0 to ((count (_mags select 0)) - 1) do{
			_mobilier addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
		};
		for "_i" from 0 to ((count (_weapons select 0)) - 1) do{
			_mobilier addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
		};
		for "_i" from 0 to ((count (_backpacks select 0)) - 1) do{
			_mobilier addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
		};
	};
	_house setVariable ["mobiliers",_mobilierss,true];
} forEach _mobiliers;

_query = format["SELECT pid, pos FROM houses WHERE pid='%1' AND owned='1'",_uid];
_houses = [_query,2,true] call HC_fnc_asyncCall;

_return = [];
{
	_pos = call compile format["%1",_x select 1];
	_house = nearestObject [_pos, "House"];
	_house allowDamage false;
	_return pushBack [_x select 1,_mobilierss];
} forEach _houses;

missionNamespace setVariable [format["houses_%1",_uid],_return];
