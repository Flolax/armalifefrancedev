#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private "_state";
_state = param [0,1,[0]];

switch (_state) do {
	//Death while being wanted
	case 0: {
		SVAR_MNS [LICENSE_VARNAME("rebel"),false];
		SVAR_MNS [LICENSE_VARNAME("driver"),false];
		SVAR_MNS [LICENSE_VARNAME("heroin"),false];
		SVAR_MNS [LICENSE_VARNAME("marijuana"),false];
		SVAR_MNS [LICENSE_VARNAME("cocaine"),false];
	};

	//Jail licenses
	case 1: {
		SVAR_MNS [LICENSE_VARNAME("gun"),false];
		SVAR_MNS [LICENSE_VARNAME("driver"),false];
		SVAR_MNS [LICENSE_VARNAME("rebel"),false];
	};

	//Remove motor vehicle licenses
	case 2: {
		if(GVAR_MNS LICENSE_VARNAME("driver") OR GVAR_MNS LICENSE_VARNAME("pilot") OR GVAR_MNS LICENSE_VARNAME("trucking") OR GVAR_MNS LICENSE_VARNAME("boat")) then {
			SVAR_MNS [LICENSE_VARNAME("pilot"),false];
			SVAR_MNS [LICENSE_VARNAME("driver"),false];
			SVAR_MNS [LICENSE_VARNAME("trucking"),false];
			SVAR_MNS [LICENSE_VARNAME("boat"),false];
			hint localize "STR_Civ_LicenseRemove_1";
		};
	};

	//Killing someone while owning a gun license
	case 3: {
		if(GVAR_MNS LICENSE_VARNAME("gun")) then {
			SVAR_MNS [LICENSE_VARNAME("gun"),false];
			hint localize "STR_Civ_LicenseRemove_2";
		};
	};
};
