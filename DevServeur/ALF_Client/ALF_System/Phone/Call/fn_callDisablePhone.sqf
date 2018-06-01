#include "\ALF_Client\script_macros.hpp"
/*
File: fn_callDisablePhone.sqf
Author: ALF Team
Description:

*/
if(life_phoneoff) then {
	life_phoneoff = false;
} else {
	life_phoneoff = true;
};
playSound "nokia_bip";
