#include "\ALF_Client\script_macros.hpp"
/*
File: fn_callInProgress.sqf
Author: ALF Team
Description:
Script pour s'assurer que les joueurs sont en appel
*/
private["_unitID","_myID","_radios","_myRadio","_myFrequence","_myRadioCode","_myRadioSetting"];
life_trycall = false;
life_callprogress = true;
life_radio_connected = false;

if !(isNull (findDisplay 20000)) then {
	uiNamespace setVariable ['nokiamenu',0];
	[] call ALF_fnc_menuNokia;
};
if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',0];
	[] call ALF_fnc_menuiPhone;
};

[] spawn ALF_fnc_callTime;

private _myRadio = call TFAR_fnc_activeSwRadio;
private _myFrequence = call TFAR_fnc_currentSWFrequency;
private _myRadioCode = _myRadio call TFAR_fnc_getSwRadioCode;
private _myRadioSetting = call TFAR_fnc_getTransmittingDistanceMultiplicator;
for "_i" from 0 to 1 step 0 do {
	if(!life_callprogress) exitWith {};
	if !(alive player) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	_radios = player call TFAR_fnc_radiosList;
	if(count _radios < 1) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	sleep 1;
};
