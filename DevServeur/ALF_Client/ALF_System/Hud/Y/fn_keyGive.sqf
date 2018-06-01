#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_keyGive.sqf
	Author: ALF Team
	Description:

*/
private["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid"];
disableSerialization;

_dialog = findDisplay 123450;
_list = _dialog displayCtrl 123457;

_sel = lbCurSel _list;
if((_list lbData _sel) isEqualTo "") exitWith {hint localize "STR_NOTF_didNotSelectVehicle";};
_vehicle = _list lbData _sel;
_vehicle = life_vehicles select parseNumber(_vehicle);

_unit = cursorObject;
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit isEqualTo player) exitWith {};
if!(_unit isKindOf "Man") exitWith {};
if(!isPlayer _unit) exitWith {};
if(!alive _unit) exitWith {};

_uid = getPlayerUID _unit;
_owners = _vehicle getVariable "vehicle_info_owners";
_index = [_uid,_owners] call TON_fnc_index;
if(EQUAL(_index,-1)) then  {
	_owners pushBack [_uid,_unit getVariable ["realname",name _unit]];
	_vehicle SVAR ["vehicle_info_owners",_owners,true];
};

["INFO", format["Tu viens de donner les clés de ce véhicule : %1",typeOf _vehicle], "success", false] spawn ALF_fnc_doMsg;

[_vehicle,_unit] remoteExecCAll ["TON_fnc_clientGetKey",_unit];
