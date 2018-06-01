#include "\ALF_Client\script_macros.hpp"
/*
File: fn_menuVehicle.sqf
Author: ALF Team
Description:

*/
private["_display"];
_veh = _this select 0;
_isVehicle = if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};

if(!dialog) then {
	createDialog "vmenu_dialog";
};
disableSerialization;
_display = findDisplay 30200;

if(_veh isKindOf "Car") then {
	if(life_coplevel isEqualTo 0) then {[_veh] spawn ALF_fnc_showCivBtn;};
	[_veh] spawn ALF_fnc_showCarStats;
	[_veh] spawn ALF_fnc_showCarBtn;
};
