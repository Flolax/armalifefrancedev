#include "\ALF_Client\script_macros.hpp"
/*
	File: configuration.sqf
	Author:

	Description:
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = objNull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = objNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
tawvd_addon_disable = true;
life_god = false;
life_frozen = false;
life_save_gear = [];
life_mobilier_active = false;
life_mobilier_activeObj = objNull;
life_mobilier_activeMun = "";
life_disable_getIn = false;
life_disable_getOut = false;
life_admin_debug = false;
life_preview_3D_vehicle_cam = objNull;
life_preview_3D_vehicle_object = objNull;
life_preview_light = objNull;
life_pos_exist = false;
life_pos_attach = [];
life_civ_position = [];
life_markers = false;
life_fadeSound = false;
life_permis_action = false;
jesuisassis = false;

//Phone System
life_forfait = -1;
life_callprogress = false;
life_phonering = false;
life_trycall = false;
life_phoneoff = false;
MuteTone = false;
NewMessage = false;
life_is_anonyme = false;
life_radio_connected = false;
life_phone_historique = [];
Call_Central = false;

//System Message
message1_active = false;
message2_active = false;
message3_active = false;
message4_active = false;
message5_active = false;
message6_active = false;
message1_smsactive = false;
message2_smsactive = false;
message3_smsactive = false;
message4_smsactive = false;
message1_copactive = false;
message2_copactive = false;
message3_copactive = false;
message4_copactive = false;
messagecallin_active = false;

//Init iPhone
iPhone_Ring = 0;
iPhone_Background = 0;
iPhone_Mute = false;
iPhone_Speackers = false;

//Init Farming System
life_hit_time = time;
life_attachObject = false;
life_ALF_Hit = 0;

//Settings
life_settings_revealObjects = GVAR_PNAS["life_settings_revealObjects",true];
life_settings_viewDistanceFoot = GVAR_PNAS["life_viewDistanceFoot",100];
life_settings_viewDistanceCar = GVAR_PNAS["life_viewDistanceCar",1500];
life_settings_viewDistanceAir = GVAR_PNAS["life_viewDistanceAir",2500];

//Mobilier System
ALF_Mobiliers_Items = ["ALF_TV_2_boite","ALF_TV_1_boite","ALF_Table_B_2_boite","ALF_Table_B_1_boite","ALF_Table_2_boite","ALF_Table_1_boite","ALF_stock_2_boite","ALF_stock_1_boite","ALF_lit_2_ver_boite","ALF_lit_2_Ble_boite","ALF_lit_2_Bla_boite","ALF_lit_2_R_boite","ALF_lit_2_N_boite","ALF_lit_1_ver_boite","ALF_lit_1_Ble_boite","ALF_lit_1_Bla_boite","ALF_lit_1_R_boite","ALF_lit_1_N_boite","ALF_chaise_2_ver_boite","ALF_chaise_2_Ble_boite","ALF_chaise_2_Bla_boite","ALF_chaise_2_N_boite","ALF_chaise_2_R_boite","ALF_chaise_1_ver_boite","ALF_chaise_1_Ble_boite","ALF_chaise_1_Bla_boite","ALF_chaise_1_N_boite","ALF_chaise_1_R_boite","ALF_canap_2_boite","ALF_canap_ver_boite","ALF_canap_Ble_boite","ALF_canap_Bla_boite","ALF_canap_N_boite","ALF_canap_R_boite"];
ALF_Mobiliers_Objects = ["ALF_TV_2","ALF_TV_1","ALF_Table_B_2","ALF_Table_B_1","ALF_Table_2","ALF_Table_1","Alf_stock_2","Alf_stock_1","ALF_lit_2_ver","ALF_lit_2_Ble","ALF_lit_2_Bla","ALF_lit_2_R","ALF_lit_2_N","ALF_lit_1_ver","ALF_lit_1_Ble","ALF_lit_1_Bla","ALF_lit_1_R","ALF_lit_1_N","ALF_chaise_2_ver","ALF_chaise_2_Ble","ALF_chaise_2_Bla","ALF_chaise_2_N","ALF_chaise_2_R","ALF_chaise_1_ver","ALF_chaise_1_Ble","ALF_chaise_1_Bla","ALF_chaise_1_N","ALF_chaise_1_R","ALF_canap_2_c","ALF_canap_ver","ALF_canap_Ble","ALF_canap_Bla","ALF_canap_N","ALF_canap_R"];

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*

/*
*****************************
****** Life Variables *******
*****************************
*/
life_playerfirstjoinserver = false;
life_is_arrested = false;
life_net_dropped = false;
life_use_atm = true;
life_is_alive = false;
life_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
life_drunk = 0;
life_cash = 0;

life_coplevel = 0;
life_medicLevel = 0;

//Contacts System
life_contacts = [];

//Bank System + Hsbc
life_livreta = 0;
life_livretb = 0;
life_livretc = 0;
life_laactive = false;
life_lbactive = false;
life_lcactive = false;
life_activecb = 0;

life_hsbc = 0;
life_hsbcactive = false;

life_istazed = false;
life_isknocked = false;
life_vehicles = [];

/* Setup the license! */
{
	_varName = getText(_x >> "variable");
	SVAR_MNS [LICENSE_VARNAME(_varName),false];
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));
