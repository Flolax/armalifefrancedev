#include "\ALF_Client\script_macros.hpp"
/*
File: fn_taillageSystem .sqf
Author: ALF Team

Description:
Transform items to something else.

Use:
[player,"ITEM_U","ITEM_P",NUMBER_U,NUMBER_P,HITS,CursorObject] spawn ALF_fnc_taillageSystem;

*/
private ["_unit","_uitems","_pitems","_nbu","_nbp","_hits","_countItems","_uPos"];
_unit = _this select 0;
_uitems = _this select 1;
_pitems = _this select 2;
_nbu = _this select 3; //nombre requis
_nbp = _this select 4; //nombre transformé
_hits = _this select 5;
_uPos = getPos _unit;
_countItems = {_uitems isEqualTo _x} count (magazines _unit);
if ((_countItems < _nbu) && !life_attachObject) exitWith {["Info", "Tu n'as pas ce qu'il faut.", "warning", false] spawn ALF_fnc_doMsg;};
if ((_countItems < _nbu-1) && life_attachObject) exitWith {["Info", "Tu n'as pas ce qu'il faut.", "warning", false] spawn ALF_fnc_doMsg;};

//reset hit time
if((time - life_hit_time) > 10) then {life_ALF_Hit = 0;};
life_hit_time = time;


/////////////////////////// PROCESS ///////////////////////////////////////
if ((count (attachedobjects cursorObject) <= 4) && ((typeOf cursorObject) isEqualTo "ALF_Tailleuse")) then {
	life_attachObject = true;

	_pos = [-0.25,-0.1,0];
	switch (count (attachedobjects cursorObject)) do {
		case 1 : { _pos = [-0.25,-0.1,0]; };
		case 2 : { _pos = [0.2,-0.2,0]; };
		case 3 : { _pos = [-0.6,-0.2,0]; };
		case 4 : { _pos = [-0.95,-0.2,0]; };
		default {  _pos = [-0.25,-0.1,0]; };
	};

	_unit removeMagazine _uitems;

	_obj = createVehicle ["groundweaponholder", position cursorObject, [], 0, "CAN_COLLIDE"];
	_obj attachTo [cursorObject, _pos];
	_obj addMagazineCargoGlobal [_uitems,1];
	waitUntil {sleep 0.3; (count (magazineCargo _obj)) > 0};

for "_i" from 0 to 1 step 0 do {
	  if(_unit distance _uPos > 50) exitWith {["Oops...", "Quelqu'un t'as volé ton minerai.", "danger", false] spawn ALF_fnc_doMsg; detach _obj; deleteVehicle _obj; life_ALF_Hit = 0; life_attachObject = false;};
	  if((count (magazineCargo _obj)) isEqualTo 0) exitWith {["Info", "Tu as récupéré ton minerai.", "warning", false] spawn ALF_fnc_doMsg; life_ALF_Hit = 0; life_attachObject = false; detach _obj; deleteVehicle _obj;};
	  if (life_ALF_Hit isEqualTo _hits) exitWith {
	    for "_i" from 1 to _nbu-1 do {
			_unit removeMagazine _uitems;
			};
			detach _obj; deleteVehicle _obj;
			_obj2 = createVehicle ["groundweaponholder", position cursorObject, [], 0, "CAN_COLLIDE"];
			_obj2 attachTo [cursorObject, _pos];
			_obj2 addMagazineCargoGlobal [_pitems,_nbp];

			waitUntil {sleep 0.3; (count (magazineCargo _obj2)) > 0};
			["C'est prêt!", "Ton minerai est taillé.", "success", false] spawn ALF_fnc_doMsg;
			waitUntil {sleep 0.3; (count (magazineCargo _obj2)) isEqualTo 0};
			detach _obj2; deleteVehicle _obj2;
			life_ALF_Hit = 0;
			life_attachObject = false;
	  };
	  sleep 0.5;
	};
};

//Addition des hits
life_ALF_Hit = life_ALF_Hit + 1;
