#include "\ALF_Client\script_macros.hpp"
/*
File: fn_callInProgress.sqf
Author: ALF Team
Description:
Script pour s'assurer que les joueurs sont en appel
*/
private["_unit","_unitID","_myID","_radios","_myRadio","_myFrequence","_myRadioCode","_myRadioSetting"];
_unit = _this select 0;
life_phonering = false;
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
if !(isNull (findDisplay 32999)) then {
	uiNamespace setVariable ['sony',0];
	[] call ALF_fnc_menuSony;
};

[] spawn ALF_fnc_callTime;

private _myRadio = call TFAR_fnc_activeSwRadio;
private _myFrequence = call TFAR_fnc_currentSWFrequency;
private _myRadioCode = _myRadio call TFAR_fnc_getSwRadioCode;
private _myRadioSetting = call TFAR_fnc_getTransmittingDistanceMultiplicator;

for "_i" from 0 to 1 step 0 do {
	_unitID = _unit getVariable "callID";
	_myID = player getVariable "callID";
	if(!life_callprogress) exitWith {};
	if(isNull _unit) exitWith {[] call ALF_fnc_resetcall;};
	if !(alive _unit) exitWith {[] call ALF_fnc_resetcall;};
	if !(alive player) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	if !(_unitID isEqualTo _myID) exitWith {[] call ALF_fnc_resetcall;};
	if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	_radios = player call TFAR_fnc_radiosList;
	if(count _radios < 1) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	sleep 1;
};
