#include "\ALF_Client\script_macros.hpp"
/*
File: fn_ringPlayerNokia.sqf
Author: ALF Team
Description:
Script pour la reception d'un appel
*/
private _unit = _this select 0;
private _nb = _this select 1;
private _anonyme = _this select 2;
private _hisNumber = _unit getVariable "myPhoneNumber" select 1;
if (isNull _unit OR isNil "_unit") exitWith { [] call ALF_fnc_resetcall; };

private _radios = player call TFAR_fnc_radiosList;
if(count _radios > 0) then {
	if(life_phoneoff) exitwith {};
	if(life_callprogress OR life_phonering) exitwith {};

	life_phonering = true;
	[] spawn ALF_fnc_doCallIn;
	player setVariable ["callAnonyme",_anonyme,true];
	player setVariable ["callFrequence",_nb,true];
	player setVariable ["callNumber",_hisNumber,true];

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

	private _hour = date select 3;
	private _min = date select 4;
	if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
	private _time = format["%1:%2",_hour,_min];
	private _data = [_time,_anonyme,1,_hisNumber];
	life_phone_historique pushBack _data;

	private _myRadio = call TFAR_fnc_activeSwRadio;
	private _myFrequence = call TFAR_fnc_currentSWFrequency;
	private _myRadioCode = _myRadio call TFAR_fnc_getSwRadioCode;
	private _myRadioSetting = call TFAR_fnc_getTransmittingDistanceMultiplicator;
	private _endme = 0;
	for "_i" from 0 to 1 step 0 do {
		if(!life_phonering) exitWith {};
		if(isNull _unit) exitwith {[] call ALF_fnc_resetcall;};
		if !(alive _unit) exitwith {[] call ALF_fnc_resetcall;};
		if !(alive player) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
		private _radios = player call TFAR_fnc_radiosList;
		if(count _radios < 1) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
		if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {[_myRadio,_myFrequence,_myRadioCode,_myRadioSetting] call ALF_fnc_callForceEnd;};
		private _unitID = _unit getVariable "callID";
		if (_unitID isEqualTo 0) exitWith {[] call ALF_fnc_resetCall;};
		if !(MuteTone) then {
			if([(call TFAR_fnc_activeSwRadio),"alf_3310"] call TFAR_fnc_isSameRadio) then {
				[player,"nokia_ring"] remoteExec ["life_fnc_say3D",RANY];
			};
			if([(call TFAR_fnc_activeSwRadio),"alf_iphone"] call TFAR_fnc_isSameRadio) then {
				[] call ALF_fnc_iPhoneRing;
			};
			if([(call TFAR_fnc_activeSwRadio),"alf_neogend"] call TFAR_fnc_isSameRadio) then {
				[player,"SonyRing"] remoteExec ["life_fnc_say3D",RANY];
			};
		} else { playSound "ring_vibreur"; };
		_endme = _endme + 5;
		if(_endme > 20) exitwith {[] call ALF_fnc_resetCall;};
		sleep 5;
	};
};
