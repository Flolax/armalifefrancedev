/*
	File: fn_addkeyforHC.sqf
	Author: ALF Team

	Description:
	Add key from HC for Save Vehicle System by ALF Nanou.
*/
private["_uid","_input","_arr"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_input = [_this,1,objNull,[objNull]] call BIS_fnc_param;

if(_uid isEqualTo "") exitWith {}; //BAAAAAAAAADDDDDDDD
if(isNull _input OR _input isKindOf "House") exitWith {};

_arr = missionNamespace getVariable [format["%1_KEYS",_uid],[]];
_arr pushBack _input;
_arr = _arr - [objNull];
missionNamespace setVariable[format["%1_KEYS",_uid],_arr];