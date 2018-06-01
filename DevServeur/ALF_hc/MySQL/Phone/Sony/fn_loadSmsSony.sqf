#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_loadSmsNokia.sqf
	Author: ALF Team
	Description:

*/
private["_mynumber","_unit","_query","_queryResult"];
_mynumber = _this select 0;
_unit = _this select 1;

_query = format["SELECT anonyme, expediteur, message FROM sms WHERE destinataire='%1' AND active='1'",_mynumber];
_queryResult = [_query,2,true] call HC_fnc_asyncCall;

if(count (_queryResult) isEqualTo 0) then {
	_queryResult = [];
} else {
	_queryResult = _queryResult;
};

[_queryResult] remoteExec ["ALF_fnc_updateSmsSony",_unit];
