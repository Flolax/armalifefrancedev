/*
	File: fn_1stSpawnVideo.sqf
	Author: ALF Team

	Description:
	Load video when player spawn for the 1st time.
*/
cutText ["", "BLACK FADED", 18];

//[0] call TFAR_fnc_setVoiceVolume;

disableUserInput true;
enableEnvironment false;
showCinemaBorder false;
player allowDamage false;
player enableSimulation false;

_video = ["\ALF_Client\videos\intro.ogv"] spawn BIS_fnc_playVideo;
waitUntil {sleep 0.5; scriptDone _video};

player allowDamage true;
player enableSimulation true;
enableEnvironment true;
disableUserInput false;

//[20] call TFAR_fnc_setVoiceVolume;

ALF_PlayingVideo = true;