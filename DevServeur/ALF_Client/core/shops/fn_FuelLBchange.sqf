#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_fuelLBChange.sqf
	Author: NiiRoZz

	Description:
	Change when slide change. That descripotion
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl"];
_control = SEL(_this,0);
_index = SEL(_this,1);

//Fetch some information.
_className = _control lbData _index;
_vIndex = _control lbValue _index;
_vehicle = (vehiclefuelList select _vindex) select 0;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;

_fuel = fuel _vehicle;
_fueltank = SEL(_vehicleInfo,11);
ctrlShow [20330,true];

(CONTROL(20300,20303)) ctrlSetStructuredText parseText format[
	(localize "STR_Shop_Veh_UI_Fuel")+ " %1l<br/>" +
	(localize "STR_Fuel_Tank_Vehicle")+ " %2l",
	_fueltank,
	round(_fueltank * _fuel)
];

{
	slidersetRange [_x,(floor(_fuel * _fueltank)),_fueltank];
} forEach [20901];

{
	sliderSetPosition[_x ,(floor(_fuel * _fueltank))];
} forEach [20901];

ctrlSetText [20323,format ["Total : %1$",life_fuelPrices * ((SliderPosition 20901) -(floor(_fuel * _fueltank))) ]];
true;