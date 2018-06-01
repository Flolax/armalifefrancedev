#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_dispoVehicle.sqf
	Author: ALF Team
*/
disableSerialization;
private["_className","_dispo","_display","_btnbye","_btnrent"];
_className = _this select 0;
_dispo = _this select 1;

_display = findDisplay 2300;
_btnbye = _display displayCtrl 2309;
_btnrent = _display displayCtrl 2308;

_classNameLife = _className;

_achat = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_classNameLife,"achat");

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_maxspeed = _vehicleInfo select 7;
_horsepower = _vehicleInfo select 10;
_passengerseats = _vehicleInfo select 9;
_fuel = _vehicleInfo select 11;
_armor = _vehicleInfo select 8;

ctrlShow [2330,true];
(CONTROL(2300,2303)) ctrlSetStructuredText parseText format[
	(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b'>%1€</t><br/>" +
	(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>%2€</t><br/>Type de plaque: <t color='#8cff9b'>Française</t><br/>" +
	(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>" +
	(localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>" +
	(localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>" +
	(localize "STR_Shop_Veh_UI_Fuel")+ " %6<br/>" +
	(localize "STR_Shop_Veh_UI_Armor")+ " %7<br/><br/>Disponibilité: %8",
	[round(_achat / 3)] call life_fnc_numberText,
	[_achat] call life_fnc_numberText,
	_maxspeed,
	_horsepower,
	_passengerseats,
	_fuel,
	_armor,
	if(_dispo isEqualTo 0) then {"<t color='#FF0000'>Stock épuisé</t>"} else {format["<t color='#8cff9b'>%1 restant(s)</t>",_dispo]}
];

if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _classNameLife)) then {
	_classNameLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_className];
};

if(_className in (LIFE_SETTINGS(getArray,"vehicleShop_rentalOnly"))) then {
	if(_dispo > 0) then {_btnrent ctrlEnable true;};
} else {
	if(_dispo > 0) then {_btnbye ctrlEnable true;};
};
