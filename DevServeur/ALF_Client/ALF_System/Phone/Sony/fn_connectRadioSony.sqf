#include "\ALF_Client\script_macros.hpp"
/*
File: fn_connectRadioSony.sqf
Author: ALF Team
*/
private _freq = _this select 0;
private _myfreq = player getVariable "SonyFreq";
private _myfreqAdd = player getVariable "SonyFreqAdd";

if(isNil "_myfreq") then {player setVariable ["SonyFreq",0,true]; _myfreq = 0;};
if(isNil "_myfreqAdd") then {player setVariable ["SonyFreqAdd",0,true]; _myfreqAdd = 0;};

if(_freq isEqualTo _myfreq) exitWith {
	if(_myfreqAdd isEqualTo 0) then {
		player setVariable ["tf_unable_to_use_radio", true];
		life_radio_connected = false;
	};
	[(call TFAR_fnc_activeSwRadio), 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
	player setVariable ["SonyFreq",0,true];
	[] call ALF_fnc_menuSony;
};
if(_freq isEqualTo _myfreqAdd) exitWith {
	if(_myfreq isEqualTo 0) then {
		player setVariable ["tf_unable_to_use_radio", true];
		life_radio_connected = false;
	};
	[(call TFAR_fnc_activeSwRadio), 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
	[(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setAdditionalSwChannel;
	player setVariable ["SonyFreqAdd",0,true];
	[] call ALF_fnc_menuSony;
};

[] spawn {
	if(!life_radio_connected) then {
		life_radio_connected = true;
		player setVariable ["tf_unable_to_use_radio", false];
		private _myRadio = call TFAR_fnc_activeSwRadio;
		for "_i" from 0 to 1 step 0 do {
			if !(alive player) exitWith {[_myRadio] call ALF_fnc_sonyRadioDisconnect;};
			private _radios = player call TFAR_fnc_radiosList;
			if(count _radios < 1) exitWith {[_myRadio] call ALF_fnc_sonyRadioDisconnect;};
			if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {[_myRadio] call ALF_fnc_sonyRadioDisconnect;};
			if(!life_radio_connected) exitWith {};
			sleep 1;
		};
	};
};

if(_freq isEqualTo 30) then {
	[(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setAdditionalSwChannel;
	[(call TFAR_fnc_activeSwRadio), 2, _freq] call TFAR_fnc_SetChannelFrequency;
	player setVariable ["SonyFreqAdd",30,true];
	if(_myfreq isEqualTo 0) then {[(call TFAR_fnc_activeSwRadio), 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;};
} else {
	[(call TFAR_fnc_activeSwRadio), 1, _freq] call TFAR_fnc_SetChannelFrequency;
	player setVariable ["SonyFreq",_freq,true];
};

[] call ALF_fnc_menuSony;
