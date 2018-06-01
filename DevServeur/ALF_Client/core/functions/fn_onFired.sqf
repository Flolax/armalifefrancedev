#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_onFired.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];
_ammoType = SEL(_this,4);
_projectile = SEL(_this,6);

if(EQUAL(_ammoType,"GrenadeHand_stone")) then {
	_projectile spawn {
		private "_position";
		while {!isNull _this} do {
			_position = ASLtoATL (visiblePositionASL _this);
			sleep 0.1;
		};
		[_position] remoteExec ["life_fnc_flashbang",RCLIENT];
	};
};

_unit = _this select 0;
_ammo = _this select 4;

if(_ammo isKindOf "Melee") then {
	_cfg = (configFile>>"CfgAmmo">>_ammo>>"Melee");
	_anim = getText(_cfg>>"anim");
	_unit playActionNow _anim;
};

if(currentWeapon _unit isEqualTo "ALF_PIOCHE") then {
	if ((typeOf cursorObject) isEqualTo "ALF_pierre_cui" && (_unit distance cursorObject) < 2.5) then {
	  ["Land_ALF_pierre_cui_small",2] spawn ALF_fnc_minageSystem;
	};
	if ((typeOf cursorObject) isEqualTo "ALF_pierre_fer" && (_unit distance cursorObject) < 2.5) then {
	  ["Land_ALF_pierre_fer_small",2] spawn ALF_fnc_minageSystem;
	};
	if ((typeOf cursorObject) isEqualTo "ALF_pierre_or" && (_unit distance cursorObject) < 2.5) then {
	  ["Land_ALF_pierre_or_small",3] spawn ALF_fnc_minageSystem;
	};
};
