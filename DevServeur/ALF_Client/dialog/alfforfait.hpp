class ALF_Forfait_Dialog {
	idd = 15000;
	name= "ALF_Forfait_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class MainBackground: Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.44 * safezoneH;
		};
	};

	class controls {

		class ForfaitTexte1: Life_RscStructuredText
		{
			idc = 15001;
			text = "";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class Offre1: Life_RscButtonMenu {
			idc = 15002;
			text = "Forfait 1 jour";
			onButtonClick = "[1,1] spawn ALF_fnc_buyForfait;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Offre2: Life_RscButtonMenu {
			idc = 15003;
			text = "Forfait 3 jours";
			onButtonClick = "[1,2] spawn ALF_fnc_buyForfait;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Offre3: Life_RscButtonMenu {
			idc = 15004;
			text = "Forfait 7 jours";
			onButtonClick = "[1,3] spawn ALF_fnc_buyForfait;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Offre4: Life_RscButtonMenu {
			idc = 15005;
			text = "Forfait 14 jours";
			onButtonClick = "[1,4] spawn ALF_fnc_buyForfait;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Offre5: Life_RscButtonMenu {
			idc = 15006;
			text = "Résilier mon Forfait";
			onButtonClick = "[2] spawn ALF_fnc_buyForfait;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CloseButton: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			text = "Quitter le service client";
			x = 0.510311 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
