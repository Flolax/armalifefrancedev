#include "\ALF_Client\script_macros.hpp"
/*
File: fn_updateDab.sqf
Author: ALF Team
Description: DAB panel

*/
private["_display"];
_mode = _this select 0;

disableSerialization;
_display = findDisplay 10520;
_textelivret = _display displayCtrl 10522;
_textecash = _display displayCtrl 10523;

switch (_mode) do {
	case 0 : {
		_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_livreta] call life_fnc_numberText];
		_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_cash] call life_fnc_numberText];
	};

	case 1 : {
		_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_livretb] call life_fnc_numberText];
		_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_cash] call life_fnc_numberText];
	};

	case 2 : {
		_textelivret ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_livretc] call life_fnc_numberText];
		_textecash ctrlSetStructuredText parseText format["<t align='center' color='#000000' size='1.4px'>%1€</t>",[life_cash] call life_fnc_numberText];
	};
};
