#include "\ALF_Client\script_macros.hpp"
/*
File: fn_ringNullPlayer.sqf
Author: ALF Team
Description:

*/
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

private["_endme","_radios","_myRadio","_myFrequence","_myRadioCode","_myRadioSetting"];
_myRadio = call TFAR_fnc_activeSwRadio;
_myFrequence = call TFAR_fnc_currentSWFrequency;
_myRadioCode = _myRadio call TFAR_fnc_getSwRadioCode;
_myRadioSetting = call TFAR_fnc_getTransmittingDistanceMultiplicator;
_endme = 0;
for "_i" from 0 to 1 step 0 do {
	if !(alive player) exitwith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	if(!life_trycall) exitWith {};
	_radios = player call TFAR_fnc_radiosList;
	if(count _radios < 1) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	_endme = _endme + 5;
	if(_endme > 20) exitwith { [] call ALF_fnc_resetCall; };
	playSound "phone_call";
	sleep 5;
};
