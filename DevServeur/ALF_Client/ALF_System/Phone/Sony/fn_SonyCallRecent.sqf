#include "\ALF_Client\script_macros.hpp"
/*
File: fn_SonyCallRecent.sqf
Author: ALF Team
*/
private["_unit","_numbercalling","_nullunit","_endme","_radios","_myRadio","_myFrequence","_myRadioCode","_myRadioSetting"];
private _cible = lbData[33132,lbCurSel (33132)];
if(_cible isEqualTo "Aucun historique.") exitWith {};
_cible = call compile format["%1", _cible];

private _anonyme = _cible select 1;
private _number = _cible select 3;
if(_anonyme isEqualTo 1) exitWith {hint "Tu ne peux rappeler un numéro anonyme.";};

private _myNumber = player getVariable "myPhoneNumber" select 1;
if (_number isEqualTo _myNumber) exitWith {hint "Tu ne peux t'appeler toi même.";};
if(life_forfait isEqualTo 0) exitWith {hint "Ton forfait est épuisé.";};

_nullunit = false;
{
	_numbercalling = _x getVariable "myPhoneNumber" select 1;
	if (!isNil "_numbercalling") then {
		if (_number isEqualTo _numbercalling) then {
			_unit = _x;
			_nullunit = true;
		};
	};
} foreach playableUnits;

life_trycall = true;
if (life_radio_connected) then {
	[(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_setAdditionalSwChannel;
};
life_radio_connected = false;

private _hour = date select 3;
private _min = date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
private _time = format["%1:%2",_hour,_min];
private _data = [_time,0,0,_number];
life_phone_historique pushBack _data;

player setVariable ["callID",_myNumber,true];
player setVariable ["callNumber",_number,true];
player setVariable ["callAnonyme",0,true];
player setVariable ["tf_unable_to_use_radio", true];
_nb = random[100000000000000, 500000000000000, 999999999999999];
player setVariable ["callFrequence",_nb,true];
[(call TFAR_fnc_activeSwRadio), 1, _nb] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;

[(call TFAR_fnc_ActiveSWRadio), 2] call TFAR_fnc_setSwStereo;

if(!_nullunit) exitWith { [] spawn ALF_fnc_ringNullPlayer; };
if(!alive _unit) exitWith { [] spawn ALF_fnc_ringNullPlayer; };
_radiounit = _unit call TFAR_fnc_radiosList;
if(count _radiounit < 1) exitWith { [] spawn ALF_fnc_ringNullPlayer; };

_anonyme = 0;
if (life_is_anonyme) then {_anonyme = 1;} else {_anonyme = 0;};
[player,_nb,_anonyme] remoteExec ["ALF_fnc_ringPlayer",_unit];

_radio = call TFAR_fnc_activeSwRadio;
[format[localize "STR_transmit",format ["%1<img size='1.5' image='%2'/>", getText (ConfigFile >> "CfgWeapons" >> _radio >> "displayName"),
	getText(configFile >> "CfgWeapons"  >> _radio >> "picture")], 1, call TFAR_fnc_currentSWFrequency],
format["TANGENT	PRESSED	%1%2	%3	%4",call TFAR_fnc_currentSWFrequency, _radio call TFAR_fnc_getSwRadioCode, getNumber(configFile >> "CfgWeapons" >> _radio >> "tf_range") * (call TFAR_fnc_getTransmittingDistanceMultiplicator), getText(configFile >> "CfgWeapons" >> _radio >> "tf_subtype")],
-1
] call TFAR_fnc_ProcessTangent;

if !(isNull (findDisplay 32999)) then {
	uiNamespace setVariable ['sony',0];
	[] call ALF_fnc_menuSony;
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
