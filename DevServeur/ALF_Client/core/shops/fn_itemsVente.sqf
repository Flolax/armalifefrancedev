#include "\ALF_Client\script_macros.hpp"

disableSerialization;
private["_price","_item","_itemInfo"];
if((lbCurSel 39403) isEqualTo -1) exitWith {hint localize "STR_Shop_Weapon_NoSelect"};
_price = lbValue[39403,(lbCurSel 39403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[39403,(lbCurSel 39403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;

ADD(CASH,_price);
[_item,false] call life_fnc_handleItem;
[] call life_fnc_itemsVenteLoad;
hint parseText format[localize "STR_Shop_Weapon_Sold",_itemInfo select 1,[_price] call life_fnc_numberText];

[] call life_fnc_saveGear;
[0] call SOCK_fnc_updatePartial;
ALFBOURSE_NbAchat pushBack [_item,1];
