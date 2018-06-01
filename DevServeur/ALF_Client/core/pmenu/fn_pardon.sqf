#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_pardon.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pardons the selected player.
*/
private["_display","_list","_uid"];
disableSerialization;
if(playerSide != west) exitWith {};

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {};
if(!(_data isEqualType [])) exitWith {};
if(count _data isEqualTo 0) exitWith {};

_uid = _data select 0;

[_uid] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
