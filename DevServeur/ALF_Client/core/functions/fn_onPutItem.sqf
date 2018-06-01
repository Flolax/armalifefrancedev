/*
	File: fn_onPutItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Syncs changes to mobiliers in houses?
*/
private["_unit","_item","_house","_mobilier"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_mobilier = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _unit OR _item isEqualTo "") exitWith {}; //Bad thingies?