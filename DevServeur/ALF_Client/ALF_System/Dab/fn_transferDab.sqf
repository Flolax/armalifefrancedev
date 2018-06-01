#include "\ALF_Client\script_macros.hpp"
/*
File: fn_transferDab.sqf
Author: ALF Team
Description: Transferer de compte a compte

*/
private["_mode"];
_mode = _this select 0;

if((time - life_action_delay) < 2) exitWith {hint localize "STR_NOTF_ActionDelay";};
life_action_delay = time;

disableSerialization;
_number = parseNumber(ctrlText 10624);

if(!([str(_number)] call life_fnc_isnumeric)) exitWith {["Distributeur", "Non conforme.", "danger", false] spawn ALF_fnc_doMsg;};

if(_number < 0) exitWith {["Crédit Mutuel", "Ce nombre est négatif.", "danger", false] spawn ALF_fnc_doMsg;};
if(_number > 999999) exitWith {["Distributeur", "Ce nombre est trop grand.", "danger", false] spawn ALF_fnc_doMsg;};

switch (_mode) do {

	case 0 : {
		if (!life_lbactive) exitWith {["Distributeur", "Tu n'as pas de Livret B.", "danger", false] spawn ALF_fnc_doMsg;};
		if (life_livreta < _number) exitWith {["Distributeur", "Tu n'as pas assez de fond sur ton Livret A.", "danger", false] spawn ALF_fnc_doMsg;};
		if ((life_livretb + _number) > 500000) exitWith {["Distributeur", "Tu ne peux pas déposer plus de 500.000€ sur ton Livret B.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livreta = life_livreta - _number;
		life_livretb = life_livretb + _number;
		["Distributeur", format["Tu as tranféré %1€ du Livret A au Livret B.",_number], "success", false] spawn ALF_fnc_doMsg;
		[0] spawn ALF_fnc_updateDab;
		[9] call SOCK_fnc_updatePartial;
	};

	case 1 : {
		if (!life_lcactive) exitWith {["Distributeur", "Tu n'as pas de Livret C.", "danger", false] spawn ALF_fnc_doMsg;};
		if (life_livreta < _number) exitWith {["Distributeur", "Tu n'as pas assez de fond sur ton Livret A.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livreta = life_livreta - _number;
		life_livretc = life_livretc + _number;
		["Distributeur", format["Tu as tranféré %1€ du Livret A au Livret C.",_number], "success", false] spawn ALF_fnc_doMsg;
		[0] spawn ALF_fnc_updateDab;
		[9] call SOCK_fnc_updatePartial;
	};

	case 2 : {
		if (life_livretb < _number) exitWith {["Distributeur", "Tu n'as pas assez de fond sur ton Livret B.", "danger", false] spawn ALF_fnc_doMsg;};
		if ((life_livreta + _number) > 75000) exitWith {["Distributeur", "Tu ne peux pas déposer plus de 75.000€ sur ton Livret A.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livretb = life_livretb - _number;
		life_livreta = life_livreta + _number;
		["Distributeur", format["Tu as tranféré %1€ du Livret B au Livret A.",_number], "success", false] spawn ALF_fnc_doMsg;
		[1] spawn ALF_fnc_updateDab;
		[9] call SOCK_fnc_updatePartial;
	};

	case 3 : {
		if (!life_lcactive) exitWith {["Distributeur", "Tu n'as pas de Livret C.", "danger", false] spawn ALF_fnc_doMsg;};
		if (life_livretb < _number) exitWith {["Distributeur", "Tu n'as pas assez de fond sur ton Livret B.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livretb = life_livretb - _number;
		life_livretc = life_livretc + _number;
		["Distributeur", format["Tu as tranféré %1€ du Livret B au Livret C.",_number], "success", false] spawn ALF_fnc_doMsg;
		[1] spawn ALF_fnc_updateDab;
		[9] call SOCK_fnc_updatePartial;
	};

	case 4 : {
		if (life_livretc < _number) exitWith {["Distributeur", "Tu n'as pas assez de fond sur ton Livret C.", "danger", false] spawn ALF_fnc_doMsg;};
		if ((life_livreta + _number) > 75000) exitWith {["Distributeur", "Tu ne peux pas déposer plus de 75.000€ sur ton Livret A.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livretc = life_livretc - _number;
		life_livreta = life_livreta + _number;
		["Distributeur", format["Tu as tranféré %1€ du Livret C au Livret A.",_number], "success", false] spawn ALF_fnc_doMsg;
		[2] spawn ALF_fnc_updateDab;
		[9] call SOCK_fnc_updatePartial;
	};

	case 5 : {
		if (life_livretc < _number) exitWith {["Distributeur", "Tu n'as pas assez de fond sur ton Livret C.", "danger", false] spawn ALF_fnc_doMsg;};
		if ((life_livretb + _number) > 500000) exitWith {["Distributeur", "Tu ne peux pas déposer plus de 500.000€ sur ton Livret B.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livretc = life_livretc - _number;
		life_livretb = life_livretb + _number;
		["Distributeur", format["Tu as tranféré %1€ du Livret C au Livret B.",_number], "success", false] spawn ALF_fnc_doMsg;
		[2] spawn ALF_fnc_updateDab;
		[9] call SOCK_fnc_updatePartial;
	};

};
