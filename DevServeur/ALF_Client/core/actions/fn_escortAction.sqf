#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_escortAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description: Attaches the desired person(_unit) to the player(player) and "escorts them".
*/
private ["_unit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(!isNull(player GVAR ["escortingPlayer",objNull])) exitWith {};
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
if(!(side _unit in [civilian,independent])) exitWith {};
if((player distance _unit > 3)) exitWith {};

_unit attachTo [player,[0.1,1.1,0]];
player SVAR ["escortingPlayer",_unit];
player SVAR ["isEscorting",true];
_unit SVAR ["transporting",false,true];
_unit SVAR ["Escorting",true,true];
player reveal _unit;

[_unit] spawn {
	_unit = _this select 0;
	waitUntil {(!(_unit GVAR ["Escorting",false]))};
	player SVAR ["escortingPlayer",nil];
	player SVAR ["isEscorting",false];
};