#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_removeForfait.sqf
	Author: ALF Team
	Description:

*/
private["_uid","_unit"];
_uid = _this select 0;
_unit = _this select 1;

private _query = format["UPDATE phone SET offre='0' WHERE playerid='%1'",_uid];
[_query,1] call HC_fnc_asyncCall;

["CALL deleteOldForfait",1] call HC_fnc_asyncCall;

[] remoteExecCall ["ALF_fnc_menuForfait",_unit];
