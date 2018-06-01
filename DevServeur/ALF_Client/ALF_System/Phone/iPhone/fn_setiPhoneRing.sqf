#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setiPhoneRing.sqf
Author: ALF Team
Description:
Chargement de la sonnerie
*/
switch (iPhone_Ring) do {
	case 0 : {
		iPhone_Ring = 1;
		playSound "iPhoneRing2";
	};
	case 1 : {
		iPhone_Ring = 2;
		playSound "iPhoneRing3";
	};
	case 2 : {
		iPhone_Ring = 0;
		playSound "iPhoneRing1";
	};
};

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',5];
	[] call ALF_fnc_menuiPhone;
};