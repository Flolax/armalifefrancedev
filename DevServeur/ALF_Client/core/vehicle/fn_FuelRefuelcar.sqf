#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_RefuelCar.sqf
	Author: NiiRoZz

	Description:
	Add fuel in car.
*/
disableSerialization;
private["_classname","_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl","vehiclefuelList"];
_classname = lbData[20302,(lbCurSel 20302)];
_index =  lbvalue[20302,(lbCurSel 20302)];

if (isNil "_classname" || _classname isEqualTo "") exitWith {
	hint localize "STR_Select_Vehicle_Pump";
	vehiclefuelList = [];
	life_action_inUse = false;
	closeDialog 0;
};

private _car = (vehiclefuelList select _index) select 0;
_vehicleInfo = [_className]call life_fnc_fetchVehInfo;
private _fuelNow = fuel _car;
private _fueltank = (_vehicleInfo select 11);
private _fueltoput= ((SliderPosition 20901)-(floor(_fuelnow * _fueltank)));
private _setfuell = _fuelnow + (_fueltoput/_fueltank);
private _timer = ((_fueltoput * .25)/100);
if (_car distance player > 10 && vehicle player != player) exitWith {
	hint localize "STR_Distance_Vehicle_Pump";
	vehiclefuelList = [];
	life_action_inUse = false;
	closeDialog 0;
};

private _exit = false;
if(life_cash < (_fueltoput * life_fuelPrices)) then {
	private _handle = [(_fueltoput * life_fuelPrices)] spawn ALF_fnc_handleCB;
	if (!_handle) exitWith {["Carte Bancaire", "Le paiement a été refusé.", "danger", false] spawn ALF_fnc_doMsg; _exit = true;};
} else {
	life_cash = life_cash - (_fueltoput * life_fuelPrices);
	[0] call SOCK_fnc_updatePartial;
};
if(_exit) exitWith {};

life_is_processing = true;
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNameSpace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%","Refuel:"];
_progress progressSetPosition 0.01;
private _cP = 0.01;
private _tp =0;
private _totalcost = _fueltoput * life_fuelPrices;
for "_i" from 0 to 1 step 0 do {
	sleep  _timer;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Refuel:"];
	if(_cP >= 1) exitWith {};
	if(player distance _car > 10) exitWith {};
	if(vehicle player != player) exitWith {};
	_tp = _tp +1;
	if (_tp isEqualTo 9) then {
		_tp = 0;
		[_car,_cp * _setfuell] remoteExecCall ["life_fnc_setFuel",_car];
	};
};
5 cutText ["","PLAIN"];
if (_car distance player > 10 || vehicle player != player) then {
	hint localize "STR_Distance_Vehicle_Pump";
	vehiclefuelList = [];
	life_is_processing = false;
	life_action_inUse = false;
	[0] call SOCK_fnc_updatePartial;
	closeDialog 0;
} else {
	life_is_processing = false;
	[0] call SOCK_fnc_updatePartial;
};


vehiclefuelList = [];
life_action_inUse = false;
closeDialog 0;
