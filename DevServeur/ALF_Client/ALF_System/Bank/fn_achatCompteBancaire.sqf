#include "\ALF_Client\script_macros.hpp"
/*
File: fn_achatCompteBancaire.sqf
Author: ALF Team
Description: Achat du compte bancaire

*/
private["_display","_mode","_uid"];
_mode = _this select 0;
_uid = getPlayerUID player;

switch (_mode) do {
	case 0 : {
		_price = 250;
		_action = [format["Veux-tu acheter un Livret A pour %1€. La somme sera prélevé en cash.",_price],"Crédit Mutuel","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};
		if(life_cash < _price) exitWith {["Crédit Mutuel", format["Il te manque %1€ pour acheter un Livret A.",_price - life_cash], "danger", false] spawn ALF_fnc_doMsg;};
		life_cash = life_cash - _price;
		life_laactive = true;
		[_uid,0,player] remoteExecCall ["HC_fnc_achatCompteBancaire",HC_Life];
		[0] call SOCK_fnc_updatePartial;
		["Crédit Mutuel", format["Tu as ouvert un compte de type Livret A pour %1€",_price], "success", false] spawn ALF_fnc_doMsg;
	};

	case 1 : {
		_price = 2500;
		_action = [format["Veux-tu acheter un Livret B pour %1€. La somme sera prélevé depuis ton Livret A.",_price],"Crédit Mutuel","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};
		if (!life_laactive) exitWith {["Crédit Mutuel", "Il te faut un Livret A pour pouvoir acheter un Livret B.", "danger", false] spawn ALF_fnc_doMsg;};
		if(life_livreta < 50000) exitWith {["Crédit Mutuel", format["Il te manque %1€ sur ton Livret A pour acheter un Livret B.",50000 - life_livreta], "danger", false] spawn ALF_fnc_doMsg;};
		life_livreta = life_livreta - _price;
		life_lbactive = true;
		[_uid,1,player] remoteExecCall ["HC_fnc_achatCompteBancaire",HC_Life];
		[6] call SOCK_fnc_updatePartial;
		["Crédit Mutuel", format["Tu as ouvert un compte de type Livret B pour %1€. Le solde a été prélevé depuis ton Livret A.",_price], "success", false] spawn ALF_fnc_doMsg;
	};
	case 2 : {
		_price = 15000;
		_action = [format["Veux-tu acheter un Livret C pour %1€. La somme sera prélevé depuis ton Livret B.",_price],"Crédit Mutuel","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};
		if (!life_lbactive) exitWith {["Crédit Mutuel", "Il te faut un Livret B pour pouvoir acheter un Livret C.", "danger", false] spawn ALF_fnc_doMsg;};
		if(life_livretb < 350000) exitWith {["Crédit Mutuel", format["Il te manque %1€ sur ton Livret B pour acheter un Livret B.",350000 - life_livretb], "danger", false] spawn ALF_fnc_doMsg;};
		life_livretb = life_livretb - _price;
		life_lcactive = true;
		[_uid,2,player] remoteExecCall ["HC_fnc_achatCompteBancaire",HC_Life];
		[7] call SOCK_fnc_updatePartial;
		["Crédit Mutuel", format["Tu as ouvert un compte de type Livret C pour %1€. Le solde a été prélevé depuis ton Livret B.",_price], "success", false] spawn ALF_fnc_doMsg;
	};
};
