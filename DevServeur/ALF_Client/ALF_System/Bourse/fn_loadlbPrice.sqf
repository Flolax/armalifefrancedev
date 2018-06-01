#include "\ALF_Client\script_macros.hpp"
/*
File:
Author: ALF Team
Description:

*/

if (isNil "ALFBOURSE_Prices") then {[getPlayerUID player] remoteExecCall ["HC_fnc_loggedBourse",HC_Life]; ["NASDAC", "Mise à jour de le bourse.", "warning", false] spawn ALF_fnc_doMsg; sleep 1;};

disableSerialization;
_dialog = findDisplay 17100;
_listbox = _dialog displayCtrl 17051;

 _index = -1;
{
 	_index = _index + 1;
 	_itemName = _x select 0;
	_itemInfo = [_itemName] call life_fnc_fetchCfgDetails;
 	_itemDisplayIcon = _itemInfo select 2;
 	_itemDisplayName = _itemInfo select 1;
	_listbox lbAdd format["%1",_itemDisplayName];
	_listbox lbSetPicture [(lbSize _listbox )-1,_itemDisplayIcon];
} forEach ALFBOURSE_Prices;