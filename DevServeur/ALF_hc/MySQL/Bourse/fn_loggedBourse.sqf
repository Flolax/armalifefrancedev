/*
	File:
	Author:

	This file is for Nanou's HeadlessClient.

	Description:

*/
private["_player"];

_player = _this select 0;
[1,ALFMARKET_Items_PriceArr] remoteExecCall ["ALF_fnc_updateClientBourse", _player];