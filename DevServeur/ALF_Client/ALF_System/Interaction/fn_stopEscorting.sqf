#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_stopEscorting.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Detaches player(_unit) from the Escorter(player) and sets them back down.
*/
private["_unit"];
_unit = player getVariable ["escortingPlayer",objNull];
if(isNull _unit) then {_unit = cursorObject;};
if(isNull _unit) exitWith {};
if(!(_unit getVariable ["Escorting",false])) exitWith {};
detach _unit;
_unit setVariable ["Escorting",false,true];
player setVariable ["currentlyEscorting",nil];
player setVariable ["isEscorting",false];