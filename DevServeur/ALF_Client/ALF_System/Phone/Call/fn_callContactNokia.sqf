#include "\ALF_Client\script_macros.hpp"
/*
File: fn_CallContactNokia.sqf
Author: ALF Team
Description:
Script pour appel d'un joueur
*/
private["_unit","_cible","_nullunit"];
if(EQUAL((lbCurSel 20011),-1)) exitWith {hint "Il faut selectionner quelqu'un."};
_cible = lbData[20011,lbCurSel (20011)];
_cible = call compile format["%1", _cible];

private _myNumber = player getVariable "myPhoneNumber" select 1;
if(life_forfait isEqualTo 0) exitWith {hint "Ton forfait est épuisé.";};

_nullunit = false;
{
	private _numbercalling = _x getVariable "myPhoneNumber" select 1;
	if (!isNil "_numbercalling") then {
		if ((_cible select 1) isEqualTo _numbercalling) then {
			_unit = _x;
			_nullunit = true;
		};
	};
} foreach playableUnits;

life_trycall = true;
life_radio_connected = false;

private _hour = date select 3;
private _min = date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
private _time = format["%1:%2",_hour,_min];
private _data = [_time,0,0,_cible select 1];
life_phone_historique pushBack _data;

player setVariable ["callID",_myNumber,true];
player setVariable ["callNumber",_cible select 1,true];
player setVariable ["callAnonyme",0,true];
player setVariable ["tf_unable_to_use_radio", true];
private _nb = random[100000000000000, 500000000000000, 999999999999999];
player setVariable ["callFrequence",_nb,true];
[(call TFAR_fnc_activeSwRadio), 1, _nb] call TFAR_fnc_SetChannelFrequency;

[(call TFAR_fnc_ActiveSWRadio), 2] call TFAR_fnc_setSwStereo;

if(!_nullunit) exitWith { [] spawn ALF_fnc_ringNullPlayer; };
if(!alive _unit) exitWith { [] spawn ALF_fnc_ringNullPlayer; };
private _radiounit = _unit call TFAR_fnc_radiosList;
if(count _radiounit < 1) exitWith { [] spawn ALF_fnc_ringNullPlayer; };

[player,_nb,0] remoteExec ["ALF_fnc_ringPlayer",_unit];

private _radio = call TFAR_fnc_activeSwRadio;
[format[localize "STR_transmit",format ["%1<img size='1.5' image='%2'/>", getText (ConfigFile >> "CfgWeapons" >> _radio >> "displayName"),
	getText(configFile >> "CfgWeapons"  >> _radio >> "picture")], 1, call TFAR_fnc_currentSWFrequency],
format["TANGENT	PRESSED	%1%2	%3	%4",call TFAR_fnc_currentSWFrequency, _radio call TFAR_fnc_getSwRadioCode, getNumber(configFile >> "CfgWeapons" >> _radio >> "tf_range") * (call TFAR_fnc_getTransmittingDistanceMultiplicator), getText(configFile >> "CfgWeapons" >> _radio >> "tf_subtype")],
-1
] call TFAR_fnc_ProcessTangent;

if !(isNull (findDisplay 20000)) then {
	uiNamespace setVariable ['nokiamenu',0];
	[] call ALF_fnc_menuNokia;
};

private _myRadio = call TFAR_fnc_activeSwRadio;
private _myFrequence = call TFAR_fnc_currentSWFrequency;
private _myRadioCode = _myRadio call TFAR_fnc_getSwRadioCode;
private _myRadioSetting = call TFAR_fnc_getTransmittingDistanceMultiplicator;
private _endme = 0;
for "_i" from 0 to 1 step 0 do {
	if(!life_trycall) exitWith {};
	if(isNull _unit) exitWith {[] call ALF_fnc_resetcall;};
	if !(alive _unit) exitWith {[] call ALF_fnc_resetcall;};
	if !(alive player) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	private _radios = player call TFAR_fnc_radiosList;
	if(count _radios < 1) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	private _myID = player getVariable "callID";
	private _unitID = _unit getVariable "callID";
	if (_myID isEqualTo _unitID) exitWith {[_unit] spawn ALF_fnc_callInProgress; };
	_endme = _endme + 5;
	if(_endme > 20) exitWith { [] call ALF_fnc_resetCall; };
	playSound "phone_call";
	sleep 5;
};
