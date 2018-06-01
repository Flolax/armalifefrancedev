/*
	fn_doCallIn.sqf
*/
private ["_POPUPCLASS1","_POPUP","_blah"];
disableSerialization;

for "_i" from 0 to 1 step 0 do {
	if(!messagecallin_active) exitwith {
		11 cutRsc ["RSC_DOCALLPOPUP","PLAIN"];
		_POPUPCLASS1 = uiNameSpace getVariable ["RSC_DOCALLPOPUP",displayNull];
		messagecallin_active = true;
		_POPUP = _POPUPCLASS1 displayCtrl 13451;
		_POPUP ctrlSetStructuredText parseText "<img size='2.8' image='\ALF_Client\icons\ALF_CallIn.paa'/>";
		sleep 6;
		messagecallin_active = false;
	};
	sleep 0.05;
};
