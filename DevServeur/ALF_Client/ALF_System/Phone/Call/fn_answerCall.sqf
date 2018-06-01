#include "\ALF_Client\script_macros.hpp"
/*
File: fn_answerCall.sqf
Author: ALF Team
Description:
Script pour se connecter à l'appel
*/
private["_unitNumber","_unit"];
life_phonering = false;

_nb = player getVariable "callFrequence";
_unitNumber = player getVariable "callNumber";

player setVariable ["callID",_unitNumber,true];
player setVariable ["tf_unable_to_use_radio", true];
[(call TFAR_fnc_activeSwRadio), 1, _nb] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;

if (life_radio_connected) then {
	[(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setAdditionalSwChannel;
};

[(call TFAR_fnc_ActiveSWRadio), 2] call TFAR_fnc_setSwStereo;

_radio = call TFAR_fnc_activeSwRadio;
[format[localize "STR_transmit",format ["%1<img size='1.5' image='%2'/>", getText (ConfigFile >> "CfgWeapons" >> _radio >> "displayName"),
	getText(configFile >> "CfgWeapons"  >> _radio >> "picture")], 1, call TFAR_fnc_currentSWFrequency],
format["TANGENT	PRESSED	%1%2	%3	%4",call TFAR_fnc_currentSWFrequency, _radio call TFAR_fnc_getSwRadioCode, getNumber(configFile >> "CfgWeapons" >> _radio >> "tf_range") * (call TFAR_fnc_getTransmittingDistanceMultiplicator), getText(configFile >> "CfgWeapons" >> _radio >> "tf_subtype")],
-1
] call TFAR_fnc_ProcessTangent;

_exit = false;
{
	if(((_x getVariable "myPhoneNumber") select 1) isEqualTo _unitNumber) then {
		_unit = _x;
		_exit = true;
	};
} forEach playableUnits;
if(!_exit) exitWith {[] call ALF_fnc_resetCall;};

[_unit] spawn ALF_fnc_callInProgress;
