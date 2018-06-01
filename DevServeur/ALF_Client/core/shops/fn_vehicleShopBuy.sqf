#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_vIndex","_spawnPoints","_className","_purchasePrice","_classNameLife","_spawnPoint","_vehicle","_vehicleList","_licenses","_licensesName","_exit"];
_mode = SEL(_this,0);
_exit = false;
if((lbCurSel 2302) isEqualTo -1) exitWith {hint localize "STR_Shop_Veh_DidntPick";closeDialog 0;};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_classNameLife = _className;
_vehicleList = M_CONFIG(getArray,"CarShops",SEL(life_veh_shop,0),"vehicles");
_licenses = M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"licenses");
_purchasePrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_classNameLife,"achat");

_licensesName = "";
{
	if(!(EQUAL(_x,"")) && {!(LICENSE_VALUE(_x))}) then {
		ADD(_licensesName,localize M_CONFIG(getText,"Licenses",_x,"displayName") + "<br/>");
		_exit = true;
	};
} forEach _licenses;

if(_exit) exitWith {hint parseText format[(localize "STR_Shop_Veh_NoLicense")+ "<br/><br/>%1",_licensesName];closeDialog 0;};

if(_purchasePrice < 0) exitWith {closeDialog 0;}; //Bad price entry
if(life_cash < _purchasePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_purchasePrice - life_cash] call life_fnc_numberText];closeDialog 0;};

_spawnPoints = SEL(life_veh_shop,1);
_spawnPoint = "";

if((SEL(life_veh_shop,0) isEqualTo "med_air_hs")) then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) isEqualTo 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(_spawnPoints isEqualType []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) isEqualTo 0) exitWith {_spawnPoint = _x};} forEach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) isEqualTo 0) exitWith {_spawnPoint = _spawnPoints};
	};
};

if(EQUAL(_spawnPoint,"")) exitWith {hint localize "STR_Shop_Veh_Block"; closeDialog 0;};
life_cash = life_cash - _purchasePrice;
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText];

[_className] remoteExec ["HC_fnc_buyVehicle",HC_Life];

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) isEqualTo "med_air_hs") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	sleep 0.6;
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle setPos (getMarkerPos _spawnPoint);
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
};
_vehicle lock 2;
[_vehicle] call life_fnc_clearVehicleAmmo;
[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
_vehicle disableTIEquipment true;
_vehicle animate ["assu",1];

_vehicle allowDamage true;

life_vehicles pushBack _vehicle;

[getPlayerUID player,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
if(_mode) then {
	[(getPlayerUID player),_vehicle] remoteExecCall ["HC_fnc_vehicleCreate",HC_Life];
};

[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;
