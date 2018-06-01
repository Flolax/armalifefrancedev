#include "\ALF_Client\script_macros.hpp"
/*
	File : fn_mobilierSystem.sqf
	Author: ALF Team
	Description:
	Create Storage and attachto player;
*/
private["_kit","_3dkit"];
_kit = _this select 0;

if (!([player] call life_fnc_PlayerInBuilding)) exitWith {hint "Tu ne peux pas monter ton mobilier ici.";};
private _house = nearestObject [player, "House"];
if (isNull _house) exitWith {};
if (isNil {_house getVariable "house_owner"}) exitWith {hint "Cette maison n'est pas a toi."};
private _houseuidowner = (_house getVariable "house_owner") select 0;
private _uidplayer = getPlayerUID player;
if !(_houseuidowner isEqualTo _uidplayer) exitWith {hint "Ce n'est pas ta maison";};
if (life_action_inUse) exitWith {};

[_kit,false] call life_fnc_handleItem;

_3dkit = createVehicle ["groundweaponholder", position player, [], 0, "CAN_COLLIDE"];
_3dkit attachTo [player,[0,1.5,0.7]];
_3dkit addMagazineCargoGlobal [_kit,1];

private _upp = "Montage du mobilier";
life_action_inUse = true;
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
private _ui = GVAR_UINS "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
private _cP = 0.01;
for "_i" from 0 to 1 step 0 do {
	if((count (magazineCargo _3dkit)) < 1) exitWith {life_interrupted = true; detach _3dkit;	deletevehicle _3dkit;};
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.27;
	_cP = _cP + 0.035;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {life_interrupted = true; detach _3dkit;	deletevehicle _3dkit;};
	if(player != vehicle player) exitWith {life_interrupted = true; detach _3dkit;	deletevehicle _3dkit;};
	if(life_interrupted) exitWith {player addMagazine _kit; detach _3dkit;	deletevehicle _3dkit;};
};
life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
detach _3dkit;	deletevehicle _3dkit;

if(!alive player) exitWith {};
if(player != vehicle player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé.","PLAIN"]; life_action_inUse = false;};


life_mobilier_active = true;

private _name = M_CONFIG(getText,"ALFCfgMobiliers",_kit,"item");
private _object = _name createVehicle [0,0,0];

life_mobilier_activeObj = _object;
life_mobilier_activeMun = _kit;
private _attachPos = [0.16, 1.5, ((boundingBoxReal _object) select 1) select 2];
_object attachTo[player, _attachPos];
_object enableSimulation false;
clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearItemCargoGlobal _object;
clearBackpackCargoGlobal _object;
titleText ["[ESPACE] pour placer l'object, [PAGE UP] pour l'orienter.", "PLAIN"];

for "_i" from 0 to 1 step 0 do {
	if(!alive player) exitWith {life_mobilier_active = false; detach _object;	deletevehicle _object;};
	if(player != vehicle player) exitWith {life_mobilier_active = false; detach _object;	deletevehicle _object;};
	if(!life_mobilier_active) exitWith {};
	sleep 1;
};
