#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setiPhoneBackGround2.sqf
Author: ALF Team
Description:
Chargement du fond d'écran
*/
switch (iPhone_Background) do {
	case 0 : {
		iPhone_Background = 1;
	};
	case 1 : {
		iPhone_Background = 2;
	};
	case 2 : {
		iPhone_Background = 3;
	};
	case 3 : {
		iPhone_Background = 4;
	};
	case 4 : {
		iPhone_Background = 0;
	};
};

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',5];
	[] call ALF_fnc_menuiPhone;
};