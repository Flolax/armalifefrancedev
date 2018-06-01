#include "\ALF_Client\script_macros.hpp"
/*
File:
Author: ALF Team
Description:

*/
private _tel  = _this select 0;
private _mode = _this select 1;
private _uid = getPlayerUID player;
private _price = 0;
private _offre = "";

switch (_tel) do {
	case 1 : {
		switch (_mode) do {
			case 1 : {_price = 250;};
			case 2 : {_price = 650;};
			case 3 : {_price = 1700;};
			case 4 : {_price = 3100;};
		};
		private _action = [format["Veux-tu acheter cette offre pour %1€. La somme sera prélevé en cash.",_price],"Orange","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};
		if (life_cash >= _price) then {
			life_cash = life_cash - _price;
			[_uid,_mode,player] remoteExecCall ["HC_fnc_buyForfait",HC_Life];
		} else {
			["Orange", "Vous n'avez pas assez de liquide.", "danger", false] spawn ALF_fnc_doMsg;
		};
	};
	case 2 : {
		private _action = ["Veux-tu résilier ton forfait? Ton numéro et tes contacts seront définitivement effacés.","Orange","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};
		life_forfait = -1;
		[getPlayerUID player,player] remoteExecCall ["HC_fnc_removeForfait",HC_Life];
	};
};
