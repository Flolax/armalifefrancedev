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
_R1 = _display displayCtrl 30411;
_R2 = _display displayCtrl 30412;
_R3 = _display displayCtrl 30413;
_R4 = _display displayCtrl 30414;
_R5 = _display displayCtrl 30415;
_R6 = _display displayCtrl 30416;

_R1 ctrlSetText "Rep. moteur";
if("ALF_Boiteaoutils" in (items player)) then {
	_R1 buttonSetAction "";
} else {
	_R1 ctrlEnable false;
};

_R2 ctrlSetText "Rep. technique";
if("ALF_KitMecatechnic" in (items player)) then {
	_R2 buttonSetAction "";
} else {
	_R2 ctrlEnable false;
};

_R3 ctrlSetText "Changer R/Av G";
_R4 ctrlSetText "Changer R/Av D";
_R5 ctrlSetText "Changer R/Ar G";
_R6 ctrlSetText "Changer R/Ar D";
if("ALF_Roue" in (items player)) then {
	_R3 buttonSetAction "";
	_R4 buttonSetAction "";
	_R5 buttonSetAction "";
	_R6 buttonSetAction "";
} else {
	_R3 ctrlEnable false;
	_R4 ctrlEnable false;
	_R5 ctrlEnable false;
	_R6 ctrlEnable false;
};
