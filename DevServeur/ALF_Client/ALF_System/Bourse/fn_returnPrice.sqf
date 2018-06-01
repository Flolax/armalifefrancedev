#include "\ALF_Client\script_macros.hpp"
/*
File:
Author: ALF Team
Description:

*/
private["_className"];
_className = _this select 0;
if((EQUAL(_className,""))) exitWith {[]};
_return = [];
_price = 0;
_itemNameToSearchFor = _className;
{
	_curItemName = _x select 0;
	_curItemPrice = _x select 1;
	if (_curItemName isEqualTo _itemNameToSearchFor) then {_price=_curItemPrice};
} forEach ALFBOURSE_Prices;

if(EQUAL(_price,-1)) exitWith {};

_return = (floor _price);
_return;
