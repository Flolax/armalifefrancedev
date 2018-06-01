#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_initPlayer.sqf
	Author: ALF Team

	Description:
	Initializes the people.
*/
private["_spawnPos"];
waitUntil {sleep 0.3; !(isNull (findDisplay 46))};

if(life_is_alive && !life_is_arrested) then {
	player setPosATL life_civ_position;
	if(life_playerfirstjoinserver) then {
		ALF_PlayingVideo = false;
		execVM "\ALF_Client\ALF_System\1stSpawnVideo.sqf";
		waitUntil {sleep 0.5; ALF_PlayingVideo};
		[getPlayerUID player] remoteExecCall ["HC_fnc_FirstJoinServer",HC_Life];
	};
} else {
	if(!life_is_alive && !life_is_arrested) then {
		[] call life_fnc_spawnMenu;
	} else {
		if(life_is_arrested) then {
			life_is_arrested = false;
			[player,true] spawn life_fnc_jail;
		};
	};
};
life_is_alive = true;

player setVariable["CopRank",life_coplevel,true];
player setVariable["MedRank",life_mediclevel,true];

player addRating 9999999;