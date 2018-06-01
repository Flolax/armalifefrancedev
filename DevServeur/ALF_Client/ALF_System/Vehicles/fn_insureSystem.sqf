#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_insureSystem.sqf
	Author: ALF Team

	Description:
	Insure a vehicle from the garage.
*/

private["_vehicle","_vid","_pid","_price"];
disableSerialization;
if(lbCurSel 2802 isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
_price = SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicle,"assurance"),0);

if(life_cash < _price) exitWith {["Assurance",format["Tu n'as pas %1€ sur toi.",[_price] call life_fnc_numberText],"danger",false] spawn ALF_fnc_doMsg;};

[_vid,_pid,player] remoteExecCall ["HC_fnc_insureVehicles",HC_Life];

life_cash = life_cash - _price;
[0] call SOCK_fnc_updatePartial;
closeDialog 0;
