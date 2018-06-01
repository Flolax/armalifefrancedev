#include "\ALF_Client\script_macros.hpp"
/*
File:
Author: ALF Team
Description:

*/
disableSerialization;
_dialog = findDisplay 17100;

_listbox = _dialog  displayCtrl 17051;
_cashdisplay = _dialog displayCtrl 17053;
_amountsolddisplay = _dialog displayCtrl 17055;
_cashdisplayold = _dialog displayCtrl 17057;
_index = lbCurSel _listbox;

_costOld = 0;
_itemArrayOld = [];

if (!isNil "ALFBOURSE_PricesOld") then {_itemArrayOld = ALFBOURSE_PricesOld select _index;} else {_itemArrayOld=["",0];};

_itemArray = ALFBOURSE_Prices select _index;
_cost = _itemArray select 1;
_costOld = _itemArrayOld select 1;
_itemname = _itemArray select 0;

_amountsold = 0;
{
	_name = _x select 0;
	_sold = _x select 1;
	if (_itemname isEqualTo _name) then {
		_amountsold = _amountsold + _sold;
	};
} forEach ALFBOURSE_NbAchat;

_amountsolddisplay ctrlSetText format ["%1",_amountsold];
_cashdisplay ctrlSetText format ["%1€",_cost];
_arrowText = "";
if (_cost<_costOld) then {
	_percent = (100-((_cost/_costOld)*100));
	_arrowText = format ["<t color='#FF0000'>↓ %1%2",_percent,"%"];
} else {
	if (_costOld<_cost) then {
		_percent = (100-((_costOld/_cost)*100));
		_arrowText = format ["<t color='#04B404'>↑ %1%2",_percent,"%"];
	} else {
		_percent = (100-((_costOld/_cost)*100));
		_arrowText = format [""];
	};
};
_cashdisplayold ctrlSetStructuredText parseText format ["%1€ %2",_costOld,_arrowText];