#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curObject","_isWater","_fish","_animal","_whatIsIt","_handle"];
_curObject = cursorObject;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (visiblePositionASL player);

if((player getVariable["isEscorting",false])) exitWith {
	[] call life_fnc_copInteractionMenu;
};

if ((_curObject isKindOf "Land_ALF_ATM") && (player distance _curObject < 3)) exitWith {
	["Distributeur", "Il faut inserer une carte bancaire.", "danger", false] spawn ALF_fnc_doMsg;
};

if(((typeOf _curObject) in ALF_Mobiliers_Objects) && {player distance _curObject < 3}) exitWith {
	[_curObject] call life_fnc_mobilierMenu;
};

if((typeOf _curObject) in ["Land_ALF_Station"] && {player distance _curObject < 15}) exitWith {
	[_curObject] call ALF_fnc_stationMenu;
};

if((typeOf _curObject) in ["Land_ALF_Pompe"] && {player distance _curObject < 5}) exitWith {
	[] call life_fnc_FuelStatOpen;
};

if(_curObject isKindOf "House_F" && {player distance _curObject < 12}) exitWith {
	[_curObject] call life_fnc_houseMenu;
};

if(isNull _curObject) exitWith {
	if(_isWater) then {
		_fish = (nearestObjects[player,(LIFE_SETTINGS(getArray,"animaltypes_fish")),3]) select 0;
		if(!isNil "_fish") then {
			if (!alive _fish) then {
				[_fish] call life_fnc_catchFish;
			};
		};
	} else {
		_animal = (nearestObjects[player,(LIFE_SETTINGS(getArray,"animaltypes_hunting")),3]) select 0;
		if (!isNil "_animal") then {
			if (!alive _animal) then {
				[_animal] call life_fnc_gutAnimal;
			};
		};
	};
};

if(dialog) exitWith {};
if(vehicle player != player) exitWith {};
life_action_inUse = true;

//Temp fail safe.
[] spawn {
	sleep 60;
	life_action_inUse = false;
};

//Check if it's a dead body.
if(_curObject isKindOf "Man" && !(_curObject isKindOf "Animal") && {!alive _curObject} && !(_curObject GVAR["Revive",false])) exitWith {
	[_curObject] call life_fnc_revivePlayer;
};

//OK, it wasn't a player so what is it?
private["_isVehicle","_money","_list"];
_list = ["landVehicle","Ship","Air"];
_isVehicle = if(KINDOF_ARRAY(_curObject,_list)) then {true} else {false};
_money = "Land_Money_F";
//It's a vehicle! open the vehicle interaction key!
if(_isVehicle) then {
	if(!dialog) then {
		if(player distance _curObject < SEL(SEL(boundingBox _curObject,1),0)+2 && (!(player GVAR ["restrained",false])) && (!(player GVAR ["playerSurrender",false])) && !life_isknocked && !life_istazed) then {
			[_curObject] call ALF_fnc_menuVehicles;
		};
	};
} else {
	//It wasn't a misc item so is it money?
	if(EQUAL((typeOf _curObject),_money) && {!(_curObject GVAR ["inUse",false])}) then {
		[_curObject,player,true] remoteExecCall ["TON_fnc_pickupAction",RSERV];
	};
};

