#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_buyMobilier.sqf
	Auhtor: ALF Team

	Description:
	Script pour acheter un mobilier chez IKEA ou autre..

*/
private["_item","_itemName","_price","_itemFinal","_exit","_action"];
_item = _this select 0;
_exit = false;

_itemName = typeOf _item;

_price = M_CONFIG(getNumber,CONFIG_ALF_MOBILIERS,_itemName,"achat");
_itemFinal = M_CONFIG(getNumber,CONFIG_ALF_MOBILIERS,_itemName,"item");

_action = [format["Veux-tu acheter ce mobilier pour %1€? Paiement liquide, CB acceptée.",[_price] call life_fnc_numberText],"IKEA","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {};

if(life_cash < _price) then {
	_handle = [_price] spawn ALF_fnc_handleCB;
	if (!_handle) exitWith {_exit = true;};
} else {
	life_cash = life_cash - _price;
	[0] call SOCK_fnc_updatePartial;
};
if(_exit) exitWith {};

["IKEA", format["Tu as acheté ce mobilier pour %1€.",_price], "success", false] spawn ALF_fnc_doMsg;

player addMagazine _itemFinal;
[2] call SOCK_fnc_updatePartial;
