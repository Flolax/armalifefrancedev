#include "\ALF_hc\hc_macros.hpp"
/*
	File:
	Author:

	This file is for Nanou's HeadlessClient.

	Description:

*/
private ["_obj2","_cp","_obj","_unit","_uitems","_pitems","_curTarget"];
_unit = _this select 0;
_uitems = _this select 1;
_pitems = _this select 2;
_curTarget = _this select 3;

/////////////////////////// PROCESS ///////////////////////////////////////
_curTarget animate ['door', 1];
[_uitems] remoteExec ["ALF_fnc_p_removeMagazine",_unit];

waitUntil {sleep 0.1; _curTarget animationPhase "door" isEqualTo 1;};

_obj = createVehicle ["groundweaponholder", position _curTarget, [], 0, "CAN_COLLIDE"];
_obj attachTo [_curTarget, [-0.65,0.3,0.15]];
_obj addMagazineCargoGlobal [_uitems,1];

sleep 1;
_curTarget animate ['door', 0];
waitUntil {sleep 0.3; _curTarget animationPhase "door" isEqualTo 0;};
if((count (magazineCargo _obj)) < 1) exitWith {["Info", "Tu as récupéré ton minerai.", "warning", false] remoteExec ["ALF_fnc_doMsg",_unit]; _curTarget animate ['start', 0]; _curTarget animate ['end', 0]; _curTarget animate ['door', 0]; detach _obj; deleteVehicle _obj;};
detach _obj; deleteVehicle _obj;

["Info", "Le four est en route.", "warning", false] remoteExec ["ALF_fnc_doMsg",_unit];
[_curTarget,"ALF_Four"] remoteExec ["life_fnc_say3D",RANY];
_curTarget animate ['start', 1];
_curTarget animate ['end', 1];

_cp = 0;
for "_i" from 0 to 1 step 0 do {
	_cp = _cp + 0.5;
  if (_cp > 5) exitWith {
		_obj2 = createVehicle ["groundweaponholder", position _curTarget, [], 0, "CAN_COLLIDE"];
		_obj2 attachTo [_curTarget, [-0.65,0.19,0.27]];
		_obj2 addMagazineCargoGlobal [_pitems,1];
		waitUntil {sleep 0.3; (count (magazineCargo _obj2)) > 0};
		_curTarget animate ['door', 1];
  	_curTarget animate ['start', 0];
		_curTarget animate ['end', 0];
		["Fonderie", "Ton minerai est prêt.", "success", false] remoteExec ["ALF_fnc_doMsg",_unit];
  };
  sleep 0.5;
};

