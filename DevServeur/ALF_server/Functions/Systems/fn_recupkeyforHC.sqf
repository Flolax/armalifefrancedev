#include "\ALF_server\script_macros.hpp"
/*
	File: fn_recupkeyforHC.sqf
	Author : NiiRoZz

	Description:
	Tells the server to recup the Key of player
*/
private["_uid"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid isEqualTo "") exitWith {}; //NULL
_keyArr = missionNamespace getVariable [format["%1_KEYS",_uid],[]];
[_keyArr] remoteExecCall ["HC_fnc_receivekeyofServer",HC_Life];