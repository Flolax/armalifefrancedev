#include "\ALF_Client\script_macros.hpp"
/*
File: fn_sendSmsNokia.sqf
Author: ALF Team
Description:
Envois d'un sms depuis le Nokia.
*/
private["_number","_display"];
_number = _this select 0;
diag_log format["NUMBER: %1",_number];
disableSerialization;
_datamsg = ctrlText 20019;
if(_datamsg isEqualTo "") exitWith {hint "Ton message est vide.";};
_length = count (toArray(_datamsg));
_chrByte = toArray (_datamsg);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!?,;€()éèà%ù&'/\=-_ ");
if(_length > 150) exitWith {hint "Tu ne peux écrire que 150 caractères."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if(life_forfait isEqualTo 0) exitWith {hint "Ton forfait est épuisé.";};

_myNumber = (player getVariable "myPhoneNumber") select 1;

[0,_myNumber,_number,_datamsg] remoteExecCall ["HC_fnc_sendSmsPhone",HC_Life];
