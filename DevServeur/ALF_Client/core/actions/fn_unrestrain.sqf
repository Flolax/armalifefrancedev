#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_unrestrain.sqf
	Author: 
	
	Description:
	
*/
private["_unit"];
_unit = param [0,objNull,[objNull]];
if(isNull _unit OR !(_unit GVAR ["restrained",false])) exitWith {}; //Error check?

_unit SVAR ["restrained",false,true];
_unit SVAR ["Escorting",false,true];
_unit SVAR ["transporting",false,true];
detach _unit;

[0,"STR_NOTF_Unrestrain",true,[_unit GVAR ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];