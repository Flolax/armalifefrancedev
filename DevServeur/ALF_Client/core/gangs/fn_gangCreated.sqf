#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_gangCreated.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Tells the player that the gang is created and throws him into it.
*/
private "_group";
life_action_gangInUse = nil;

if(life_cash < (LIFE_SETTINGS(getNumber,"gang_price"))) exitWith {
	hint format[localize "STR_GNOTF_NotEnoughMoney",[((LIFE_SETTINGS(getNumber,"gang_price"))-life_cash)] call life_fnc_numberText];
	{grpPlayer SVAR [_x,nil,true];} forEach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers"];
	[] call ALF_fnc_menuY;
};

SUB(life_cash,(LIFE_SETTINGS(getNumber,"gang_price")));

hint format[localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(LIFE_SETTINGS(getNumber,"gang_price"))] call life_fnc_numberText];

[] call ALF_fnc_menuY;
