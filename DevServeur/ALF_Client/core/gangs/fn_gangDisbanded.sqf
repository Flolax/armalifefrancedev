/*
	File: fn_gangDisbanded.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Notifies members that the gang has been disbanded.
*/
private "_group";
_group = param [0,grpNull,[grpNull]];
if(isNull _group) exitWith {}; //Fail horn please.

hint "Votre groupe a été supprimé.";
[player] joinSilent (createGroup civilian);

if(count units _group isEqualTo 0) then {
	deleteGroup _group;
};

if !(isNull (findDisplay 123450)) then {
	[] call ALF_fnc_menuY;
};
