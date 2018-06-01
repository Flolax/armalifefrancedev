#include "\ALF_Client\script_macros.hpp"
/*
File: fn_deletecontactNokia
Author: ALF Team
Description:
Supprime un contact au joueur depuis le menu du Nokia.
*/
private["_dialog","_contact","_name","_number","_list"];
disableSerialization;
if(EQUAL((lbCurSel 20011),-1)) exitWith {hint "Il faut selectionner quelqu'un."};
_dialog = findDisplay 20000;
_list = _dialog displayCtrl 20011;
_contact = lbCurSel 20011;
life_contacts set[_contact,-1];
life_contacts = life_contacts - [-1];

lbClear _list;
{
	_name = _x select 0;
	_number = _x select 1;
	_list lbAdd format["%1 - %2",_name,_number];
	_list lbSetData [(lbSize _list)-1,str(_x)];
} forEach life_contacts;

[life_contacts, getPlayerUID player] remoteExecCall ["HC_fnc_updateContactsPhone", HC_Life];
