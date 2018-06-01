/*
	File: fn_vehicleCreate.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Answers the query request to create the vehicle in the database.
*/
private["_uid","_type","_classname","_color","_plate"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param;

//Error checks
if(_uid isEqualTo "" OR isNull _vehicle) exitWith {};
if(!alive _vehicle) exitWith {};
_className = typeOf _vehicle;
_type = switch(true) do {
	case (_vehicle isKindOf "Car"): {"Car"};
	case (_vehicle isKindOf "Air"): {"Air"};
	case (_vehicle isKindOf "Ship"): {"Ship"};
};

_letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
_numbers = ["0","1","2","3","4","5","6","7","8","9"];
_ps1 = format ["%1", "-"];
_ps2 = format ["%1", "-"];
_pl1 = format ["%1", _letters call bis_fnc_selectrandom];
_pl2 = format ["%1", _letters call bis_fnc_selectrandom];
_pl3 = format ["%1", _letters call bis_fnc_selectrandom];
_pl4 = format ["%1", _letters call bis_fnc_selectrandom];
_pn1 = format ["%1", _numbers call bis_fnc_selectrandom];
_pn2 = format ["%1", _numbers call bis_fnc_selectrandom];
_pn3 = format ["%1", _numbers call bis_fnc_selectrandom];
_pfinal = [_pl1, _pl2, _ps1, _pn1, _pn2, _pn3, _ps2, _pl3, _pl4];

_query = format["SELECT plate FROM vehicles WHERE plate='%1'",_pfinal];
_queryresult = [_query,2] call HC_fnc_asyncCall;

if((count _queryresult) isEqualTo 0) then {
	[_uid,_type,_classname,_pfinal] call HC_fnc_insertVehicle;
	_insure = 0;
	_vehicle setVariable ["dbInfo",[_uid,_pfinal,_insure],true];
	_vehicle setObjectTextureGlobal [1, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 0]];
	_vehicle setObjectTextureGlobal [2, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 1]];
	_vehicle setObjectTextureGlobal [3, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 3]];
	_vehicle setObjectTextureGlobal [4, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 4]];
	_vehicle setObjectTextureGlobal [5, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 5]];
	_vehicle setObjectTextureGlobal [6, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 7]];
	_vehicle setObjectTextureGlobal [7, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 8]];
} else {
	[_uid,_vehicle] call HC_fnc_vehicleCreate;
};
