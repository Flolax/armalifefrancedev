#include "\ALF_Client\script_macros.hpp"
/*
File: deleteSmsNokia
Author: ALF Team
Description:
Supprime un contact au joueur depuis le menu du Nokia.
*/
private["_contact","_name","_number","_list","_mycontacts"];
if((time - life_action_delay) < 5) exitWith {hint localize "STR_NOTF_ActionDelay";};
life_action_delay = time;

disableSerialization;
if(EQUAL((lbCurSel 20021),-1)) exitWith {hint "Il faut selectionner quelqu'un."};
_data = CONTROL_DATA(20021);
_data = call compile format["%1", _data];

_destinataire = (player getVariable "myPhoneNumber") select 1;
_expediteur = _data select 0;
_msg = _data select 2;

[_destinataire,_expediteur,_msg, player] remoteExec ["HC_fnc_deleteSmsNokia", HC_Life];
