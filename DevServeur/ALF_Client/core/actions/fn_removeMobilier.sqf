#include "\ALF_Client\script_macros.hpp"
/*
	File : removeMobilier.sqf
	Author: ALF Team

	Description:
	Delete mobilier from house storage
*/
private["_house","_action","_mobilier","_mobilierType","_mobiliers"];
_mobilier = param [0,objNull,[objNull]];
_mobilierType = typeOf _mobilier;
_house = nearestObject [player, "House"];
if(!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};
if(isNull _mobilier) exitWith {};
_mobiliers = _house GVAR ["mobiliers",[]];
closeDialog 0;

_action = [
	"Veux-tu récupérer ce mobilier?","Mobilier","OUI","NON"
] call BIS_fnc_guiMessage;

if(_action) then {

	[_mobilier] remoteExecCall ["HC_fnc_deleteDBmobilier",HC_Life];

	private _item = "";
	{
		private _name = M_CONFIG(getText,"ALFCfgMobiliers",_x,"item");
		if(_name isEqualTo _mobilierType) exitWith {_item = _x};
	} forEach ALF_Mobiliers_Items;
	if(_item != "") then {[_item,true] call life_fnc_handleItem;};

	{
		if (_x isEqualTo _mobilier) then {
			_mobiliers deleteAt _forEachIndex;
		};
	} forEach _mobiliers;
	_house SVAR ["mobiliers",_mobiliers,true];
	[life_mobilier_activeMun,true] call life_fnc_handleItem;
};
