#include "\ALF_Client\script_macros.hpp"
/*
File:
Author: ALF Team
Description:

*/
_mode = _this select 0;
_itemArray = [_this,1,[]] call BIS_fnc_param;
if (isNil "ALFBOURSE_NbAchat") then {ALFBOURSE_NbAchat=[];};

switch (_mode) do {
	case 0:
	{
		[ALFBOURSE_NbAchat] remoteExecCall ["HC_fnc_updateBourse",HC_Life];
		ALFBOURSE_NbAchat = [];
	};
	case 1:
	{
		_needToUpdate = false;
		if (!isNil "ALFBOURSE_Prices") then {ALFBOURSE_PricesOld = ALFBOURSE_Prices;} else {_needToUpdate=true;};
		sell_array = _itemArray;
		ALFBOURSE_Prices = _itemArray;
		if (_needToUpdate) then {ALFBOURSE_PricesOld = ALFBOURSE_Prices;};
	};
};