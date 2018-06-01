/*
	File: fn_initTFR.sqf
	Author: ALF Team
	Description:
	Init TaskForceRadio for player

*/
disableSerialization;
//Desactive la distribution auto des sacs radio
tf_no_auto_long_range_radio = true;

//Augmente la qualité des appels
TF_terrain_interception_coefficient = 1;

//Desactive les joueurs à utiliser les radios
player setVariable ["tf_unable_to_use_radio", true];

//Repousse les limites de distance de transmition pour les joueurs
player setVariable ["tf_sendingDistanceMultiplicator", 100];
player setVariable ["tf_receivingDistanceMultiplicator", 100];

for "_i" from 0 to 1 step 0 do {
	_server = [] call TFAR_fnc_getTeamSpeakServerName;
	_channel = [] call TFAR_fnc_getTeamSpeakChannelName;

  if(!([] call TFAR_fnc_isTeamSpeakPluginEnabled)) then {
    cutText["Activez Plugin TaskForceRadio sur Teamspeak.","BLACK"];
		waitUntil {sleep 0.3; ([] call TFAR_fnc_isTeamSpeakPluginEnabled)};
		cutText["","PLAIN"];
  };
	if(_server != "Arma Life France" && _channel != "TASKFORCE") then {
		cutText["Mauvais channel TeamSpeak.","BLACK",0,true];
		waitUntil {sleep 0.3; ([] call TFAR_fnc_getTeamSpeakServerName) isEqualTo "Arma Life France" && ([] call TFAR_fnc_getTeamSpeakChannelName) isEqualTo "TASKFORCE"};
		cutText["","PLAIN"];
  };
  uisleep 5;
};
