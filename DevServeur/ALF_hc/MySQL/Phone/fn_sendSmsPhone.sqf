#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_sendSmsPhone.sqf
	Author: ALF Team
	Description:

*/
private["_anonyme","_numberExpediteur","_numberCible","_msg","_unit"];
_anonyme = _this select 0;
_numberExpediteur = _this select 1;
_numberCible = _this select 2;
_msg = _this select 3;

private _length = count (toArray(_numberCible));
if !(_length isEqualTo 10) exitWith {};

_query = format["SELECT number FROM phone WHERE number='%1'",_numberCible];
_queryresult = [_query,2] call HC_fnc_asyncCall;
if((count _queryresult) isEqualTo 0) exitWith {};

	_msg = format["""%1""",_msg];
	_query = format["INSERT INTO sms (anonyme, expediteur, destinataire, message) VALUES('%1','%2','%3','%4')",_anonyme,_numberExpediteur,_numberCible,_msg];
	[_query,1] call HC_fnc_asyncCall;
{
	_numberunit = _x getVariable "myPhoneNumber";
	if ((_numberunit select 1) isEqualTo _numberCible) exitWith {
		_unit = _x;
		[_anonyme,_numberExpediteur,_msg] remoteExecCall ["ALF_fnc_receptionSmsPhone",_unit];
	};
} forEach playableUnits;
