#include "\ALF_Client\script_macros.hpp"
/*
File: fn_joinCallCentral.sqf
Author: ALF Team
*/
if(EQUAL((lbCurSel 33121),-1)) exitWith {hint "Il faut selectionner quelqu'un."};
private _cible = lbData[33121,lbCurSel (33121)];
_cible = call compile format["%1", _cible];

private _unitCallNumber = _cible getVariable "callNumber";
if !(_unitCallNumber isEqualTo "17") exitWith {hint "Cette personne n'est plus connecté au central."};

Call_Central = true;
life_callprogress = true;

private _anonyme = _cible getVariable "callAnonyme";
private _unitID = _cible getVariable "callID";
private _unitRealNumber = _cible getVariable "myPhoneNumber" select 1;
player setVariable ["callID",_unitID,true];
player setVariable ["callAnonyme",_anonyme,true];
player setVariable ["callNumber",_unitRealNumber,true];
player setVariable ["tf_unable_to_use_radio",true];

private _freq = _cible getVariable "callFrequence";
[(call TFAR_fnc_activeSwRadio), 1, _freq] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_ActiveSWRadio), 2] call TFAR_fnc_setSwStereo;

private _radio = call TFAR_fnc_activeSwRadio;
[format[localize "STR_transmit",format ["%1<img size='1.5' image='%2'/>", getText (ConfigFile >> "CfgWeapons" >> _radio >> "displayName"),
	getText(configFile >> "CfgWeapons"  >> _radio >> "picture")], 1, call TFAR_fnc_currentSWFrequency],
format["TANGENT	PRESSED	%1%2	%3	%4",call TFAR_fnc_currentSWFrequency, _radio call TFAR_fnc_getSwRadioCode, getNumber(configFile >> "CfgWeapons" >> _radio >> "tf_range") * (call TFAR_fnc_getTransmittingDistanceMultiplicator), getText(configFile >> "CfgWeapons" >> _radio >> "tf_subtype")],
-1
] call TFAR_fnc_ProcessTangent;

if !(isNull (findDisplay 32999)) then {
	uiNamespace setVariable ['sony',0];
	[] call ALF_fnc_menuSony;
};

[] spawn ALF_fnc_callTime;

private["_endme","_radios","_myRadio","_myFrequence","_myRadioCode","_myRadioSetting","_sound","_time"];
_myRadio = call TFAR_fnc_activeSwRadio;
_myFrequence = call TFAR_fnc_currentSWFrequency;
_myRadioCode = _myRadio call TFAR_fnc_getSwRadioCode;
_myRadioSetting = call TFAR_fnc_getTransmittingDistanceMultiplicator;
for "_i" from 0 to 1 step 0 do {
	_unitID = _cible getVariable "callID";
	if(!life_callprogress) exitWith {};
	if(isNull _cible) exitWith {[] call ALF_fnc_resetcall;};
	if !(alive _cible) exitWith {[] call ALF_fnc_resetcall;};
	if !(alive player) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	if (_unitID isEqualTo 0) exitWith {[] call ALF_fnc_resetcall;};
	if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	_radios = player call TFAR_fnc_radiosList;
	if(count _radios < 1) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	sleep 1;
};