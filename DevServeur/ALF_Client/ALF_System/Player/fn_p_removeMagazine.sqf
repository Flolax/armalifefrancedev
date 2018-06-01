/*
	File: fn_p_removeMagazine.sqf
	Auhtor: ALF Team

	Description:


*/
private ["_mag"];
_mag = _this select 0;

player removeMagazine _mag;
[2] call SOCK_fnc_updatePartial;
