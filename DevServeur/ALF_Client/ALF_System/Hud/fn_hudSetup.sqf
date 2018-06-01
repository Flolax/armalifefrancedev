#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine

	Edit: ALF Team

	Description:
	Setups the hud for the player?
*/
disableSerialization;
cutRsc ["playerHUD", "PLAIN", 2, false];
[] call ALF_fnc_hudUpdate;

[] spawn {
	for "_i" from 0 to 1 step 0 do {
		if (!alive player) exitWith {};
		[] spawn ALF_fnc_UI_Loop;
		sleep 1;
	};
};
