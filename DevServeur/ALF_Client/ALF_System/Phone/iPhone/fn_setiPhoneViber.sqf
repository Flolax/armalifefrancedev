#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setiPhoneViber.sqf
Author: ALF Team
Description:

*/
if(!MuteTone) then {
	MuteTone = true;
} else {
	MuteTone = false;
};

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',5];
	[] call ALF_fnc_menuiPhone;
};