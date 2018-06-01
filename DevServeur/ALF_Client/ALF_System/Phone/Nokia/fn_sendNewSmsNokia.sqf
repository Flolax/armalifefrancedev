#include "\ALF_Client\script_macros.hpp"
/*
File: fn_sendNewSmsNokia.sqf
Author: ALF Team
Description:
Repondre a un sms depuis le menu SMS du Nokia.
*/
private["_number","_msg","_myNumber"];
_number = ctrlText 200182;
_msg = ctrlText 20019;
if(_msg isEqualTo "") exitWith {hint "Ton message est vide.";};
if(_number isEqualTo "") exitWith {hint "Le numéro est vide.";};
private _length = count (toArray(_msg));
private _length2 = count (toArray(_number));
private _chrByte = toArray (_msg);
private _chrByte2 = toArray (_number);
private _allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!?,;€()éèà%ù&'/\=-_ ");
private _allowed2 = toArray("0123456789");
if(_length > 150) exitWith {hint "Tu ne peux écrire que 150 caractères max."};
if !(_length2 isEqualTo 10) exitWith {hint "Numéro incorrect."};
private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte2;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if(life_forfait isEqualTo 0) exitWith {hint "Ton forfait est épuisé.";};

_myNumber = player getVariable "myPhoneNumber" select 1;
[0,_myNumber,_number,_msg] remoteExecCall ["HC_fnc_sendSmsPhone",HC_Life];
