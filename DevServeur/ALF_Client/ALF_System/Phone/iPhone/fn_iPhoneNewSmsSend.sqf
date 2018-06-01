#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneNewSmsSend.sqf
Author: ALF Team
Description:
Envois d'un sms depuis l'iPhone'.
*/
private["_number","_msg"];
disableSerialization;

_number = ctrlText 564092;
_msg = ctrlText 564094;
private _badChar = false;
if(_number isEqualTo "") exitWith {hint "Il manque le numéro.";};
if(_msg isEqualTo "") exitWith {hint "Ton message est vide.";};
private _length = count (toArray(_number));
private _chrByte = toArray (_number);
private _allowed = toArray("0123456789");
if !(_length isEqualTo 10) exitWith {hint "Tu ne peux écrire que 10 numéros."};
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
private _length2 = count (toArray(_msg));
private _chrByte2 = toArray (_msg);
private _allowed2 = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!?,;€()éèà%ù&'/\=-_ ");
if(_length2 > 500) exitWith {hint "Tu ne peux écrire que 500 caractères max."};
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte2;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};

if(life_forfait isEqualTo 0) exitWith {hint "Ton forfait est épuisé.";};

private _myNumber = player getVariable "myPhoneNumber" select 1;
private _anonyme = 0;
if (life_is_anonyme) then {_anonyme = 1;} else {_anonyme = 0;};

[_anonyme,_myNumber,_number,_msg] remoteExecCall ["HC_fnc_sendSmsPhone",HC_Life];
uiNamespace setVariable ['iphonemenu',0];
[] call ALF_fnc_menuiPhone;

