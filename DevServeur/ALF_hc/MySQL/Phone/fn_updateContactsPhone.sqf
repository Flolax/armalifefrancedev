#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_updateContactsPhone.sqf
	Author: ALF Team
	Description:

*/
private["_uid","_contacts","_query"];
_contacts = [_this,0,[],[[]]] call BIS_fnc_param;
_uid = [_this,1,"",[""]] call BIS_fnc_param;

_contacts = [_contacts] call HC_fnc_mresArray;

_query = format["UPDATE phone SET contacts='%1' WHERE playerid='%2'",_contacts,_uid];
[_query,1] call HC_fnc_asyncCall;
