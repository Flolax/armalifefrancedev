#include "\ALF_Client\script_macros.hpp"
/*
File: fn_menuDab.sqf
Author: ALF Team
Description: DAB Panel

*/
private["_display","_menu"];
if (!life_laactive && !life_lbactive && !life_lcactive) exitWith {	["Distributeur", "Tu n'as pas de compte bancaire.", "danger", false] spawn ALF_fnc_doMsg;	};

if(!dialog) then {
	createDialog "ALF_DabMenu_Dialog";
};
disableSerialization;

_display = findDisplay 10520;

//Menu1
_menu1 = _display displayCtrl 10520;
_livreta = _display displayCtrl 10520;
_livretb = _display displayCtrl 10520;
_livretc = _display displayCtrl 10520;

//Menu2
_menu2 = _display displayCtrl 10520;
_edit = _display displayCtrl 10520;
_btnretirer = _display displayCtrl 10520;
_btndeposer = _display displayCtrl 10520;
_btntransfer1 = _display displayCtrl 10520;
_btntransfer2 = _display displayCtrl 10520;

_menu = uiNamespace getVariable "dabmenu";
switch (_menu) do {
	case 0 : {
		_menu1 ctrlShow true;
		_livreta ctrlShow true;
		_livreta buttonSetAction "uiNamespace setVariable ['dabmenu',1]; [] spawn ALF_fnc_menuDab;";
		_livretb ctrlShow true;
		_livretb buttonSetAction "uiNamespace setVariable ['dabmenu',2]; [] spawn ALF_fnc_menuDab;";
		_livretc ctrlShow true;
		_livretc buttonSetAction "uiNamespace setVariable ['dabmenu',3]; [] spawn ALF_fnc_menuDab;";
		_menu2 ctrlShow false;
		_edit ctrlShow false;
		_btnretirer ctrlShow false;
		_btndeposer ctrlShow false;
		_btntransfer1 ctrlShow false;
		_btntransfer2 ctrlShow false;
	};
	case 1 : {
		_menu1 ctrlShow false;
		_livreta ctrlShow false;
		_livretb ctrlShow false;
		_livretc ctrlShow false;
		_menu2 ctrlShow true;
		_edit ctrlShow true;
		_btnretirer ctrlShow true;
		_btndeposer ctrlShow true;
		_btntransfer1 ctrlShow true;
		_btntransfer2 ctrlShow true;
		
		[0] spawn ALF_fnc_updateDab;
		
		_btnretirer buttonSetAction "[0] spawn ALF_fnc_retirerDab;";
		_btndeposer buttonSetAction "[0] spawn ALF_fnc_deposerDab;";
		_btntransfer1 buttonSetAction "[0] spawn ALF_fnc_transferDab;";
		_btntransfer2 buttonSetAction "[1] spawn ALF_fnc_transferDab;";
	};
	case 2 : {
		_menu1 ctrlShow false;
		_livreta ctrlShow false;
		_livretb ctrlShow false;
		_livretc ctrlShow false;
		_menu2 ctrlShow true;
		_edit ctrlShow true;
		_btnretirer ctrlShow true;
		_btndeposer ctrlShow true;
		_btntransfer1 ctrlShow true;
		_btntransfer2 ctrlShow true;
		
		[1] spawn ALF_fnc_updateDab;
		
		_btnretirer buttonSetAction "[1] spawn ALF_fnc_retirerDab;";
		_btndeposer buttonSetAction "[1] spawn ALF_fnc_deposerDab;";
		_btntransfer1 buttonSetAction "[2] spawn ALF_fnc_transferDab;";
		_btntransfer2 buttonSetAction "[3] spawn ALF_fnc_transferDab;";
	};
	case 3 : {
		_menu1 ctrlShow false;
		_livreta ctrlShow false;
		_livretb ctrlShow false;
		_livretc ctrlShow false;
		_menu2 ctrlShow true;
		_edit ctrlShow true;
		_btnretirer ctrlShow true;
		_btndeposer ctrlShow true;
		_btntransfer1 ctrlShow true;
		_btntransfer2 ctrlShow true;
		
		[2] spawn ALF_fnc_updateDab;
		
		_btnretirer buttonSetAction "[2] spawn ALF_fnc_retirerDab;";
		_btndeposer buttonSetAction "[2] spawn ALF_fnc_deposerDab;";
		_btntransfer1 buttonSetAction "[4] spawn ALF_fnc_transferDab;";
		_btntransfer2 buttonSetAction "[5] spawn ALF_fnc_transferDab;";
	};
};

