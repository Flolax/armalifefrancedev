/*
	File : fn_deleteDBmobilier.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
	Delete mobilier and remove mobilier in Database
*/
diag_log "deleteDBMobilier";
private["_house","_houseID","_ownerID","_housePos","_query","_radius","_mobiliers"];
_mobilier = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _mobilier) exitWith  {diag_log "mobilier null";};

_mobilierID = _mobilier getVariable["mobilier_id",-1];
if(_mobilierID isEqualTo -1) then {
	_mobilierPos = getPosATL _mobilier;
	_ownerID = (_mobilier getVariable "mobilier_owner") select 0;
	_query = format["UPDATE mobiliers SET owned='0', pos='[]' WHERE pid='%1' AND pos='%2' AND owned='1'",_ownerID,_mobilierPos];
} else {
	_query = format["UPDATE mobiliers SET owned='0', pos='[]' WHERE id='%1'",_mobilierID];
};
_mobilier setVariable ["mobilier_id",nil,true];
_mobilier setVariable ["mobilier_owner",nil,true];

[_query,1] call HC_fnc_asyncCall;

["CALL deleteOldmobiliers",1] call HC_fnc_asyncCall;
deleteVehicle _mobilier;
