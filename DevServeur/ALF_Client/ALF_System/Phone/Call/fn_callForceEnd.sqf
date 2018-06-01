#include "\ALF_Client\script_macros.hpp"
/*
File: fn_callForceEnd.sqf
Author: ALF Team
Description:

*/
private["_myRadio","_myFrequence","_myRadioCode","_myRadioSetting"];
_myRadio = _this select 0;
_myFrequence = _this select 1;
_myRadioCode = _this select 2;
_myRadioSetting = _this select 3;
player setVariable ["callID",0,true];
player setVariable ["callNumber",0,true];
player setVariable ["callFrequence",0,true];
player setVariable ["callAnonyme",0,true];
player setVariable ["tf_unable_to_use_radio",true];
life_callprogress = false;
life_trycall = false;
life_phonering = false;
iPhone_Mute = false;
iPhone_Speackers = false;
Call_Central = false;

[format[localize "STR_transmit_end",format ["%1<img size='1.5' image='%2'/>", getText (ConfigFile >> "CfgWeapons" >> _myRadio >> "displayName"),
	getText(configFile >> "CfgWeapons"  >> _myRadio >> "picture")], 1,_myFrequence],
format["TANGENT	RELEASED	%1%2	%3	%4",_myFrequence,_myRadioCode, getNumber(configFile >> "CfgWeapons" >> _myRadio >> "tf_range") * _myRadioSetting, getText(configFile >> "CfgWeapons" >> _myRadio >> "tf_subtype")]
] call TFAR_fnc_ProcessTangent;

[_myRadio, 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
