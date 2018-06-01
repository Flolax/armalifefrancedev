#include "\ALF_Client\script_macros.hpp"
/*
File: fn_terminateCallCentral.sqf
Author: ALF Team
*/
if(EQUAL((lbCurSel 33121),-1)) exitWith {hint "Il faut selectionner quelqu'un."};
private _cible = lbData[33121,lbCurSel (33121)];
_cible = call compile format["%1", _cible];

[] remoteExec ["ALF_fnc_resetCall",_cible];
