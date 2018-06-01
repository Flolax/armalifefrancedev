#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_menuY.sqf
	Author: ALF Team
	Description:

*/
private["_display","_struct"];
if(!dialog) then {createDialog "ymenu_dialog"};
disableSerialization;
_display = findDisplay 123450;

_pmenupic = _display displayCtrl 123451;
_pmenubtn = _display displayCtrl 1234511;
_pmoney = _display displayCtrl 123452;
_pedit = _display displayCtrl 123453;
_pbtngive = _display displayCtrl 123454;
_plicense = _display displayCtrl 123455;

_kmenupic = _display displayCtrl 123456;
_kmenubtn = _display displayCtrl 1234561;
_klistbox = _display displayCtrl 123457;
_kgivebtn = _display displayCtrl 123458;
_kjeterbtn = _display displayCtrl 123459;

_gmenupic1 = _display displayCtrl 123460;
_gmenupic2 = _display displayCtrl 123461;
_gmenubtn = _display displayCtrl 1234601;
_gedit = _display displayCtrl 123462;
_gcreatebtn = _display displayCtrl 123463;
_glistbox = _display displayCtrl 123464;
_gname = _display displayCtrl 123465;
_gpic1 = _display displayCtrl 123466;
_gpic2 = _display displayCtrl 123467;
_gpic3 = _display displayCtrl 123468;
_gpic4 = _display displayCtrl 123469;
_gpic5 = _display displayCtrl 123470;
_gpic6 = _display displayCtrl 123471;
_gbtn1 = _display displayCtrl 123472;
_gbtn2 = _display displayCtrl 123473;
_gbtn3 = _display displayCtrl 123474;
_gbtn4 = _display displayCtrl 123475;
_gbtn5 = _display displayCtrl 123476;
_gbtn6 = _display displayCtrl 123477;

_pamenupic = _display displayCtrl 123478;
_pamenubtn = _display displayCtrl 1234781;
_pacheckbox = _display displayCtrl 123479;
_pafootslider = _display displayCtrl 123480;
_pafootedit = _display displayCtrl 123481;
_pacarslider = _display displayCtrl 123482;
_pacaredit = _display displayCtrl 123483;
_paairslider = _display displayCtrl 123484;
_paairedit = _display displayCtrl 123485;


