#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_menuGendarme.sqf
	Author: ALF Team
	Description:

*/

private["_display"];
if(!dialog) then {createDialog "menuCivil_dialog"};
disableSerialization;
_display = findDisplay 532110;

_picpage1 = _display displayCtrl 532111;
_picpage2 = _display displayCtrl 532113;
_picpage3 = _display displayCtrl 532115;
_picpage4 = _display displayCtrl 532117;
_btnpage1 = _display displayCtrl 532112;
_btnpage2 = _display displayCtrl 532114;
_btnpage3 = _display displayCtrl 532116;
_btnpage4 = _display displayCtrl 532118;

_btn1 = _display displayCtrl 532119;
_btn2 = _display displayCtrl 532120;
_btn3 = _display displayCtrl 532121;
_btn4 = _display displayCtrl 532122;
_btn5 = _display displayCtrl 532123;
_btn6 = _display displayCtrl 532124;

ALF_InAct_CurObject = cursorObject;

_menu = uiNamespace getVariable "civmenu";
switch (_menu) do {
	case 0 : {
	//Btn + Pic
	_picpage1 ctrlShow true;
	_btnpage1 ctrlShow false;
	_picpage2 ctrlShow false;
	_btnpage2 ctrlShow true;
	_picpage3 ctrlShow false;
	_btnpage3 ctrlShow true;
	_picpage4 ctrlShow false;
	_btnpage4 ctrlShow true;

	_btn1 buttonSetAction "hint ""Btn 1 1""";
	_btn2 buttonSetAction "hint ""Btn 2 1""";
	_btn3 buttonSetAction "hint ""Btn 3 1""";
	_btn4 buttonSetAction "hint ""Btn 4 1""";
	_btn5 buttonSetAction "hint ""Btn 5 1""";
	_btn6 buttonSetAction "hint ""Btn 6 1""";
	};


	case 1 : {
	//Btn + Pic
	_picpage1 ctrlShow false;
	_btnpage1 ctrlShow true;
	_picpage2 ctrlShow true;
	_btnpage2 ctrlShow false;
	_picpage3 ctrlShow false;
	_btnpage3 ctrlShow true;
	_picpage4 ctrlShow false;
	_btnpage4 ctrlShow true;

	_btn1 buttonSetAction "hint ""Btn 1 2""";
	_btn2 buttonSetAction "hint ""Btn 2 2""";
	_btn3 buttonSetAction "hint ""Btn 3 2""";
	_btn4 buttonSetAction "hint ""Btn 4 2""";
	_btn5 buttonSetAction "hint ""Btn 5 2""";
	_btn6 buttonSetAction "hint ""Btn 6 2""";
	};
	case 2 : {
	//Btn + Pic
	_picpage1 ctrlShow false;
	_btnpage1 ctrlShow true;
	_picpage2 ctrlShow false;
	_btnpage2 ctrlShow true;
	_picpage3 ctrlShow true;
	_btnpage3 ctrlShow false;
	_picpage4 ctrlShow false;
	_btnpage4 ctrlShow true;

	_btn1 buttonSetAction "hint ""Btn 1 3""";
	_btn2 buttonSetAction "hint ""Btn 2 3""";
	_btn3 buttonSetAction "hint ""Btn 3 3""";
	_btn4 buttonSetAction "hint ""Btn 4 3""";
	_btn5 buttonSetAction "hint ""Btn 5 3""";
	_btn6 buttonSetAction "hint ""Btn 6 3""";
	};
	case 3 : {
	//Btn + Pic
	_picpage1 ctrlShow false;
	_btnpage1 ctrlShow true;
	_picpage2 ctrlShow false;
	_btnpage2 ctrlShow true;
	_picpage3 ctrlShow false;
	_btnpage3 ctrlShow true;
	_picpage4 ctrlShow true;
	_btnpage4 ctrlShow false;

	_btn1 buttonSetAction "hint ""Btn 1 4""";
	_btn2 buttonSetAction "hint ""Btn 2 4""";
	_btn3 buttonSetAction "hint ""Btn 3 4""";
	_btn4 buttonSetAction "hint ""Btn 4 4""";
	_btn5 buttonSetAction "hint ""Btn 5 4""";
	_btn6 buttonSetAction "hint ""Btn 6 4""";
	};
};
