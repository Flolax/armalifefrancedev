/*
	File: fn_spawnMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Initializes the spawn point selection menu.
*/
private ["_nearestMarker","_nearestLits","_obj","_object","_anim"];
disableSerialization;

if(life_is_arrested) exitWith {
	[] spawn life_fnc_respawned;
};

if(life_respawned) then {
	[] spawn life_fnc_respawned;
};

_nearestMarker = [["respawn_hp_1","respawn_hp_2","respawn_hp_3"], life_civ_position] call BIS_fnc_nearestPosition;
_nearestLits = nearestObjects [(getMarkerPos _nearestMarker), ["Land_ALF_H_bed"], 250];
_obj = _nearestLits call BIS_fnc_selectRandom;
[_obj] execVM "\ALF_Mobiliers\ALF_H_Lit\sitdown.sqf";

life_is_alive = true;
[3] call SOCK_fnc_updatePartial;

cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

[] spawn ALF_fnc_hudSetup;
