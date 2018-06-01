#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Doesn't matter, will be revised later.
*/
private ["_healCost","_action"];
if(life_action_inUse) exitWith {};
if((damage player) < 0.01) exitWith {hint localize "STR_NOTF_HS_FullHealth"};
_healCost = LIFE_SETTINGS(getNumber,"hospital_heal_fee");
if(CASH < _healCost) exitWith {hint format[localize "STR_NOTF_HS_NoCash",[_healCost] call life_fnc_numberText];};

life_action_inUse = true;
_action = [
	format [localize "STR_NOTF_HS_PopUp",[_healCost] call life_fnc_numberText],
	localize "STR_NOTF_HS_TITLE",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
	closeDialog 0;
	uiSleep 8;
	if(player distance (_this select 0) > 5) exitWith {life_action_inUse = false; titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
	titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
	player setDamage 0;
	SUB(CASH,_healCost);
	life_action_inUse = false;
} else {
	hint localize "STR_NOTF_ActionCancel";
	closeDialog 0;
	life_action_inUse = false;
};