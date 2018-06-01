#include "hc_macros.hpp"
/*
	File: fn_initHC.sqf
	Author: Nanou

	Description:
	Initialize the headless client.
*/
[] execVM "\ALF_hc\KRON_Strings.sqf";

ALF_server_extDB_notLoaded = "";
life_save_civilian_position = if(EQUAL(LIFE_SETTINGS(getNumber,"save_civilian_position"),0)) then {false} else {true};

diag_log "-------------------------------------------------------------------------------------------------------------------";
diag_log "-------------------------------- Starting initialization of 'extDB2-HC' by NANOU ----------------------------------";
diag_log "-------------------------------------------------------------------------------------------------------------------";

if(isNil {GVAR_UINS "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	CONSTVAR(life_sql_id);
	SVAR_UINS ["life_sql_id",life_sql_id];

	try {
		_result = EXTDB format["9:ADD_DATABASE:%1",EXTDB_SETTING(getText,"DatabaseName")];
		if(!(EQUAL(_result,"[1]"))) then {throw "extDB2: Error with Database Connection"};
		_result = EXTDB format["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",FETCH_CONST(life_sql_id),EXTDB_SETTING(getText,"DatabaseName")];
		if(!(EQUAL(_result,"[1]"))) then {throw "extDB2: Error with Database Connection"};
	} catch {
		diag_log _exception;
		ALF_server_extDB_notLoaded = [true, _exception];
	};

	PVAR_ALL("ALF_server_extDB_notLoaded");
	if(ALF_server_extDB_notLoaded isEqualType []) exitWith {};
	EXTDB "9:LOCK";
	diag_log "extDB2: Connected to Database";
} else {
	life_sql_id = GVAR_UINS "life_sql_id";
	CONSTVAR(life_sql_id);
	diag_log "extDB2: Still Connected to Database";
};

if(ALF_server_extDB_notLoaded isEqualType []) exitWith {}; //extDB2-HC did not fully initialize so terminate the rest of the initialization process.

[] spawn {
    for "_i" from 0 to 1 step 0 do {
        PVAR_SERV("serv_sv_use");
        uiSleep 60;
    };
};

//["CALL resetLifeVehicles",1] call HC_fnc_asyncCall;
["CALL deleteDeadVehicles",1] call HC_fnc_asyncCall;
["CALL deleteOldHouses",1] call HC_fnc_asyncCall;
["CALL deleteOldGangs",1] call HC_fnc_asyncCall;

[] execFSM "\ALF_hc\FSM\cleanup.fsm";

[] spawn HC_fnc_cleanup;
[] spawn HC_fnc_vehicleAutoSync;
[] spawn HC_fnc_initHouses;
//[] spawn HC_fnc_initStation;
[] spawn HC_fnc_appleSystem;
[] spawn HC_fnc_countDownForfait;

[] execVM "\ALF_hc\MySQL\Bourse\fn_initBourse.sqf";

//Si serveur lancé pour la premiere fois, exec ce script
//Si le script ne s'éxucute pas, HC reboot a cause d'un crash
if (!ALF_hc_FirstLaunch) then {
 	[] spawn HC_fnc_spawnVehicleLaunch;
 	ALF_hc_FirstLaunch = true;
 	publicVariable "ALF_hc_FirstLaunch";
};

/* Initialize hunting zone(s) */
["hunting_zone",30] spawn HC_fnc_huntingZone;

diag_log "---------------------------- HC is Ready --------------------------------";
diag_log "Published the needed vars over the network, ready for queries to recieve!";
diag_log "-------------------------------------------------------------------------";

ALF_hc_isActive = true;
publicVariable "ALF_hc_isActive";

ALF_server_isReady = true;
publicVariable "ALF_server_isReady";
