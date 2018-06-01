#include "\ALF_server\script_macros.hpp"
/*
	File: fn_clientDisconnect.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When a client disconnects this will remove their corpse and
	clean up their storage boxes in their house. Also, saves player infos & position.
*/
private["_unit","_id","_uid","_alive","_position"];
_unit = SEL(_this,0);
if(isNull _unit) exitWith {};
_id = SEL(_this,1);
_uid = SEL(_this,2);

//Save player info
if(_uid != HC_UID) then {
	_position = getPosATL _unit;
	if((getMarkerPos "respawn_civilian" distance _position) > 300) then {
		//Call UpdateRequest as unit
		[] remoteExecCall ["SOCK_fnc_updateRequest",_unit];

		_alive = alive _unit;
		[_uid,_alive,3,_position] remoteExec ["HC_fnc_updatePartial",HC_Life];

	};
};

_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} forEach _containers;
deleteVehicle _unit;

[_uid] remoteExecCall ["HC_fnc_houseCleanup",HC_Life];
