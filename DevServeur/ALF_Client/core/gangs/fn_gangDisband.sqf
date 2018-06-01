#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_gangDisband.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Prompts the user about disbanding the gang and if the user accepts the gang will be
	disbanded and removed from the database.
*/
private ["_action"];
_action = ["Veux-tu dissoudre ton groupe?.","Mon groupe","OUI","NON"] call BIS_fnc_guiMessage;
if(_action) then {
	hint localize "STR_GNOTF_DisbandGangPro";
	[grpPlayer] remoteExec ["HC_fnc_removeGang",HC_Life];
} else {
	hint localize "STR_GNOTF_DisbandGangCanc";
};