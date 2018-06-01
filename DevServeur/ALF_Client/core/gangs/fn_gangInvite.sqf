#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_gangInvite.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Prompts the player about an invite.
*/
private ["_action","_grpMembers"];
params [
	["_group",grpNull,[grpNull]]
];

if(isNull _group) exitWith {}; //Fail horn anyone?
if(!isNil {(group player) GVAR "gang_name"}) exitWith {hint "Vous êtes déjà membre du groupe."};

_gangName = _group GVAR "gang_name";
_action = [
	format["Voulez-vous rejoindre le groupe %1?",_gangName],
	"Invitation groupe",
	"OUI",
	"NON"
] call BIS_fnc_guiMessage;

if(_action) then {
	[player] join _group;
	[4,_group] remoteExecCall ["HC_fnc_updateGang",HC_Life];
} else {
	_grpMembers = grpPlayer GVAR "gang_members";
	SUB(_grpMembers,[steamid]);
	grpPlayer SVAR ["gang_members",_grpMembers,true];
	[4,_grpMembers] remoteExecCall ["HC_fnc_updateGang",HC_Life];
};