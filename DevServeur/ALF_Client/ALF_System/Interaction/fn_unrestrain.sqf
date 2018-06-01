#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_unrestrain.sqf
	Author:

	Description:

*/
private["_unit"];
_unit = param [0,objNull,[objNull]];
if(isNull _unit OR !(_unit getVariable ["restrained",false])) exitWith {};

_unit setVariable ["restrained",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
detach _unit;

["INFO", "Tu es démenotté.", "success", false] spawn ALF_fnc_doMsg;
