/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*            3: Custom exit message (Optional)
*
*    items: { Classname, Itemname, BuyPrice, SellPrice }
*
*    Itemname only needs to be filled if you want to rename the original object name.
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
class WeaponShops {
    class bankstore {
        name = "Crédit Mutuel";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ALF_CB_Bronze", "", 50, -1 },
            { "ALF_CB_Gold", "", 50, -1 },
            { "ALF_CB_Black", "", 50, -1 }
        };
    };

    class orange {
        name = "Orange";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ALF_3310", "", 149, -1 },
            { "ALF_iPhone", "", 899, -1 },
            { "alf_neogend", "", 499, -1 }
        };
    };

    //Basic Shops
    class genstore {
        name = "Magasin général";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ALF_TV_2_boite", "", 10, -1 },
            { "ALF_TV_1_boite", "", 10, -1 },
            { "ALF_Table_B_2_boite", "", 10, -1 },
            { "ALF_Table_B_1_boite", "", 10, -1 },
            { "ALF_Table_2_boite", "", 10, -1 },
            { "ALF_Table_1_boite", "", 10, -1 },
            { "ALF_stock_2_boite", "", 10, -1 },
            { "ALF_stock_1_boite", "", 10, -1 },
            { "ALF_lit_2_Ver_boite", "", 10, -1 },
            { "ALF_lit_2_Ble_boite", "", 10, -1 },
            { "ALF_lit_2_Bla_boite", "", 10, -1 },
            { "ALF_lit_2_R_boite", "", 10, -1 },
            { "ALF_lit_2_N_boite", "", 10, -1 },
            { "ALF_lit_1_Ver_boite", "", 10, -1 },
            { "ALF_lit_1_Ble_boite", "", 10, -1 },
            { "ALF_lit_1_Bla_boite", "", 10, -1 },
            { "ALF_lit_1_R_boite", "", 10, -1 },
            { "ALF_lit_1_N_boite", "", 10, -1 },
            { "ALF_chaise_2_ver_boite", "", 10, -1 },
            { "ALF_chaise_2_Ble_boite", "", 10, -1 },
            { "ALF_chaise_2_Bla_boite", "", 10, -1 },
            { "ALF_chaise_2_N_boite", "", 10, -1 },
            { "ALF_chaise_2_R_boite", "", 10, -1 },
            { "ALF_chaise_1_ver_boite", "", 10, -1 },
            { "ALF_chaise_1_Ble_boite", "", 10, -1 },
            { "ALF_chaise_1_Bla_boite", "", 10, -1 },
            { "ALF_chaise_1_N_boite", "", 10, -1 },
            { "ALF_chaise_1_R_boite", "", 10, -1 },
            { "ALF_canap_2_boite", "", 10, -1 },
            { "ALF_canap_ver_boite", "", 10, -1 },
            { "ALF_canap_Ble_boite", "", 10, -1 },
            { "ALF_canap_Bla_boite", "", 10, -1 },
            { "ALF_canap_N_boite", "", 10, -1 },
            { "ALF_canap_R_boite", "", 10, -1 },
        	{ "ALF_C4", "", 10, -1 },
        	{ "ALF_Pc", "", 10, -1 },
        	{ "ALF_Badge_b", "", 10, -1 },
            { "ALF_Pioche", "", 10, -1 },
            { "ALF_Batte", "", 10, -1 },
            { "ALF_Couteau", "", 10, -1 },
            { "ALF_matraque", "", 10, -1 },
            { "ALF_Marteau", "", 10, -1 },
            { "ALF_faux", "", 10, -1 },
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 100, 45 },
            { "ItemMap", "", 50, 35 },
            { "ItemCompass", "", 50, 25 },
            { "ItemWatch", "", 50, -1 },
            { "FirstAidKit", "", 150, 65 },
            { "NVGoggles", "", 2000, 980 },
            { "Chemlight_red", "", 300, -1 },
            { "Chemlight_yellow", "", 300, 50 },
            { "Chemlight_green", "", 300, 50 },
            { "Chemlight_blue", "", 300, 50 }
        };
    };

    class market {
        name = "Marché";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ALF_Pomme", "", 10, -1 },
            { "ALF_Peche", "", 10, -1 },
            { "ALF_Banane", "", 10, -1 },
            { "ALF_Pain", "", 10, -1 },
            { "ALF_Kebab", "", 10, -1 },
            { "ALF_snickers", "", 10, -1 },
            { "ALF_coca", "", 10, -1 },
            { "ALF_Jus", "", 10, -1 },
            { "ALF_Jack", "", 10, -1 },
            { "ALF_Vin", "", 10, -1 },
            { "ALF_Vodka", "", 10, -1 }
        };
    };

    class blackmarket {
        name = "Marché noir";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ALF_Pc", "", 10, -1 },
            { "ALF_C4", "", 10, -1 }
        };
    };
};
