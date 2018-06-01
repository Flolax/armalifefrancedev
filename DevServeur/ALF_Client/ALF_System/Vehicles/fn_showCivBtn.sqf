#include "\ALF_Client\script_macros.hpp"
/*
File: fn_showCarBtn.sqf
Author: ALF Team
Description:

*/
private["_veh"];
_veh = _this select 0;
life_vInact_curTarget = _veh;
disableSerialization;
_display = findDisplay 30200;
_Btn1 = _display displayCtrl 30401;
_Btn2 = _display displayCtrl 30402;
_Btn3 = _display displayCtrl 30403;
_Btn4 = _display displayCtrl 30404;
_Btn5 = _display displayCtrl 30405;
_Btn6 = _display displayCtrl 30406;
_Btn7 = _display displayCtrl 30407;

_Btn1 ctrlSetText "Bump";
if(alive _veh && {count crew _veh isEqualTo 0} && {canMove _veh}) then {
	_Btn1 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
} else {
	_Btn1 ctrlEnable false;
};

_Btn2 ctrlSetText "Ejecter du vehicule";
_locked = locked _veh;
if((_veh in life_vehicles && speed _veh < 5 && player distance _veh < 8) || (_locked isEqualTo 2 && speed _veh < 5 && player distance _veh < 8)) then {
	_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
} else {
	_Btn2 ctrlEnable false;
};

_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
