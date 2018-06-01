#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setViberNokia.sqf
Author: ALF Team
Description:

*/
if(!MuteTone) then {
	MuteTone = true;
} else {
	MuteTone = false;
};
playSound "nokia_bip";
