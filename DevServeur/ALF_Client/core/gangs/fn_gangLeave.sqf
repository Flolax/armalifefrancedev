#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_gangLeave.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	32 hours later...
*/
private["_unitID ","_members"];
if(EQUAL(steamid,(grpPlayer GVAR "gang_owner"))) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_unitID = getPlayerUID player;
_members = grpPlayer GVAR "gang_members";
if(isNil "_members") exitWith {};
if(!(_members isEqualType [])) exitWith {};

SUB(_members,[_unitID]);
grpPlayer SVAR ["gang_members",_members,true];

[player,grpPlayer] remoteExec ["TON_fnc_clientGangLeft",player];

[4,grpPlayer] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.

closeDialog 0;
