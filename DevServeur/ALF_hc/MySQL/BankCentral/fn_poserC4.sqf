#include "\ALF_hc\hc_macros.hpp"

private["_banque","_unit","_bomb","_comico"];
_banque = _this select 0;
_unit = _this select 1;
if (isNull _banque || isNull _unit) exitWith {};

if (_banque animationPhase "explo" isEqualTo 0) exitWith {};
_banque animate ["explo",0];
["ALF_C4"] remoteExec ["ALF_fnc_p_removeMagazine",_unit];
playSound3D ["ALF_Batiments_2\ALF_Banque\banque_activeC4.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_c4")), 3, 1, 100];
sleep 11;

_bomb = "mini_Grenade" createVehicle (_banque modelToWorld (_banque selectionPosition "p_c4"));
sleep 4;

_banque animate ["explo",1];
_banque animate ["anim_1",0];
_banque animate ["anim_2",1];
_banque animate ["grille",0];
sleep 1;
playSound3D ["ALF_Batiments_2\ALF_Banque\banque_alarm.ogg", _banque, false, (_banque modelToWorld [0,0,0]), 10, 1, 250];
_comico = nearestObjects [player, ["Land_Caserne"], 15000];
{
	playSound3D ["ALF_Batiments_2\ALF_Banque\gendarmerie_redalarm.ogg", _x, false, getPos _x, 10, 1, 100];
} forEach _comico;
