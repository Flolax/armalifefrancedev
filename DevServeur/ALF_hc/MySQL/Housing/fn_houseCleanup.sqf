#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_houseCleanup.sqf
	Author: NiiRoZz

	This file is for Nanou's HeadlessClient.

	Description:
	Cleans up mobiliers inside in house of player.
*/
private["_uid","_query","_mobiliers"];
_uid = SEL(_this,0);
_query = format["SELECT pid, pos FROM mobiliers WHERE pid='%1' AND owned='1'",_uid];

_mobiliers = [_query,2,true] call HC_fnc_asyncCall;

if(count _mobiliers isEqualTo 0) exitWith {};
{
	_pos = call compile format["%1",_x select 1];
	_mobilier = nearestObjects[_pos,["ALF_Sofa_Gris","ALF_Sofa_Noir","ALF_Meuble_Tele_1","ALF_Table_Basse_1","ALF_Table_Basse_2","ALF_Table_Basse_3","ALF_Table_Basse_4"],20];
	{
		deleteVehicle _x;
	} forEach _mobilier;
} forEach _mobiliers;
