/*
	File: init.sqf
	Author: ALF_Team
	Description:
	Start server, init biefing + string's fonctions
*/
StartProgress = false;

[] execVM "\ALF_Client\briefing.sqf"; //Load Briefing
[] execVM "\ALF_Client\KRON_Strings.sqf";

StartProgress = true;