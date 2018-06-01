#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneRing.sqf
Author: ALF Team
Description:

*/
switch (iPhone_Ring) do {
	case 0 : { [player,"iPhoneRing1"] remoteExec ["life_fnc_say3D",RANY]; };
	case 1 : { [player,"iPhoneRing2"] remoteExec ["life_fnc_say3D",RANY]; };
	case 2 : { [player,"iPhoneRing3"] remoteExec ["life_fnc_say3D",RANY]; };
};
