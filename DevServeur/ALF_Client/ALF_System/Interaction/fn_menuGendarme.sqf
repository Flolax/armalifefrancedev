#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_menuGendarme.sqf
	Author: ALF Team
	Description:

*/

private["_display"];
if(!dialog) then {createDialog "menuGendarme_dialog"};
disableSerialization;
_display = findDisplay 522110;

_picpage1 = _display displayCtrl 522111;
_picpage2 = _display displayCtrl 522113;
_picpage3 = _display displayCtrl 522115;
_picpage4 = _display displayCtrl 522117;
_btnpage1 = _display displayCtrl 522112;
_btnpage2 = _display displayCtrl 522114;
_btnpage3 = _display displayCtrl 522116;
_btnpage4 = _display displayCtrl 522118;

_btn1 = _display displayCtrl 522119;
_btn2 = _display displayCtrl 522120;
_btn3 = _display displayCtrl 522121;
_btn4 = _display displayCtrl 522122;
_btn5 = _display displayCtrl 522123;
_btn6 = _display displayCtrl 522124;

ALF_InAct_CurObject = cursorObject;

_menu = uiNamespace getVariable "gendmenu";
switch (_menu) do {
	case 0 : {

	if((player getVariable["isEscorting",false])) then {
		{ _x ctrlShow false; } forEach [_btn1,_btn3,_btn4,_btn5,_btn6];
	};
	//Btn + Pic
	_picpage1 ctrlShow true;
	_btnpage1 ctrlShow false;
	_picpage2 ctrlShow false;
	_btnpage2 ctrlShow true;
	_picpage3 ctrlShow false;
	_btnpage3 ctrlShow true;
	_picpage4 ctrlShow false;
	_btnpage4 ctrlShow true;

	_btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
	_btn1 buttonSetAction "[ALF_InAct_CurObject] call ALF_fnc_unrestrain; closeDialog 0;";

	//Set Escort Button
	if((player getVariable ["isEscorting",false])) then {
		_btn2 ctrlSetText localize "STR_pInAct_StopEscort";
		_btn2 buttonSetAction "[] call ALF_fnc_stopEscorting; closeDialog 0;";
	} else {
		_btn2 ctrlSetText localize "STR_pInAct_Escort";
		_btn2 buttonSetAction "[ALF_InAct_CurObject] spawn ALF_fnc_escortAction; closeDialog 0;";
	};

	_btn3 ctrlSetText localize "STR_pInAct_PutInCar";
	_btn3 buttonSetAction "[ALF_InAct_CurObject] call ALF_fnc_putInCar; closeDialog 0;";

	//Set Check Licenses Button
	_btn4 ctrlSetText localize "STR_pInAct_checkLicenses";
	_btn4 buttonSetAction "[player] remoteExecCall [""ALF_fnc_licenseCheck"",ALF_InAct_CurObject]; closeDialog 0;";

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
