#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_requestReceived.sqf
	Author: ALF Team
	Description:
	Applique les informations aux joueurs récupérées de la base de donnée.

*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {};
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

//Error handling and junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(_this isEqualType "") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(count _this,0)) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(SEL(_this,0),"Error")) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(!(EQUAL(steamid,SEL(_this,0)))) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
life_cash = parseNumber (SEL(_this,2));
CONST(life_adminlevel,SEL(_this,3));
CONST(life_donorlevel,SEL(_this,4));
life_coplevel = SEL(_this,5);
life_medicLevel = SEL(_this,6);

//Loop through licenses
if(count (SEL(_this,7)) > 0) then {
	{SVAR_MNS [SEL(_x,0),SEL(_x,1)];} forEach (SEL(_this,7));
};

//player gear
life_gear = SEL(_this,8);
[true] spawn life_fnc_loadGear;

//player stats
life_hunger = SEL(SEL(_this,9),0);
life_thirst = SEL(SEL(_this,9),1);
life_drunk = SEL(SEL(_this,9),2);
player setDamage SEL(SEL(_this,9),3);

//player arrested
life_is_arrested = SEL(_this,10);

//Position
life_is_alive = SEL(_this,11);
life_civ_position = SEL(_this,12);
if(life_is_alive) then {
	if(count life_civ_position != 3) then {diag_log format["[requestReceived] Bad position received. Data: %1",life_civ_position];life_is_alive =false;};
	if(life_civ_position distance (getMarkerPos "respawn_civilian") < 300) then {life_is_alive = false;};
};

//player First Spawn
life_playerfirstjoinserver = SEL(_this,13);

//Phone
if(count (SEL(_this,14)) > 0) then {
	life_forfait = parseNumber (SEL(SEL(_this,14),0));
	_myPhoneNumber = SEL(SEL(_this,14),1);
	player setVariable ["myPhoneNumber",[getPlayerUID player,_myPhoneNumber],true];
	life_contacts = SEL(SEL(_this,14),2);
};

//House
life_houses = SEL(_this,15);
{
	_house = nearestObject [(call compile format["%1", SEL(_x,0)]), "House"];
	life_vehicles pushBack _house;
} forEach life_houses;
[] spawn life_fnc_initHouses;

//Gang
life_gangData = SEL(_this,16);
if(count (SEL(_this,16)) > 0) then {
	[] spawn life_fnc_initGang;
};

//Keys
if(count (SEL(_this,17)) > 0) then {
	{life_vehicles pushBack _x;} forEach (SEL(_this,17));
};

//Bank System
if(count (SEL(_this,18)) > 0) then {
	_numbankaccount = SEL(SEL(_this,18),0);
	player setVariable ["numberBankAccount",_numbankaccount,true];
	life_livreta = parseNumber (SEL(SEL(_this,18),1));
	life_laactive = SEL(SEL(_this,18),2);
	life_livretb = parseNumber (SEL(SEL(_this,18),3));
	life_lbactive = SEL(SEL(_this,18),4);
	life_livretc = parseNumber (SEL(SEL(_this,18),5));
	life_lcactive = SEL(SEL(_this,18),6);
	life_activecb = SEL(SEL(_this,18),7);
};

//Hsbc System
if(count (SEL(_this,19)) > 0) then {
	_numhsbcaccount = SEL(SEL(_this,19),0);
	player setVariable ["numberHsbcAccount",_numhsbcaccount,true];
	life_hsbc = parseNumber (SEL(SEL(_this,19),1));
	life_hsbcactive = SEL(SEL(_this,19),2);
};

//Station
life_stations = SEL(_this,20);
[] spawn ALF_fnc_initStation;

life_session_completed = true;
