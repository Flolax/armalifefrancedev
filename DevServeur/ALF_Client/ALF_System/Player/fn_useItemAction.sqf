#include "\ALF_Client\script_macros.hpp"
/*
File: fn_useItemaAction .sqf
Author: ALF Team

Description:
Execute item action with Double Click.

Example:
case (_item in [""]): {};
*/

fnc_UseItem = {
_idc = ctrlIDC (_this select 0);
_selectedIndex = _this select 1;
_item = lbData [_idc, _selectedIndex];

	switch (true) do {
		/************************************** ITEMS BOIRE/MANGER *************************************/
		case (_item in ["ALF_snickers","ALF_Pain","ALF_Banane","ALF_Peche","ALF_Pomme"]): {
			closeDialog 602;
			_val = round(random(15)) + 15;
			_sum = life_hunger + _val;
			if(_sum > 100) then {_sum = 100; player setFatigue 1; hint "Tu as trop mangé !";};
			life_hunger = _sum;
			[_item] remoteExec ["ALF_fnc_p_removeMagazine",RCLIENT];
		};
		case (_item in ["ALF_coca","ALF_Jus"]): {
			closeDialog 602;
			_val = round(random(30)) + 15;
			_sum = life_thirst + _val;
			if(_sum > 100) then {_sum = 100; hint "Tu as trop bu !";};
			life_thirst = _sum;
			[_item] remoteExec ["ALF_fnc_p_removeMagazine",RCLIENT];
		};
		case (_item in ["ALF_Vin","ALF_Vodka","ALF_Jack"]): {
			closeDialog 602;
			_val = round(random(50)) + 15;
			_sum = life_drunk + _val;
			if(_sum > 100) then {_sum = 100; hint "Tu es ivre !";};
			life_drunk = _sum;
			[_item] remoteExec ["ALF_fnc_p_removeMagazine",RCLIENT];
		};

		/************************************** FONDERIE ***********************************************/
		case (_item in ["ALF_pierre_cui_small"]): {
			if((typeOf cursorObject) isEqualTo "ALF_Fonte_cuivre" && (player distance cursorObject) < 2) then {
				if (cursorObject animationPhase "end" isEqualTo 0 && cursorObject animationPhase "door" isEqualTo 0) then {
					if(!isNull (findDisplay 602)) then {closeDialog 602};
					[player,_item,"ALF_Cuivre",cursorObject] remoteExec ["HC_fnc_fonderieSystem",HC_Life];
				} else {
					["Attention", "Le four est utilisé ou hors service.", "warning", false] spawn ALF_fnc_doMsg;
				};
			} else { ["Info", "Tu ne peux pas utiliser cet item ici.", "warning", false] spawn ALF_fnc_doMsg; };
		};
		case (_item in ["ALF_pierre_fer_small"]): {
			if((typeOf cursorObject) isEqualTo "ALF_Fonte_fer" && (player distance cursorObject) < 2) then {
				if (cursorObject animationPhase "end" isEqualTo 0 && cursorObject animationPhase "door" isEqualTo 0) then {
					if(!isNull (findDisplay 602)) then {closeDialog 602};
					[player,_item,"ALF_Fer",cursorObject] remoteExec ["HC_fnc_fonderieSystem",HC_Life];
				} else {
					["Attention", "Le four est utilisé ou hors service.", "warning", false] spawn ALF_fnc_doMsg;
				};
			} else { ["Info", "Tu ne peux pas utiliser cet item ici.", "warning", false] spawn ALF_fnc_doMsg; };
		};
		case (_item in ["ALF_pierre_or_small"]): {
			if((typeOf cursorObject) isEqualTo "ALF_Fonte_or" && (player distance cursorObject) < 2) then {
				if (cursorObject animationPhase "end" isEqualTo 0 && cursorObject animationPhase "door" isEqualTo 0) then {
					if(!isNull (findDisplay 602)) then {closeDialog 602};
					[player,_item,"ALF_Or",cursorObject] remoteExec ["HC_fnc_fonderieSystem",HC_Life];
				} else {
					["Attention", "Le four est utilisé ou hors service.", "warning", false] spawn ALF_fnc_doMsg;
				};
			} else { ["Info", "Tu ne peux pas utiliser cet item ici.", "warning", false] spawn ALF_fnc_doMsg; };
		};

		/************************************** Mobilier ***********************************************/
		case (_item in ALF_Mobiliers_Items): {
				closeDialog 602;
				[_item] spawn life_fnc_mobilierSystem;
		};
		/************************************** Distributeur ***********************************************/
		case (_item in ["ALF_CB_Bronze","ALF_CB_Gold","ALF_CB_Black"]): {
				closeDialog 602;
				uiNamespace setVariable ['dabmenu',0];
				[] spawn ALF_fnc_menuDab;
		};
		default {["Info", "Cet item n'est pas utilisable.", "warning", false] spawn ALF_fnc_doMsg;};
	};
};

for "_i" from 0 to 1 step 0 do {
	waituntil {sleep 0.3; !(isnull (finddisplay 602))};
	((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "_this call fnc_UseItem"]; //U
	((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "_this call fnc_UseItem"]; //V
	((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "_this call fnc_UseItem"]; //BP
	waituntil {sleep 0.3; (isnull (finddisplay 602))};
};
