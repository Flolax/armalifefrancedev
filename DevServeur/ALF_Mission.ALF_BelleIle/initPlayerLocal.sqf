/*
	File: initPlayerLocal.sqf
	Author: ALF Team

	Description:
	Starts the initialization of the player.
*/
if (!hasInterface && !isServer) exitWith {
	[] call compile PreprocessFileLineNumbers "\ALF_hc\initHC.sqf";
}; //This is a headless client.

//[] execVM "SpyGlass\fn_initSpy.sqf";

[] execVM "\ALF_Client\ALF_System\init.sqf";
