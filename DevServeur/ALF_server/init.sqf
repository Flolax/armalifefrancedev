#include "script_macros.hpp"
/*
	File: init.sqf
	Author: Bryan "Tonic" Boardwine

	Edit: Nanou for HeadlessClient optimization.
	Please read support for more informations.

	Description:
	Initialize the server and required systems.
*/
ALF_server_isReady = false;
PVAR_ALL("ALF_server_isReady");
life_save_civilian_position = if(EQUAL(LIFE_SETTINGS(getNumber,"save_civilian_position"),0)) then {false} else {true};

JGVKBLKUJGVKGHCFXHDXFDHSHV = false;
PVAR_ALL("JGVKBLKUJGVKGHCFXHDXFDHSHV");

/*
	Prepare the headless client.
*/
ALF_hc_isActive = false;
PVAR_ALL("ALF_hc_isActive");

HC_Life = false;
PVAR_ALL("HC_Life");

ALF_hc_FirstLaunch = false;
PVAR_ALL("ALF_hc_FirstLaunch");

[] execVM "\ALF_server\initHC.sqf";

{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} forEach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} forEach allUnits;

[8,true,12] execFSM "\ALF_server\FSM\timeModule.fsm";

life_adminLevel = 0;
life_medicLevel = 0;
life_copLevel = 0;
CONST(JxMxE_PublishVehicle,"false");

/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];
[] call compile PreProcessFileLineNumbers "\ALF_server\functions.sqf";

/* Set OwnerID players for Headless Client */
TON_fnc_requestClientID =
{
	(_this select 1) setVariable ["life_clientID", owner (_this select 1), true];
};
"life_fnc_RequestClientId" addPublicVariableEventHandler TON_fnc_requestClientID;

/* Event handler for logs */
"money_log" addPublicVariableEventHandler {diag_log (_this select 1)};
"advanced_log" addPublicVariableEventHandler {diag_log (_this select 1)};

/* Miscellaneous mission-required stuff */
life_wanted_list = [];

[] spawn {
	for "_i" from 0 to 1 step 0 do {
		uiSleep (30 * 60);
		{
			_x setVariable ["sellers",[],true];
		} forEach [Dealer_1,Dealer_2,Dealer_3];
	};
};

// We create the attachment point to be used for objects to attachTo load virtually in vehicles.
life_attachment_point = "Land_HelipadEmpty_F" createVehicle [0,0,0];
life_attachment_point setPosASL [0,0,0];
life_attachment_point setVectorDirAndUp [[0,1,0], [0,0,1]];

// Sharing the point of attachment with all players.
publicVariable "life_attachment_point";

[] execVM "\ALF_server\Functions\Systems\fn_trafficlights.sqf";
