#include "\ALF_Client\script_macros.hpp"
/*
File: updateForfait
Author: ALF Team
*/
private _time = _this select 0;
if (isNil "_time") exitWith {};

life_forfait = _time;

if !(isNull (findDisplay 15000)) then {
	[] call ALF_fnc_menuForfait;
};
