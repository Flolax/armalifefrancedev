#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_receiveMoney.sqf
	Author: ALF Team
	Description:

*/
private["_val"];
_val = _this select 0;

if(_val isEqualTo "") exitWith {};
if(!([_val] call TON_fnc_isnumber)) exitWith {};

["INFO", format["On vient de te donner %1€",[(parseNumber (_val))] call life_fnc_numberText], "success", false] spawn ALF_fnc_doMsg;
life_cash = life_cash + parseNumber(_val);
[0] call SOCK_fnc_updatePartial;
