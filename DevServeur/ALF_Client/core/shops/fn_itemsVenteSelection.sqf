#include "\ALF_Client\script_macros.hpp"

private["_control","_index","_shop","_priceTag","_price","_item","_itemArray"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_shop = uiNamespace getVariable ["Items_Vente",""];
if(isNull _control) exitWith {closeDialog 0;}; //Bad data
if(_index isEqualTo -1) exitWith {}; //Nothing selected

_priceTag = CONTROL(39400,39404);
_item = CONTROL_DATAI(_control,_index);
_itemArray = M_CONFIG(getArray,"ItemsVente",_shop,"items");
_price = [_item] call ALF_fnc_returnPrice;
_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Côte en bourse: <t color='#8cff9b'>%1€</t></t>",[(_price)] call life_fnc_numberText];
_control lbSetValue[_index,_price];
