#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_minageSystem.sqf
  Farming System by ALF Team

*/
hint "minageSystem";
private["_pos","_obj"];
_rocku = _this select 0;
_hits = _this select 1;
//reset hit time
if((time - life_hit_time) > 10) then {life_ALF_Hit = 0;};
life_hit_time = time;

life_ALF_Hit = life_ALF_Hit + round(random 2);

if (life_ALF_Hit > _hits) exitWith {
	_pos = [[0.2,0.4,0],[-1.2,0.4,0],[-1.4,0.4,0],[-1.4,1,0],[-1.4,-1,0],[0.5,-1,0],[0,1.2,0],[0.5,1.2,0],[0.5,1,0],[0.7,0.7,0],[1,0.4,0],[0,-1.3,0]] call BIS_fnc_selectRandom;
	_obj = createVehicle ["groundweaponholder", position cursorObject, [], 0, "CAN_COLLIDE"];
	_obj attachTo [cursorObject , _pos];
	_obj addMagazineCargoGlobal [_rocku,1];
	life_ALF_Hit = 0;
	["Minage", "Tu as récolté un minerai.", "success", false] spawn ALF_fnc_doMsg;
	waitUntil {sleep 0.3; (count (magazineCargo _obj)) < 1};
	detach _obj; deleteVehicle _obj;
};
