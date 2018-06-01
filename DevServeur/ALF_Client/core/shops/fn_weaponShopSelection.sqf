#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_weaponShopSelection.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Checks the weapon & adds the price tag.
*/
private["_control","_index","_shop","_priceTag","_price","_item","_itemArray","_bool"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_shop = uiNamespace getVariable ["Weapon_Shop",""];
if(isNull _control) exitWith {closeDialog 0;}; //Bad data
if(_index isEqualTo -1) exitWith {}; //Nothing selected

_priceTag = CONTROL(38400,38404);

if((GVAR_UINS ["Weapon_Shop_Filter",0]) isEqualTo 1) then {
	_item = CONTROL_DATAI(_control,_index);
	_itemArray = M_CONFIG(getArray,"WeaponShops",_shop,"items");
	_item = [_item,_itemArray] call TON_fnc_index;
	_price = SEL(SEL(_itemArray,_item),3);
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Prix d'achat: <t color='#8cff9b'>$%1</t></t>",[(_price)] call life_fnc_numberText];
	_control lbSetValue[_index,_price];
} else {
	_price = _control lbValue _index;
	_item = CONTROL_DATAI(_control,_index);
	if(_price > CASH) then {
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Prix d'achat: <t color='#ff0000'>$%1</t><br/>Manque: <t color='#8cff9b'>$%2</t></t>",[(_price)] call life_fnc_numberText,[(_price - CASH)] call life_fnc_numberText];
	} else {
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Prix d'achat: <t color='#8cff9b'>$%1</t></t>",[(_price)] call life_fnc_numberText];
	};
};
