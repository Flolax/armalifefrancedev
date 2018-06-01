#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneSmsContactSend.sqf
Author: ALF Team
Description:
Envois d'un sms depuis l'iPhone'.
*/
private["_number","_datamsg","_myNumber"];
_number = _this select 0;
disableSerialization;
_datamsg = ctrlText 33152;

if(_datamsg isEqualTo "") exitWith {hint "Ton message est vide.";};
private _length = count (toArray(_datamsg));
private _chrByte = toArray (_datamsg);
private _allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!?,;€()éèà%ù&'/\=-_ ");
if(_length > 500) exitWith {hint "Tu ne peux écrire que 500 caractères max."};
private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};

if(life_forfait isEqualTo 0) exitWith {hint "Ton forfait est épuisé.";};

private _myNumber = player getVariable "myPhoneNumber" select 1;
private _anonyme = 0;
if (life_is_anonyme) then {_anonyme = 1;} else {_anonyme = 0;};

[_anonyme,_myNumber,_number,_datamsg] remoteExecCall ["HC_fnc_sendSmsPhone",HC_Life];

uiNamespace setVariable ['sony',9];
[] call ALF_fnc_menuiPhone;
