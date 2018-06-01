#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_updateRequest.sqf
	Author: Tonic

	Description:
	Passes ALL player information to the server to save player data to the database.
*/
private["_packet","_array","_alive","_position"];
_packet = [getPlayerUID player,CASH]; //0,1
_array = [];
_alive = alive player;
_position = getPosATL player;

{
	_varName = LICENSE_VARNAME(configName _x);
	_array pushBack [_varName,LICENSE_VALUE(configName _x)];
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));

_packet pushBack _array; //2

[] call life_fnc_saveGear;
_packet pushBack life_gear; //3

_array = [];
_array pushBack life_hunger;
_array pushBack life_thirst;
_array pushBack life_drunk;
_array pushBack (damage player);
_packet pushBack _array; //4

_packet pushBack life_is_arrested; //5
_packet pushBack _alive; //6
_packet pushBack _position; //7

_packet remoteExecCall ["HC_fnc_updateRequest",HC_Life];
