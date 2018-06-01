#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_weaponShopBuySell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
private["_price","_item","_itemInfo","_bad"];
if((lbCurSel 38403) isEqualTo -1) exitWith {hint localize "STR_Shop_Weapon_NoSelect"};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;

if(_item isEqualTo "ALF_CB_Bronze" && !life_laactive) exitWith {hint "Tu n'as pas de livret A."};
if(_item isEqualTo "ALF_CB_Bronze" && life_lbactive) exitWith {hint "Tu ne peux pas acheter cette carte."};
if(_item isEqualTo "ALF_CB_Gold" && !life_lbactive) exitWith {hint "Tu n'as pas de livret B."};
if(_item isEqualTo "ALF_CB_Gold" && life_lcactive) exitWith {hint "Tu ne peux pas acheter cette carte."};
if(_item isEqualTo "ALF_CB_Black" && !life_lcactive) exitWith {hint "Tu n'as pas de livret C."};
if(_item isEqualTo "ALF_3310" && life_forfait isEqualTo -1) exitWith {hint "Tu n'as pas de forfait."};
if(_item isEqualTo "ALF_iPhone" && life_forfait isEqualTo -1) exitWith {hint "Tu n'as pas de forfait."};

if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Shop_Filter",0]) != 1) exitWith {hint "Tu n'as pas la place pour acheter cet item."};

if((uiNamespace getVariable["Weapon_Shop_Filter",0]) isEqualTo 1) then {
	ADD(CASH,_price);
	[_item,false] call life_fnc_handleItem;
	hint parseText format[localize "STR_Shop_Weapon_Sold",_itemInfo select 1,[_price] call life_fnc_numberText];
	[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call life_fnc_weaponShopFilter; //Update the menu.
} else {
	if(_price > CASH) then {
		_handle = [_price] call ALF_fnc_handleCB;
		if (_handle) exitWith {["Carte Bancaire", "Le paiement a été refusé.", "danger", false] spawn ALF_fnc_doMsg;};
		[_item,true] spawn life_fnc_handleItem;
	} else {
		hint parseText format[localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call life_fnc_numberText];
		CASH = CASH - _price;
		[_item,true] spawn life_fnc_handleItem;
	};
};
[] call life_fnc_saveGear;
