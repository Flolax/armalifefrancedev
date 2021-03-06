#include "\ALF_Client\script_macros.hpp"
/*
Author: ALF Team
*/
if(!dialog) then {
	createDialog "ALF_Forfait_Dialog";
};
disableSerialization;

private _display = findDisplay 15000;
private _monAboTexte = _display displayCtrl 15001;
private _resilier = _display displayCtrl 15006;

private _color = "";
private _monAbo = "";

private _temps = life_forfait;

if(_temps isEqualTo -1) then {
	_color = "#E74C3C";
	_monAbo = "Aucun";
	_monAboTexte ctrlSetStructuredText parseText format["Mon abonnement: <t color='%1'>%2</t>",_color,_monAbo];
	_resilier ctrlShow false;
} else {
	if(_temps > 0) then {
		_temps = _temps / 60;
		_color = "#27AE60";
		_monAboTexte ctrlSetStructuredText parseText format["Durée restante de mon offre: <t color='%1'>%2 heure(s)</t>",_color,_temps];
	} else {
		_color = "#E74C3C";
		_monAboTexte ctrlSetStructuredText parseText format["<t color='%1'>Forfait épuisé.</t>",_color];
	};
};
