/*
	File : fn_placeMobilierAction.sqf
	Author: ALF Team
	Description:
	Place mobilier Action
*/
if(!life_mobilier_active) exitWith {};
if(life_mobilier_activeObj isEqualTo objNull) exitWith {};

private _mobilier = life_mobilier_activeObj;
private _isFloating = if (((getPos _mobilier) select 2) < 0.1) then {false} else {true};
detach _mobilier;
[_mobilier,true] remoteExecCall ["life_fnc_simDisable",0];
_mobilier setPosATL [getPosATL _mobilier select 0, getPosATL _mobilier select 1, getPosATL _mobilier select 2];
_mobilier allowDamage false;

[_mobilier,_isFloating] call life_fnc_placeMobilier;
life_mobilier_active = false;
life_mobilier_activeObj = objNull;