#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_survival.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	All survival? things merged into one thread.
*/
private["_fnc_food","_fnc_water","_foodTime","_waterTime","_bp","_walkDis","_lastPos","_curPos"];

_fnc_food =  {
	SUB(life_hunger,10);
	switch(life_hunger) do {
		case 30: {hint localize "STR_NOTF_EatMSG_1";};
		case 20: {hint localize "STR_NOTF_EatMSG_2";};
		case 10: {
			hint localize "STR_NOTF_EatMSG_3";
			player setFatigue 1;
		};
	};
};

_fnc_water = {
	_sum = life_thirst - 10;
	if(_sum < 0) then {_sum = 0;};
	switch(life_thirst) do  {
		case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
		case 20: {
			hint localize "STR_NOTF_DrinkMSG_2";
			player setFatigue 1;
		};
		case 10: {
			hint localize "STR_NOTF_DrinkMSG_3";
			player setFatigue 1;
		};
	};
};

_fnc_drunk = {
	_sum = life_drunk - 10;
	if(_sum < 0) then {_sum = 0;};
	life_drunk = _sum;
	if (life_drunk isEqualTo 0) then {hint "Tu n'as plus d'alcool dans le sang.";};
};

_fnc_myLife = {
	if(life_hunger isEqualTo 100 && life_thirst isEqualTo 100 && (damage player) < 100) then {
		player setDamage (damage player) - .05;
	};
	if(life_hunger < 2 && life_is_alive) then {
		player setDamage (damage player) + .05;
			if (getFatigue player < 1) then {
				player setFatigue 1;
			};
	};
	if(life_thirst < 2 && life_is_alive) then {
		player setDamage (damage player) + .05;
			if (getFatigue player < 1) then {
				player setFatigue 1;
			};
	};
};
//Melee
[] spawn {
  _mweapons = ["ALF_Pioche","ALF_Batte","ALF_Couteau","ALF_matraque","ALF_Marteau","ALF_faux"];
  for "_i" from 0 to 1 step 0 do {
    waitUntil{sleep 1; ((secondaryWeapon player) in _mweapons) && !("sharp_swing" in (magazines player)) && ((player ammo (currentWeapon player)) == 0)};
    player addMagazine "sharp_swing";
    sleep 1;
  };
};

//Setup the time-based variables.
_foodTime = time;
_waterTime = time;
_drunkTime = time;
_myLifeTime = time;
_walkDis = 0;
_bp = "";
_lastPos = visiblePosition player;
_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
_lastState = vehicle player;

for "_i" from 0 to 1 step 0 do {
	/* Thirst / Hunger adjustment that is time based */
	if((time - _waterTime) > 600) then {[] spawn _fnc_water; _waterTime = time;};
	if((time - _foodTime) > 850) then {[] spawn _fnc_food; _foodTime = time;};
	if((time - _drunkTime) > 360) then {if (life_drunk > 0) then {[] spawn _fnc_drunk;}; _drunkTime = time;};
	if((time - _myLifeTime) > 60) then {[] spawn _fnc_myLife; _myLifeTime = time;};

	/* Check if the player's state changed? */
	if(vehicle player != _lastState OR {!alive player}) then {
		[] call ALF_fnc_updateViewDistance;
		_lastState = vehicle player;
	};

	/* Travelling distance to decrease thirst/hunger which is captured every second so the distance is actually greater then 650 */
	if(!alive player) then {_walkDis = 0;} else {
		_curPos = visiblePosition player;
		_curPos = (SEL(_curPos,0)) + (SEL(_curPos,1));
		if(!(EQUAL(_curPos,_lastPos)) && {(isNull objectParent player)}) then {
			ADD(_walkDis,1);
			if(EQUAL(_walkDis,650)) then {
				_walkDis = 0;
				SUB(life_thirst,5);
				SUB(life_hunger,5);
			};
		};
		_lastPos = visiblePosition player;
		_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
	};
	uiSleep 1;
};
