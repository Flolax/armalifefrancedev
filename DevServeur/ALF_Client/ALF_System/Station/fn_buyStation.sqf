#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_buyStation.sqf
	Author: ALF Nanou
*/
private["_station","_uid","_action","_stationCfg"];
_station = param [0,objNull,[objNull]];
_uid = steamid;

if(isNull _station) exitWith {};
if(!(_station isKindOf "House_F")) exitWith {};
if((_station getVariable ["station_owned",false])) exitWith {hint "Station déjà achetée";};
if(!isNil {(_station getVariable "station_sold")}) exitWith {hint "Station déjà vendu";};
//if(!license_home) exitWith {hint ""}; ------- License auto-entrepreneur? --------
closeDialog 0;

_price = 350000;

_action = [
	format[localize "STR_station_BuyMSG",
	[_price] call life_fnc_numberText],localize "STR_station_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_cash < _price) then {

	} else {
		SUB(life_cash,_price);
		[_uid,_station] remoteExec ["HC_fnc_addStation",HC_Life];
		[0] call SOCK_fnc_updatePartial;
	};

	_station setVariable ["station_owner",[_uid,profileName],true];
	_station setVariable ["uid",floor(random 99999),true];

	_marker = createMarkerLocal [format["station_%1",(_station getVariable "uid")],getPosATL _station];
	_marker setMarkerTextLocal "Station Total";
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Fuelstation";
};
