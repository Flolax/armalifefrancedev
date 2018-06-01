#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_updatePartial.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through remoteExec
*/
private["_mode","_packet","_array"];
_mode = param [0,0,[0]];
_packet = [steamid,nil,_mode];
_array = [];

switch(_mode) do {
	case 0: {
		_packet set[1,CASH];
	};

	case 1: {
		{
			_varName = LICENSE_VARNAME(configName _x);
			_array pushBack [_varName,LICENSE_VALUE(configName _x)];
		} forEach ("true" configClasses (missionConfigFile >> "Licenses"));

		_packet set[1,_array];
	};

	case 2: {
		[] call life_fnc_saveGear;
		_packet set[1,life_gear];
	};

	case 3: {
		_packet set[1,life_is_alive];
		_packet set[3,getPosATL player];
	};

	case 4: {
		_packet set[1,life_is_arrested];
	};

	case 6: {
		_packet set[1,life_livreta];
	};
	case 7: {
		_packet set[1,life_livretb];
	};
	case 8: {
		_packet set[1,life_livretc];
	};
	case 9: {
		_packet set[1,life_livreta];
		_packet set[3,life_livretb];
		_packet set[4,life_livretc];
	};
	case 10: {
		_packet set[1,life_hsbc];
	};
};

_packet remoteExecCall ["HC_fnc_updatePartial",HC_Life];
