#include "\ALF_hc\hc_macros.hpp"
/*
	File:
	Author:

	This file is for Nanou's HeadlessClient.

	Description:

*/
private["_curItemAmountSold","_curItemPrice","_curItemName","_itemAmountSold","_index","_itemName","_itemArray"];

_itemArray = [_this,0,[]] call BIS_fnc_param;
if (count _itemArray < 1) exitWith {};
{
	_itemName = _x select 0;
	_itemAmountSold = _x select 1;
	_index = -1;
	{
		_index = _index + 1;
		_curItemName = _x select 0;
		_curItemPrice = _x select 1;
		_curItemAmountSold = _x select 2;
		if (_curItemName isEqualTo _itemName) then {
			ALFMARKET_Items_PriceArr set [_index,[_curItemName,_curItemPrice,_curItemAmountSold+_itemAmountSold]];
		};
	} forEach ALFMARKET_Items_PriceArr;
} forEach _itemArray;