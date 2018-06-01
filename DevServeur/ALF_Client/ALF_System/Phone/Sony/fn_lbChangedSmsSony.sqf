#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_lbChangedSmsSony.sqf
	Author: ALF Nanou
*/
private["_text","_data","_delButton","_replyButton","_msg","_number","_name","_anonyme"];
disableSerialization;
_text = ((findDisplay 32999) displayCtrl 33145);
_data = lbData[33144,lbCurSel (33144)];
_delButton = ((findDisplay 32999) displayCtrl 33147);
_replyButton = ((findDisplay 32999) displayCtrl 33146);
if(_data isEqualTo "Tu n'as pas de messages.") then {
	_text ctrlSetStructuredText parseText  format["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>Tu n'as pas de messages.</t>"];
} else {
	_data = call compile _data;
	_number = _data select 0;
	_name = _data select 1;
	_msg = _data select 2;
	_anonyme = _data select 3;
	if(_anonyme isEqualTo "1") then {
		_number = "**********";
		_name = "Anonyme";
		_text ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%2 - %3 : %1</t>", _msg,_name,_number];
		_replyButton ctrlShow false;
	} else {
		_text ctrlSetStructuredText parseText format ["<t shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%2 - %3 : %1</t>", _msg,_name,_number];
		_replyButton ctrlShow true;
		_replyButton buttonSetAction "uiNamespace setVariable ['sony',13]; [] call ALF_fnc_menuSony;";
	};
	_delButton ctrlShow true;
	_delButton buttonSetAction "[] spawn ALF_fnc_deleteSmsSony;";
};
