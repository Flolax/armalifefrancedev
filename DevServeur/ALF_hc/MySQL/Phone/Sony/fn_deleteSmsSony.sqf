#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_deleteSmsNokia.sqf
	Author: ALF Team
	Description:

*/
private["_uid","_contacts","_query"];
_destinataire = _this select 0;
_expediteur = _this select 1;
_msg = _this select 2;
_msg = format["""%1""",_msg];
_unit = _this select 3;

_query = format["UPDATE sms SET active='0' WHERE expediteur='%1' AND destinataire='%2' AND message='%3'",_expediteur,_destinataire,_msg];
[_query,1] call HC_fnc_asyncCall;

sleep 1;

_query = format["SELECT anonyme, expediteur, message FROM sms WHERE destinataire='%1' AND active='1'",_destinataire];
private _queryResult = [_query,2,true] call HC_fnc_asyncCall;

if(count (_queryResult) isEqualTo 0) then {
	_queryResult = [];
} else {
	_queryResult = _queryResult;
};

[_queryResult] remoteExec ["ALF_fnc_updateSmsSony",_unit];
