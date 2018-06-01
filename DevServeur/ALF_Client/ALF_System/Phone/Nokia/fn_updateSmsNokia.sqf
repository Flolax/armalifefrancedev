#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_updateSmsNokia.sqf
	Author: ALF Team
	Description:

*/
private["_data","_playerList","_infoToPass","_delButton","_replyButton","_number","_msg","_name","_anonyme"];
_data = _this select 0;

disableSerialization;
waitUntil {sleep 0.1; !isNull (findDisplay 20000)};
_playerList = ((findDisplay 20000) displayCtrl 20021);
_delButton = ((findDisplay 20000) displayCtrl 20024);
_delButton ctrlShow false;
_replyButton = ((findDisplay 20000) displayCtrl 20023);
_replyButton ctrlShow false;

lbClear _playerList;
if(count _data < 1) then
{
	_playerList lbAdd format["Boite vide."];
	_playerList lbSetdata [(lbSize _playerList)-1, "Tu n'as pas de messages."];
}
else
{
	{
		_anonyme = _x select 0;
		_number = _x select 1;
		_msg = _x select 2;
		_name = "Inconnu";
		if (count life_contacts > 0) then {
			{
				if (_x select 1 isEqualTo _number) exitWith {
					_name = _x select 0;
				};
			} foreach life_contacts;
		};
		_infoToPass = format["[""%1"",""%2"",""%3"",""%4""]",_number,_name,_msg,_anonyme];
		if(_anonyme isEqualTo 1) then {_name = "Anonyme"; _number = "**********";};
		_playerList lbAdd format["%1 - %2",_name,_number];
		_playerList lbSetdata [(lbSize _playerList)-1, _infoToPass];
	} foreach _data;
};
((findDisplay 20000) displayCtrl 20021) lbSetCurSel 0;
