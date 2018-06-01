#include "\ALF_Client\script_macros.hpp"
/*
File: fn_retirerCompteBancaire.sqf
Author: ALF Team
Description: Retirer du compte bancaire

*/
private["_mode"];
_mode = _this select 0;

if((time - life_action_delay) < 2) exitWith {hint localize "STR_NOTF_ActionDelay";};
life_action_delay = time;

disableSerialization;
_display = findDisplay 22500;
_number = parseNumber(ctrlText 22513);

if(!([str(_number)] call life_fnc_isnumeric)) exitWith {["Crédit Mutuel", "Non conforme.", "danger", false] spawn ALF_fnc_doMsg;};

if(_number < 0) exitWith {["Crédit Mutuel", "Ce nombre est négatif.", "danger", false] spawn ALF_fnc_doMsg;};
if(_number > 999999) exitWith {["Crédit Mutuel", "Ce nombre est trop grand.", "danger", false] spawn ALF_fnc_doMsg;};

switch (_mode) do {

	case 0 : {
		if (life_livreta < _number) exitWith {["Crédit Mutuel", "Tu n'as pas cet argent sur ton Livret A.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livreta = life_livreta - _number;
		life_cash = life_cash + _number;
		["Crédit Mutuel", format["Tu as retiré %1€ ton Livret A.",_number], "success", false] spawn ALF_fnc_doMsg;
		[0] spawn ALF_fnc_updateCompteBancaire;
		[0] call SOCK_fnc_updatePartial;
		[6] call SOCK_fnc_updatePartial;
	};

	case 1 : {
		if (life_livretb < _number) exitWith {["Crédit Mutuel", "Tu n'as pas cet argent sur ton Livret B.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livretb = life_livretb - _number;
		life_cash = life_cash + _number;
		["Crédit Mutuel", format["Tu as retiré %1€ ton Livret B.",_number], "success", false] spawn ALF_fnc_doMsg;
		[1] spawn ALF_fnc_updateCompteBancaire;
		[0] call SOCK_fnc_updatePartial;
		[7] call SOCK_fnc_updatePartial;
	};

	case 2 : {
		if (life_livretc < _number) exitWith {["Crédit Mutuel", "Tu n'as pas cet argent sur ton Livret C.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livretc = life_livretc - _number;
		life_cash = life_cash + _number;
		["Crédit Mutuel", format["Tu as retiré %1€ ton Livret C.",_number], "success", false] spawn ALF_fnc_doMsg;
		[2] spawn ALF_fnc_updateCompteBancaire;
		[0] call SOCK_fnc_updatePartial;
		[8] call SOCK_fnc_updatePartial;
	};

};
