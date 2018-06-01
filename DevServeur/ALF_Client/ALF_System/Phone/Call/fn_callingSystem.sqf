#include "\ALF_Client\script_macros.hpp"
/*
File: fn_callingSystem.sqf
Author: ALF Team
Description:
Initialise le systeme d'appel pour les joueurs.

*/
player setVariable ["callID",0,true];
player setVariable ["callNumber",0,true];
player setVariable ["callFrequence",0,true];
player setVariable ["callAnonyme",0,true];
_radios = player call TFAR_fnc_radiosList;
if(count _radios > 0) then {
	[(call TFAR_fnc_activeSwRadio), 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
};
