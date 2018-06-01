#include "\ALF_Client\script_macros.hpp"
/*
File: fn_infoTransferCompteBancaire.sqf
Author: ALF Team
Description: Reason

*/
private["_number","_ciblenumberacc","_mode","_texte"];
_number = _this select 0;
_ciblenumberacc = _this select 1;
_mode = _this select 2;

_texte = "";
switch (_mode) do {
	case 0 : {
		life_livreta = life_livreta + _number;
		_texte = "A";
		if !(isNull (findDisplay 22500)) then { [0] spawn ALF_fnc_updateCompteBancaire; };
	};
	case 1 : {
		life_livretb = life_livretb + _number;
		_texte = "B";
		if !(isNull (findDisplay 22500)) then { [1] spawn ALF_fnc_updateCompteBancaire; };
	};
	case 2 : {
		life_livretc = life_livretc + _number;
		_texte = "C";
		if !(isNull (findDisplay 22500)) then { [2] spawn ALF_fnc_updateCompteBancaire; };
	};
};

_number = [_number] call life_fnc_numberText;
["Crédit Mutuel",format["Le compte bancaire numéro %2 vous a transferer %1€ sur votre Livret %3.",_number,_ciblenumberacc,_texte], "success", false] spawn ALF_fnc_doMsg;
