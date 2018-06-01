#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_gangInvitePlayer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the invite process?
*/
private "_unit";
disableSerialization;

_unit = cursorObject;
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit isEqualTo player) exitWith {};
if !(_unit isKindOf "Man") exitWith {};
if(!alive _unit) exitWith {};
if(!isNil {(group _unit) GVAR "gang_name"}) exitWith {hint "Cette personne est déjà dans le groupe.";};

if(count(grpPlayer GVAR ["gang_members",8]) isEqualTo (grpPlayer GVAR ["gang_maxMembers",8])) exitWith {hint localize "STR_GNOTF_MaxSlot"};

private _action = ["Voulez-vous inviter cette personne dans votre groupe?","Invitation Gang","OUI","NON"] call BIS_fnc_guiMessage;

if(_action) then {
	[grpPlayer] remoteExec ["life_fnc_gangInvite",_unit];
	_members = grpPlayer GVAR "gang_members";
	_members pushBack getPlayerUID _unit;
	grpPlayer SVAR ["gang_members",_members,true];
	hint "Invitation envoyée.";
} else {
	hint "Invitation annulée.";
};