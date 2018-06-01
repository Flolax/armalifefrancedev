/*
	File : fn_sellHousemobilier.sqf
	Author: NiiRoZz

	This file is for Nanou's HeadlessClient.

	Description:
	Used in selling the house, mobilier sets the owned to 0 and will cleanup with a
	stored procedure on restart.
*/
private["_house","_houseID","_ownerID","_housePos","_query","_radius","_mobiliers"];
_mobilier = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _mobilier) exitWith {};

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
deleteVehicle _mobilier;

[_query,1] call HC_fnc_asyncCall;
["CALL deleteOldmobiliers",1] call HC_fnc_asyncCall;