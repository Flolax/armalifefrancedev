#include "\ALF_Client\script_macros.hpp"
/*
File: fn_SonyDeleteContact.sqf
Author: ALF Team
*/
private["_contact"];
disableSerialization;
_contact = _this select 0;
life_contacts set[_contact,-1];
life_contacts = life_contacts - [-1];

if !(isNull (findDisplay 32999)) then {
	uiNamespace setVariable ['sony',3];
	[] call ALF_fnc_menuSony;
};

[life_contacts, getPlayerUID player] remoteExecCall ["HC_fnc_updateContactsPhone", HC_Life];
