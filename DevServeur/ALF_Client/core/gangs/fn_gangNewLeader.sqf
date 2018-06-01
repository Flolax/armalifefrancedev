#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_gangNewLeader.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if(EQUAL((lbCurSel 123464),-1)) exitWith {hint localize "STR_GNOTF_TransferSelect"};
_unit = call compile format["%1",CONTROL_DATA(123464)];

if(isNull _unit) exitWith {}; //Bad unit?
if(_unit isEqualTo player) exitWith {hint "Tu ne peux pas te mettre leader."};

_action = [
	"Voulez-vous mettre cette personne en leader du groupe?",
	"Groupe Leader",
	"OUI",
	"NON"
] call BIS_fnc_guiMessage;

if(_action) then {
	_unitID = getPlayerUID _unit;
	if(EQUAL(_unitID,"")) exitWith {hint localize "STR_GNOTF_badUID";}; //Unlikely?
	grpPlayer SVAR ["gang_owner",_unitID,true];
	grpPlayer selectLeader _unit;
	[_unit,grpPlayer] remoteExec ["TON_fnc_clientGangLeader",_unit]; //Boot that bitch!

	[3,grpPlayer] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.

} else {
	hint localize "STR_GNOTF_TransferCancel";
};
[] call ALF_fnc_menuY;