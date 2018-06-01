#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_gangKick.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	32 hours...
*/
private["_unit","_unitID","_members"];
disableSerialization;

if(EQUAL((lbCurSel 123464),-1)) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format["%1",CONTROL_DATA(123464)];

if(isNull _unit) exitWith {}; //Bad unit?
if(_unit isEqualTo player) exitWith {hint localize "STR_GNOTF_KickSelf"};

_unitID = getPlayerUID _unit;
_members = grpPlayer GVAR "gang_members";
if(isNil "_members") exitWith {};
if(!(_members isEqualType [])) exitWith {};

SUB(_members,[_unitID]);
grpPlayer SVAR ["gang_members",_members,true];

[_unit,grpPlayer] remoteExec ["TON_fnc_clientGangKick",_unit]; //Boot that bitch!

[4,grpPlayer] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.

[] call ALF_fnc_menuY;
