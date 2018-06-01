#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff

life_use_atm = true;
life_hunger = 100;
life_thirst = 100;
life_drunk = 0;
CASH = 0; //Make sure we don't get our cash back.
life_respawned = false;

life_radio_connected = false;
player setVariable ["SonyFreq",0,true];
player setVariable ["SonyFreqAdd",0,true];

life_corpse SVAR ["Revive",nil,true];
life_corpse SVAR ["name",nil,true];
life_corpse SVAR ["Reviving",nil,true];
player SVAR ["Revive",nil,true];
player SVAR ["name",nil,true];
player SVAR ["Reviving",nil,true];

//Load gear for a 'new life'
_handle = [] spawn life_fnc_civLoadout;
waitUntil {sleep 0.3; scriptDone _handle};


//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private "_containers";
	life_corpse SVAR ["Revive",true,true];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} forEach _containers; //Delete the containers.
	deleteVehicle life_corpse;
};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if(life_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

[] call SOCK_fnc_updateRequest;
[] spawn ALF_fnc_hudSetup; //Request setup of hud.