_menu = uiNamespace getVariable "ymenu";
switch (_menu) do {
	case 0 : {
		//Btn Menu
		_pmenubtn ctrlShow false;
		_kmenubtn ctrlShow true;
		_gmenubtn ctrlShow true;
		//Player Menu
		_pmenupic ctrlShow true;
		_pmoney ctrlShow true;
		_pedit ctrlShow true;
		_pbtngive ctrlShow true;
		_plicense ctrlShow true;
		//Key Menu
		_kmenupic ctrlShow false;
		_klistbox ctrlShow false;
		_kgivebtn ctrlShow false;
		_kjeterbtn ctrlShow false;
		//Group Menu
		_gmenupic1 ctrlShow false;
		_gmenupic2 ctrlShow false;
		_gedit ctrlShow false;
		_gcreatebtn ctrlShow false;
		_glistbox ctrlShow false;
		_gname ctrlShow false;
		_gpic1 ctrlShow false;
		_gpic2 ctrlShow false;
		_gpic3 ctrlShow false;
		_gpic4 ctrlShow false;
		_gpic5 ctrlShow false;
		_gpic6 ctrlShow false;
		_gbtn1 ctrlShow false;
		_gbtn2 ctrlShow false;
		_gbtn3 ctrlShow false;
		_gbtn4 ctrlShow false;
		_gbtn5 ctrlShow false;
		_gbtn6 ctrlShow false;
		//Param Menu
		_pamenupic ctrlShow false;
		_pamenubtn ctrlShow true;
		_pacheckbox ctrlShow false;
		_pafootslider ctrlShow false;
		_pafootedit ctrlShow false;
		_pacarslider ctrlShow false;
		_pacaredit ctrlShow false;
		_paairslider ctrlShow false;
		_paairedit ctrlShow false;

		_pmoney ctrlSetStructuredText parseText format["<t align='center' shadow='0' size='1.5px'>%1</t>",[life_cash] call life_fnc_numberText];
		_struct = "";
		{
			_displayName = getText(_x >> "displayName");
			if(LICENSE_VALUE(configName _x)) then {
				_struct = _struct + format["%1<br/>",localize _displayName];
			};
		} forEach ("true" configClasses (missionConfigFile >> "Licenses"));
		if(_struct isEqualTo "") then {
			_struct = "Tu n'as pas de licence.";
		};
		_plicense ctrlSetStructuredText parseText format["<t align='center' shadow='0' size='1px'>%1</t>",_struct];
	};
	case 1 : {
		//Btn Menu
		_pmenubtn ctrlShow true;
		_kmenubtn ctrlShow false;
		_gmenubtn ctrlShow true;
		//Player Menu
		_pmenupic ctrlShow false;
		_pmoney ctrlShow false;
		_pedit ctrlShow false;
		_pbtngive ctrlShow false;
		_plicense ctrlShow false;
		//Key Menu
		_kmenupic ctrlShow true;
		_klistbox ctrlShow true;
		_kgivebtn ctrlShow true;
		_kjeterbtn ctrlShow true;
		//Group Menu
		_gmenupic1 ctrlShow false;
		_gmenupic2 ctrlShow false;
		_gedit ctrlShow false;
		_gcreatebtn ctrlShow false;
		_glistbox ctrlShow false;
		_gname ctrlShow false;
		_gpic1 ctrlShow false;
		_gpic2 ctrlShow false;
		_gpic3 ctrlShow false;
		_gpic4 ctrlShow false;
		_gpic5 ctrlShow false;
		_gpic6 ctrlShow false;
		_gbtn1 ctrlShow false;
		_gbtn2 ctrlShow false;
		_gbtn3 ctrlShow false;
		_gbtn4 ctrlShow false;
		_gbtn5 ctrlShow false;
		_gbtn6 ctrlShow false;
		//Param Menu
		_pamenupic ctrlShow false;
		_pamenubtn ctrlShow true;
		_pacheckbox ctrlShow false;
		_pafootslider ctrlShow false;
		_pafootedit ctrlShow false;
		_pacarslider ctrlShow false;
		_pacaredit ctrlShow false;
		_paairslider ctrlShow false;
		_paairedit ctrlShow false;

		lbClear _klistbox;
		for "_i" from 0 to (count life_vehicles)-1 do {
			_veh = life_vehicles select _i;
			if(!isNull _veh && alive _veh) then {
				_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
				_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
				_klistbox lbAdd format["%1",_name];
				if(_pic != "pictureStaticObject") then {
					_klistbox lbSetPicture [(lbSize _klistbox)-1,_pic];
				};
				_klistbox lbSetData [(lbSize _klistbox)-1,str(_i)];
			};
		};
	};

	case 2 : {
		//Btn Menu
		_pmenubtn ctrlShow true;
		_kmenubtn ctrlShow true;
		_gmenubtn ctrlShow false;
		//Player Menu
		_pmenupic ctrlShow false;
		_pmoney ctrlShow false;
		_pedit ctrlShow false;
		_pbtngive ctrlShow false;
		_plicense ctrlShow false;
		//Key Menu
		_kmenupic ctrlShow false;
		_klistbox ctrlShow false;
		_kgivebtn ctrlShow false;
		_kjeterbtn ctrlShow false;
		//Param Menu
		_pamenupic ctrlShow false;
		_pamenubtn ctrlShow true;
		_pacheckbox ctrlShow false;
		_pafootslider ctrlShow false;
		_pafootedit ctrlShow false;
		_pacarslider ctrlShow false;
		_pacaredit ctrlShow false;
		_paairslider ctrlShow false;
		_paairedit ctrlShow false;
		//Group menu
		if(isNil "life_action_gangInUse") then { _gcreatebtn ctrlShow true; } else { _gcreatebtn ctrlShow false; };
		if(isNil {(group player) getVariable "gang_owner"}) then {
				_gmenupic1 ctrlShow true;
				_gmenupic2 ctrlShow false;
				_gedit ctrlShow true;
				_glistbox ctrlShow false;
				_gname ctrlShow false;
				_gpic1 ctrlShow false;
				_gpic2 ctrlShow false;
				_gpic3 ctrlShow false;
				_gpic4 ctrlShow false;
				_gpic5 ctrlShow false;
				_gpic6 ctrlShow false;
				_gbtn1 ctrlShow false;
				_gbtn2 ctrlShow false;
				_gbtn3 ctrlShow false;
				_gbtn4 ctrlShow false;
				_gbtn5 ctrlShow false;
				_gbtn6 ctrlShow false;
			} else {
			_gmenupic1 ctrlShow false;
			_gmenupic2 ctrlShow true;
			_gedit ctrlShow false;
			_glistbox ctrlShow true;
			_gname ctrlShow true;
			_gbtn1 ctrlShow true;
			_gpic1 ctrlShow true;

			_ownerID = grpPlayer getVariable ["gang_owner",""];
			_gangName = grpPlayer getVariable "gang_name";
			_gangMax = grpPlayer getVariable "gang_maxMembers";

			if(_ownerID != steamid) then {
				_gpic2 ctrlShow false;
				_gpic3 ctrlShow false;
				_gpic4 ctrlShow false;
				_gpic5 ctrlShow false;
				_gpic6 ctrlShow false;
				_gbtn2 ctrlShow false;
				_gbtn3 ctrlShow false;
				_gbtn4 ctrlShow false;
				_gbtn5 ctrlShow false;
				_gbtn6 ctrlShow false;
			} else {
				_gpic2 ctrlShow true;
				_gpic3 ctrlShow true;
				_gpic4 ctrlShow true;
				_gpic5 ctrlShow true;
				_gpic6 ctrlShow true;
				_gbtn2 ctrlShow true;
				_gbtn3 ctrlShow true;
				_gbtn4 ctrlShow true;
				_gbtn5 ctrlShow true;
				_gbtn6 ctrlShow true;
			};

			_gname ctrlSetStructuredText parseText format["<t align='center' shadow='0' size='1px'>%1</t>",_gangName];

			lbClear _glistbox;
			{
				if((getPlayerUID _x) isEqualTo _ownerID) then {
					_glistbox lbAdd format["%1 " +(localize "STR_GNOTF_GangLeader"),(_x GVAR ["realname",name _x])];
					_glistbox lbSetData [(lbSize _glistbox)-1,str(_x)];
				} else {
					_glistbox lbAdd format["%1",(_x GVAR ["realname",name _x])];
					_glistbox lbSetData [(lbSize _glistbox)-1,str(_x)];
				};
			} forEach (units grpPlayer);
		};
	};
	case 3 : {
		//Btn Menu
		_pmenubtn ctrlShow true;
		_kmenubtn ctrlShow true;
		_gmenubtn ctrlShow true;
		//Player Menu
		_pmenupic ctrlShow false;
		_pmoney ctrlShow false;
		_pedit ctrlShow false;
		_pbtngive ctrlShow false;
		_plicense ctrlShow false;
		//Key Menu
		_kmenupic ctrlShow false;
		_klistbox ctrlShow false;
		_kgivebtn ctrlShow false;
		_kjeterbtn ctrlShow false;
		//Group Menu
		_gmenupic1 ctrlShow false;
		_gmenupic2 ctrlShow false;
		_gedit ctrlShow false;
		_gcreatebtn ctrlShow false;
		_glistbox ctrlShow false;
		_gname ctrlShow false;
		_gpic1 ctrlShow false;
		_gpic2 ctrlShow false;
		_gpic3 ctrlShow false;
		_gpic4 ctrlShow false;
		_gpic5 ctrlShow false;
		_gpic6 ctrlShow false;
		_gbtn1 ctrlShow false;
		_gbtn2 ctrlShow false;
		_gbtn3 ctrlShow false;
		_gbtn4 ctrlShow false;
		_gbtn5 ctrlShow false;
		_gbtn6 ctrlShow false;
		//Param Menu
		_pamenupic ctrlShow true;
		_pamenubtn ctrlShow false;
		_pacheckbox ctrlShow true;
		_pafootslider ctrlShow true;
		_pafootedit ctrlShow true;
		_pacarslider ctrlShow true;
		_pacaredit ctrlShow true;
		_paairslider ctrlShow true;
		_paairedit ctrlShow true;

		[] call ALF_fnc_settingsMenu;
	};
};
