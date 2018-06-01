#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_buyHouse.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = param [0,objNull,[objNull]];
_uid = steamid;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house GVAR ["house_owned",false])) exitWith {hint localize "STR_House_alreadyOwned";};
if(!isNil {(_house GVAR "house_sold")}) exitWith {hint localize "STR_House_Sell_Process"};
if(!license_home) exitWith {hint localize "STR_House_License"};
if(count life_houses >= (LIFE_SETTINGS(getNumber,"house_limit"))) exitWith {hint format[localize "STR_House_Max_House",LIFE_SETTINGS(getNumber,"house_limit")]};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(EQUAL(count _houseCfg,0)) exitWith {};

_action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	private _handle = [(_houseCfg select 0)] call ALF_fnc_handleCB;
	if (_handle) exitWith {["Carte Bancaire", "Le paiement a été refusé.", "danger", false] spawn ALF_fnc_doMsg;};

	[_uid,_house] remoteExec ["HC_fnc_addHouse",HC_Life];
	[0] call SOCK_fnc_updatePartial;

	_house SVAR ["house_owner",[_uid,profileName],true];
	_house SVAR ["locked",true,true];
	_house SVAR ["mobiliers",[],true];
	_house SVAR ["uid",floor(random 99999),true];

	life_vehicles pushBack _house;
	life_houses pushBack [str(getPosATL _house),[]];
	private _marker = createMarkerLocal [format["house_%1",(_house GVAR "uid")],getPosATL _house];
	private _houseName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _house), "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	private _numOfDoors = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(typeOf _house),"numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house SVAR [format["bis_disabled_Door_%1",_i],1,true];
	};
};
