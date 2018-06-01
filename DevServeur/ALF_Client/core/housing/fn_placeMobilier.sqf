#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_placeMobilier.sqf
  Author: ALF Team
	Description:
	Check mobilier if are in house and if house are owner of player and if all this conditions are true add mobilier in database
*/
private["_mobilier","_isFloating"];
params [
        ["_mobilier",objNull,[objNull]],
        ["_isFloating",true,[true]]
];

private _uid = getPlayerUID player;
private _house = nearestObject [position player, "house"];

private _message = 0;
private _isPlaced = false;
if (!isNull _house) then {
    _message = 1;
    if (([player] call life_fnc_PlayerInBuilding) && {([_mobilier] call life_fnc_PlayerInBuilding)}) then {
        _message = 2;
        if ((_house in life_vehicles) && !(isNil {_house getVariable "house_owner"})) then {
            _message = 3;
            if (!_isFloating) then {
                _message = 4;
                private _mobiliers = _house getVariable ["mobiliers",[]];
                private _houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
                if (_houseCfg isEqualTo []) exitWith {};
                if (count _mobiliers < (_houseCfg select 1)) then {
                    _isPlaced = true;
                    [_uid,_mobilier] remoteExec ["HC_fnc_addMobilier",HC_Life];
                    _mobilier setVariable ["mobilier_owner",[_uid],true];
                    _mobiliers pushBack _mobilier;
                    _house setVariable ["mobiliers",_mobiliers,true];
                };
            };
        };
    };
};

if (_isPlaced) exitWith {};

[life_mobilier_activeMun,true] call life_fnc_handleItem;
life_mobilier_activeMun = "";
deleteVehicle _mobilier;

if (_message isEqualTo 0 || _message isEqualTo 1) then {
    hint localize "STR_House_Container_House_Near";
};
if (_message isEqualTo 2) then {
    hint localize "STR_House_Container_House_Near_Owner";
};
if (_message isEqualTo 3) then {
    hint localize "STR_House_Container_Floating";
};
if (_message isEqualTo 4) then {
    hint localize "STR_ISTR_Box_HouseFull";
};