#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneRadioConnect.sqf
Author: ALF Team
*/
disableSerialization;
private _display = findDisplay 56400;
private _freq = ctrlText 582505;
if(_freq isEqualTo "") exitWith {};
private _length = count (toArray(_freq));
private _chrByte = toArray (_freq);
private _allowed = toArray("0123456789");
if(_length > 6 || _length < 6) exitWith {hint "Erreur: Fréquence à 6 chiffres."};
if(parseNumber(_freq) < 100000) exitWith {hint "Erreur dans la fréquence."};
private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {};

if(life_forfait isEqualTo 0) exitWith {hint "Ton forfait est épuisé.";};

life_radio_connected = true;

player setVariable ["tf_unable_to_use_radio", false];
[(call TFAR_fnc_activeSwRadio), 1, parseNumber(_freq)] call TFAR_fnc_SetChannelFrequency;
player setVariable ["iPhoneRadioFreq", parseNumber(_freq)];

uiNamespace setVariable ['iphonemenu',7]; [] call ALF_fnc_menuiPhone;

private _myRadio = call TFAR_fnc_activeSwRadio;
for "_i" from 0 to 1 step 0 do {
	if !(alive player) exitWith {[_myRadio] call ALF_fnc_iPhoneRadioDisconnect;};
	private _radios = player call TFAR_fnc_radiosList;
	if(count _radios < 1) exitWith {[_myRadio] call ALF_fnc_iPhoneRadioDisconnect;};
	if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {[_myRadio] call ALF_fnc_iPhoneRadioDisconnect;};
	if(!life_radio_connected) exitWith {};
	sleep 1;
};