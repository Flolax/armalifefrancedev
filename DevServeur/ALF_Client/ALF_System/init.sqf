#include "\ALF_Client\script_macros.hpp"
/*
	File: init.sqf
	Author: ALF Team
	Description:
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp","_ui","_progressBar","_titleText"];
disableSerialization;
0 cutRsc ["life_progress","BLACK FADED"];
0 cutFadeOut 9999999;
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["Initialisation de la mission... (1%1)...","%"];
_progressBar progressSetPosition 0.01;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "---------------------------- Starting Arma Life France Client Init -----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {sleep 0.3; !isNull player && player isEqualTo player};
enableSentences false;
[] call compile PreprocessFileLineNumbers "\ALF_Client\ALF_System\configuration.sqf";

[] call ALF_fnc_setupEVH;
//[] call ALF_fnc_setupActions;
waitUntil {sleep 0.3; (!isNil "TON_fnc_clientGangLeader")};

_titleText ctrlSetText format["Initialisation de la mission... (30%1)...","%"];
_progressBar progressSetPosition 0.3;
0 cutFadeOut 99999999;

waitUntil{sleep 0.3; !isNil "ALF_server_isReady"};
waitUntil{sleep 0.3; (ALF_server_isReady OR !isNil "ALF_server_extDB_notLoaded")};

if(!isNil "ALF_server_extDB_notLoaded" && {ALF_server_extDB_notLoaded isEqualType []}) exitWith {
	diag_log ALF_server_extDB_notLoaded;
	999999 cutText [ALF_server_extDB_notLoaded,"BLACK FADED"];
	999999 cutFadeOut 99999999;
};

waitUntil{sleep 0.3; !isNil "ALF_hc_isActive"};
waitUntil{sleep 0.3; ALF_hc_isActive};

[] call SOCK_fnc_dataQuery;
waitUntil {sleep 0.3; life_session_completed};
_titleText ctrlSetText format["Initialisation de la mission... (60%1)...","%"];
_progressBar progressSetPosition 0.6;
0 cutFadeOut 9999999;

[] spawn life_fnc_escInterupt;

//Initialize Civilian Settings
_handle = [] spawn ALF_fnc_initPlayer;
waitUntil {sleep 0.3; scriptDone _handle};


player setVariable ["restrained",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];
player setVariable ["playerSurrender",false,true];

//FPS-Fix
[] execVM "\ALF_Client\ALF_System\fpsFix\vehicleManager.sqf";
setTerrainGrid 25;

ALFBOURSE_NbAchat = [];
[player] remoteExecCall ["HC_fnc_loggedBourse",HC_Life];

waitUntil {sleep 0.3; !(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;

_titleText ctrlSetText format["Initialisation de la mission... (90%1)...","%"];
_progressBar progressSetPosition 0.9;
0 cutFadeOut 9999999;
[] spawn ALF_fnc_hudSetup;

/* Set up frame-by-frame handlers */
//LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

player setVariable ["steam64ID",steamid];
player setVariable ["realname",profileName,true];

life_fnc_moveIn = compileFinal
"
	life_disable_getIn = false;
	player moveInCargo (_this select 0);
	life_disable_getOut = true;
";

life_fnc_RequestClientId = player;
publicVariableServer "life_fnc_RequestClientId"; //Variable OwnerID for HeadlessClient

[] spawn ALF_fnc_survival;
[] spawn ALF_fnc_useItemAction;
[] spawn ALF_fnc_initTFR;
[] spawn ALF_fnc_callingSystem;

[] spawn {
	for "_i" from 0 to 1 step 0 do {
		waitUntil{sleep 0.3; (!isNull (findDisplay 49)) && (!isNull (findDisplay 602))}; // Check if Inventory and ESC dialogs are open
		(findDisplay 49) closeDisplay 2; // Close ESC dialog
		(findDisplay 602) closeDisplay 2; // Close Inventory dialog
	};
};

//[] execVM "\ALF_Client\ALF_System\fn_setupStationService.sqf";

_titleText ctrlSetText format["Initialisation de la mission... (100%1)...","%"];
_progressBar progressSetPosition 1;
0 cutFadeOut 9999999;

diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["          End of Arma Life France Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";

0 cutText ["","BLACK IN"];
