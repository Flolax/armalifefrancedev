#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_menuGrade.sqf
	Author: ALF Team
	Description:

*/

private["_display"];
if(!dialog) then {createDialog "menuOjects_dialog"};
disableSerialization;
_display = findDisplay 562110;

_picpage = _display displayCtrl 562111;

_btn1 = _display displayCtrl 562112;
_btn2 = _display displayCtrl 562113;
_btn3 = _display displayCtrl 562114;
_btn4 = _display displayCtrl 562115;
_btn5 = _display displayCtrl 562116;
_btn6 = _display displayCtrl 562117;

ALF_InAct_CurObject = cursorObject;

//Btn + Pic
_picpage ctrlShow true;
_btn1 buttonSetAction "hint ""Btn 1 1""";
_btn2 buttonSetAction "hint ""Btn 2 1""";
_btn3 buttonSetAction "hint ""Btn 3 1""";
_btn4 buttonSetAction "hint ""Btn 4 1""";
_btn5 buttonSetAction "hint ""Btn 5 1""";
_btn6 buttonSetAction "hint ""Btn 6 1""";
