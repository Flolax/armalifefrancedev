#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_sellStation.sqf
	Author: ALF Nanou
*/
private["_station","_uid","_action","_stationCfg"];
_station = param [0,objNull,[objNull]];
_uid = steamid;

if(isNull _station) exitWith {};
if(!(_station isKindOf "House_F")) exitWith {};
if(isNil {_station getVariable "station_owner"}) exitWith {hint localize "STR_station_noOwner";};
closeDialog 0;

_price = 150000;

_action = [
	format[localize "STR_station_SellstationMSG",
	[_price] call life_fnc_numberText],localize "STR_pInAct_Sellstation",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	_station setVariable ["station_sold",true,true];

	[_station] remoteExecCall ["HC_fnc_sellStation",HC_Life];

	deleteMarkerLocal format["station_%1",_station getVariable "uid"];
	_station setVariable ["uid",nil,true];

	life_livretc = life_livretc + _price;
	[8] call SOCK_fnc_updatePartial;
};
