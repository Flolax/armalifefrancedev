#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setiPhoneAnonyme.sqf
Author: ALF Team
Description:

*/
if(!life_is_anonyme) then {
	life_is_anonyme = true;
} else {
	life_is_anonyme = false;
};

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',5];
	[] call ALF_fnc_menuiPhone;
};