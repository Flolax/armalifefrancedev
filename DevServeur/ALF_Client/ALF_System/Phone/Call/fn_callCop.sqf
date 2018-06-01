#include "\ALF_Client\script_macros.hpp"
/*
File: fn_callCop.sqf
Author: ALF Team
*/
private _unitNumber = _this select 0;
private _anonyme = _this select 1;
private _numberCible = _this select 2;

private _unitNumberText = "";
if (_anonyme isEqualTo 1) then {_unitNumberText = "**********";} else {_unitNumberText = _unitNumber;};

private _nb = random[100000000000000, 500000000000000, 999999999999999];
life_trycall = true;
life_radio_connected = false;

player setVariable ["callID",_unitNumber,true];
player setVariable ["callNumber",_numberCible,true];
player setVariable ["callAnonyme",_anonyme,true];
player setVariable ["tf_unable_to_use_radio", true];
player setVariable ["callFrequence",_nb,true];
[(call TFAR_fnc_activeSwRadio), 1, _nb] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_ActiveSWRadio), 2] call TFAR_fnc_setSwStereo;

private _hour = date select 3;
private _min = date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
private _time = format["%1:%2",_hour,_min];
private _data = [_time,0,0,_numberCible];
life_phone_historique pushBack _data;

//Lance la notification chez les Gendarmes.
private _nullunit = false;
{
	_coprank = _x getVariable "CopRank";
	if(_coprank > 0 && player != _x) then {
		_unit = _x;
		["Central de la Gendarmerie.",format["Le numéro %1 tente de joindre la Gendarmerie. Merci de bien vouloir vous connecter au central.",_unitNumberText]] remoteExec ["ALF_fnc_doCopCall",_unit];
		_nullunit = true;
	};
} foreach playableUnits;
if(!_nullunit) exitWith { [] spawn ALF_fnc_ringNullPlayer; };

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

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',0];
	[] call ALF_fnc_menuiPhone;
};

private["_endme","_radios","_myRadio","_myFrequence","_myRadioCode","_myRadioSetting","_sound","_time"];
_myRadio = call TFAR_fnc_activeSwRadio;
_myFrequence = call TFAR_fnc_currentSWFrequency;
_myRadioCode = _myRadio call TFAR_fnc_getSwRadioCode;
_myRadioSetting = call TFAR_fnc_getTransmittingDistanceMultiplicator;
_endme = 0;
_sound = 0;
_time = 0;
for "_i" from 0 to 1 step 0 do {
	if(!life_trycall) exitWith {};
	if !(alive player) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	_radios = player call TFAR_fnc_radiosList;
	if(count _radios < 1) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
	private _myID = player getVariable "callID";
	private _isacop = false;
	{
		private _xID = _x getVariable "callID";
		if (_xID isEqualTo _myID && _x != player) exitWith {_isacop = true;};
	} foreach playableUnits;
	if (_isacop) exitWith {[] spawn ALF_fnc_callInCopCentral;};
	_endme = _endme + 5;
	if(_endme > 100) exitWith { [] call ALF_fnc_resetCall;};
	if(_sound isEqualto 2) then {
		playSound "phone_call";
		_sound = 0;
		_time = 6;
	} else {
		_sound = _sound + 1;
		_time = 4;
		playSound "phone_call";
	};
	sleep _time;
};
