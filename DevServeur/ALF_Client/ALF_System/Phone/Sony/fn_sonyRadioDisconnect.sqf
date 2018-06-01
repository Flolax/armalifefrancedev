#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneRadioDisconnect.sqf
Author: ALF Team
*/
private _myRadio = _this select 0;
life_radio_connected = false;
player setVariable ["tf_unable_to_use_radio", true];
[_myRadio, 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
[_myRadio, 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
[_myRadio, 1] call TFAR_fnc_setAdditionalSwChannel;
player setVariable ["SonyFreq",0,true];
player setVariable ["SonyFreqAdd",0,true];
