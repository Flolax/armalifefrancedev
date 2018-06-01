#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
[_className] call life_fnc_vehicleShop3DPreview;

_display = findDisplay 2300;
_btnbye = _display displayCtrl 2309;
_btnrent = _display displayCtrl 2308;
_btnbye ctrlEnable false;
_btnrent ctrlEnable false;

[_className,player] remoteExec ["HC_fnc_dispoVehicle",HC_Life];

true;
