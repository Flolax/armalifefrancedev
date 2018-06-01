/*
	File: fn_handleCB.sqf
	Auhtor: ALF Team

	Description:
	Script pour payer par carte bleu

	_handle = ["1000"] call ALF_fnc_handleCB;
	if (_handle) exitWith {["Carte Bancaire", "Le paiement a été refusé.", "danger", false] spawn ALF_fnc_doMsg;};
*/
_number = _this select 0;
_return = false;

switch (life_activecb) do {
	case 0 : {
		_return = true;
	};
	case 1 : {
		_action = [format["Veux-tu payer %1€ par carte bancaire. La somme sera prélevé depuis ton Livret A.",_number],"Payer par carte","OUI","NON"] call BIS_fnc_guiMessage;
		if !(_action) exitWith {_return = true;};
		if (_number > life_livreta) exitWith {_return = true;};
		life_livreta = life_livreta - _number;
		[6] call SOCK_fnc_updatePartial;
		["Carte Bancaire", format["%1€ a été débité de ton livret A.",_number], "success", false] spawn ALF_fnc_doMsg;
	};
	case 2 : {
		_action = [format["Veux-tu payer %1€ par carte bancaire. La somme sera prélevé depuis ton Livret B.",_number],"Payer par carte","OUI","NON"] call BIS_fnc_guiMessage;
		if !(_action) exitWith {_return = true;};
		if (_number > life_livretb) exitWith {_return = true;};
		life_livretb = life_livretb - _number;
		[7] call SOCK_fnc_updatePartial;
		["Carte Bancaire", format["%1€ a été débité de ton livret B.",_number], "success", false] spawn ALF_fnc_doMsg;
	};
	case 3 : {
		_action = [format["Veux-tu payer %1€ par carte bancaire. La somme sera prélevé depuis ton Livret C.",_number],"Payer par carte","OUI","NON"] call BIS_fnc_guiMessage;
		if !(_action) exitWith {_return = true;};
		if (_number > life_livretc) exitWith {_return = true;};
		life_livretc = life_livretc - _number;
		[8] call SOCK_fnc_updatePartial;
		["Carte Bancaire", format["%1€ a été débité de ton livret C.",_number], "success", false] spawn ALF_fnc_doMsg;
	};
};

_return;
