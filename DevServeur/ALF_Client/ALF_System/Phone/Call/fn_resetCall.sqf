#include "\ALF_Client\script_macros.hpp"
/*
File: fn_resetCall.sqf
Author: ALF Team
Description:
Script de reset d'appel
*/
private["_channel","_radio"];
player setVariable ["callID",0,true];
player setVariable ["callNumber",0,true];
player setVariable ["callFrequence",0,true];
player setVariable ["callAnonyme",0,true];
life_callprogress = false;
life_trycall = false;
life_phonering = false;
iPhone_Mute = false;
iPhone_Speackers = false;
Call_Central = false;

_radio = call TFAR_fnc_activeSwRadio;
[format[localize "STR_transmit_end",format ["%1<img size='1.5' image='%2'/>", getText (ConfigFile >> "CfgWeapons" >> _radio >> "displayName"),
	getText(configFile >> "CfgWeapons"  >> _radio >> "picture")], 1, call TFAR_fnc_currentSWFrequency],
format["TANGENT	RELEASED	%1%2	%3	%4",call TFAR_fnc_currentSWFrequency, (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwRadioCode, getNumber(configFile >> "CfgWeapons" >> _radio >> "tf_range") * (call TFAR_fnc_getTransmittingDistanceMultiplicator), getText(configFile >> "CfgWeapons" >> _radio >> "tf_subtype")]
] call TFAR_fnc_ProcessTangent;

if !(isNull (findDisplay 20000)) then {
	uiNamespace setVariable ['nokiamenu',0];
	[] call ALF_fnc_menuNokia;
};
if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',0];
	[] call ALF_fnc_menuiPhone;
};
if !(isNull (findDisplay 32999)) then {
	uiNamespace setVariable ['sony',0];
	[] call ALF_fnc_menuSony;
};

if([(call TFAR_fnc_activeSwRadio),"alf_3310"] call TFAR_fnc_isSameRadio) then {
	playSound "nokia_end";
};
if([(call TFAR_fnc_activeSwRadio),"alf_iphone"] call TFAR_fnc_isSameRadio) then {
	playSound "nokia_end";
};
if([(call TFAR_fnc_activeSwRadio),"alf_neogend"] call TFAR_fnc_isSameRadio) then {
	playSound "nokia_end";
};

if(life_radio_connected) then {
	if([(call TFAR_fnc_activeSwRadio),"alf_iphone"] call TFAR_fnc_isSameRadio) then {
		player setVariable ["tf_unable_to_use_radio", false];
		private _freq = player getVariable "iPhoneRadioFreq";
		[(call TFAR_fnc_activeSwRadio), 1, _freq] call TFAR_fnc_SetChannelFrequency;
	};
	if([(call TFAR_fnc_activeSwRadio),"alf_neogend"] call TFAR_fnc_isSameRadio) then {
		player setVariable ["tf_unable_to_use_radio", false];
		private _myfreq = player getVariable "SonyFreq";
		if(!isNil "_myfreq" && _myfreq != 0) then {
			[(call TFAR_fnc_activeSwRadio), 1, _myfreq] call TFAR_fnc_SetChannelFrequency;
		} else {
			[(call TFAR_fnc_activeSwRadio), 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
		};
		private _myfreqAdd = player getVariable "SonyFreqAdd";
		if(!isNil "_myfreqAdd" && _myfreqAdd != 0) then {
			[(call TFAR_fnc_activeSwRadio), 2, _myfreqAdd] call TFAR_fnc_SetChannelFrequency;
		} else {
			[(call TFAR_fnc_activeSwRadio), 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setAdditionalSwChannel;
		};
	};
} else {
	[(call TFAR_fnc_activeSwRadio), 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
	[(call TFAR_fnc_activeSwRadio), 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
	player setVariable ["SonyFreq",0,true];
	player setVariable ["SonyFreqAdd",0,true];
	player setVariable ["tf_unable_to_use_radio", true];
};
