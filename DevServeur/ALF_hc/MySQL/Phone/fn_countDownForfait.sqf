#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_countDownForfait.sqf
	Author: ALF Team
*/
for "_i" from 0 to 1 step 0 do {
	sleep (30*60);
	{
		private _number = _x getVariable "myPhoneNumber" select 1;
		if(!isNil "_number") then {
			private _query = format["SELECT time FROM phone WHERE number='%1'",_number];
			private _queryResult = [_query,2] call HC_fnc_asyncCall;
			[[_queryResult] call HC_fnc_numberSafe] remoteExecCall ["ALF_fnc_updateForfait",_x];
		};
	} forEach playableUnits;
};
