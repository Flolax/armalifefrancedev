#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_hudUpdate.sqf
	Author: ALF Team
	Description:
	Updates the HUD when it needs to.
	*/
ALF_fnc_UI_Check =
{
	disableSerialization;
	_ui = uiNameSpace getVariable ["playerHUD",displayNull];
	if(isNull _ui) exitWith	{	[] spawn ALF_fnc_hudSetup;	_ui = uiNameSpace getVariable ["playerHUD",displayNull];	_ui;	};
	_ui;
};

ALF_fnc_UI_Loop =
{
		_ui = call ALF_fnc_UI_Check;
		_health = _ui displayCtrl 11110;
		if ( (damage player) >= 0.1 ) then	{
			if((damage player) isEqualTo 1) exitwith {
				_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Health0.paa'/>";
				_health ctrlSetStructuredText parseText format["%1",_message];
			};
			if((damage player) < 1 && (damage player) >= 0.9) exitwith {
				_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Health10.paa'/>";
				_health ctrlSetStructuredText parseText format["%1",_message];
			};
			if((damage player) < 0.9 && (damage player) >= 0.8) exitwith {
				_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Health20.paa'/>";
				_health ctrlSetStructuredText parseText format["%1",_message];
			};
			if((damage player) < 0.8 && (damage player) >= 0.7) exitwith {
				_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Health30.paa'/>";
				_health ctrlSetStructuredText parseText format["%1",_message];
			};
			if((damage player) < 0.7 && (damage player) >= 0.6) exitwith {
				_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Health40.paa'/>";
				_health ctrlSetStructuredText parseText format["%1",_message];
			};
			if((damage player) < 0.6 && (damage player) >= 0.5) exitwith {
				_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Health50.paa'/>";
				_health ctrlSetStructuredText parseText format["%1",_message];
			};
			if((damage player) < 0.5 && (damage player) >= 0.4) exitwith {
				_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Health60.paa'/>";
				_health ctrlSetStructuredText parseText format["%1",_message];
			};
			if((damage player) < 0.4 && (damage player) >= 0.3) exitwith {
				_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Health70.paa'/>";
				_health ctrlSetStructuredText parseText format["%1",_message];
			};
			if((damage player) < 0.3 && (damage player) >= 0.2) exitwith {
				_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Health80.paa'/>";
				_health ctrlSetStructuredText parseText format["%1",_message];
			};
			if((damage player) < 0.2) exitwith {
				_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Health90.paa'/>";
				_health ctrlSetStructuredText parseText format["%1",_message];
			};
		} else {
		_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Health100.paa'/>";
		_health ctrlSetStructuredText parseText format["%1",_message];
	};
	_health ctrlCommit 0;

	_drink = _ui displayCtrl 11111;
	if ( life_thirst >= 10 ) then	{
		if(life_thirst isEqualTo 100) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Drink100.paa'/>";
			_drink ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_thirst < 100 && life_thirst >= 90) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Drink90.paa'/>";
			_drink ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_thirst < 90 && life_thirst >= 80) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Drink80.paa'/>";
			_drink ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_thirst < 80 && life_thirst >= 70) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Drink70.paa'/>";
			_drink ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_thirst < 70 && life_thirst >= 60) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Drink60.paa'/>";
			_drink ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_thirst < 60 && life_thirst >= 50) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Drink50.paa'/>";
			_drink ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_thirst < 50 && life_thirst >= 40) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Drink40.paa'/>";
			_drink ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_thirst < 40 && life_thirst >= 30) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Drink30.paa'/>";
			_drink ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_thirst < 30 && life_thirst >= 20) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Drink20.paa'/>";
			_drink ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_thirst < 20) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Drink10.paa'/>";
			_drink ctrlSetStructuredText parseText format["%1",_message];
		};
	} else {
	_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Drink0.paa'/>";
	_drink ctrlSetStructuredText parseText format["%1",_message];
	};
	_drink ctrlCommit 0;

	_food = _ui displayCtrl 11112;
	if ( life_hunger >= 10 ) then	{
		if(life_hunger isEqualTo 100) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Food100.paa'/>";
			_food ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_hunger < 100 && life_hunger >= 90) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Food90.paa'/>";
			_food ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_hunger < 90 && life_hunger >= 80) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Food80.paa'/>";
			_food ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_hunger < 80 && life_hunger >= 70) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Food70.paa'/>";
			_food ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_hunger < 70 && life_hunger >= 60) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Food60.paa'/>";
			_food ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_hunger < 60 && life_hunger >= 50) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Food50.paa'/>";
			_food ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_hunger < 50 && life_hunger >= 40) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Food40.paa'/>";
			_food ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_hunger < 40 && life_hunger >= 30) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Food30.paa'/>";
			_food ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_hunger < 30 && life_hunger >= 20) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Food20.paa'/>";
			_food ctrlSetStructuredText parseText format["%1",_message];
		};
		if(life_hunger < 20) exitwith {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Food10.paa'/>";
			_food ctrlSetStructuredText parseText format["%1",_message];
		};
	} else {
	_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_Food0.paa'/>";
	_food ctrlSetStructuredText parseText format["%1",_message];
	};
	_food ctrlCommit 0;

	_tfr = _ui displayCtrl 11109;
		if(TF_speak_volume_level isEqualTo "yelling") then {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\TFR_Yelling.paa'/>";
			_tfr ctrlSetStructuredText parseText format["%1",_message];
		};
		if(TF_speak_volume_level isEqualTo "normal") then {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\TFR_Normal.paa'/>";
			_tfr ctrlSetStructuredText parseText format["%1",_message];
		};
		if(TF_speak_volume_level isEqualTo "Whispering") then {
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\TFR_Whispering.paa'/>";
			_tfr ctrlSetStructuredText parseText format["%1",_message];
		};
	_tfr ctrlCommit 0;

	_EarPlug = _ui displayCtrl 11108;
		if (life_fadeSound) then	{
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ALF_EarPlug.paa'/>";
			_EarPlug ctrlSetStructuredText parseText format["%1",_message];
		} else {
			_message = "";
			_EarPlug ctrlSetStructuredText parseText format["%1",_message];
		};
	_EarPlug ctrlCommit 0;

	_InCall = _ui displayCtrl 11116;
		if (life_callprogress) then	{
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\InCall.paa'/>";
			_InCall ctrlSetStructuredText parseText format["%1",_message];
		} else {
			_message = "";
			_InCall ctrlSetStructuredText parseText format["%1",_message];
		};
	_InCall ctrlCommit 0;

	_CallOff = _ui displayCtrl 11113;
		if (life_phoneoff) then	{
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\CallOff.paa'/>";
			_CallOff ctrlSetStructuredText parseText format["%1",_message];
		} else {
			_message = "";
			_CallOff ctrlSetStructuredText parseText format["%1",_message];
		};
	_CallOff ctrlCommit 0;

	_MutePhone = _ui displayCtrl 11115;
		if (MuteTone) then	{
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\ViberMode.paa'/>";
			_MutePhone ctrlSetStructuredText parseText format["%1",_message];
		} else {
			_message = "";
			_MutePhone ctrlSetStructuredText parseText format["%1",_message];
		};
	_MutePhone ctrlCommit 0;

	_NewMsg = _ui displayCtrl 11114;
		if (NewMessage) then	{
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\NewSms.paa'/>";
			_NewMsg ctrlSetStructuredText parseText format["%1",_message];
		} else {
			_message = "";
			_NewMsg ctrlSetStructuredText parseText format["%1",_message];
		};
	_NewMsg ctrlCommit 0;
	_Anonyme = _ui displayCtrl 11117;
		if (life_is_anonyme) then	{
			_message = "<\br><img size='2.8' image='\ALF_Client\icons\anonyme.paa'/>";
			_Anonyme ctrlSetStructuredText parseText format["%1",_message];
		} else {
			_message = "";
			_Anonyme ctrlSetStructuredText parseText format["%1",_message];
		};
	_Anonyme ctrlCommit 0;

};
