class vmenu_dialog {
	idd = 30200;
	name= "vmenu_dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class Background: Life_RscPicture {
			idc = -1;
			text = "\ALF_Client\textures\Vehicles\Menu\main.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
	};

	class controls {
		class HitCarEngineV: Life_RscPicture {
			idc = 30201;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Engine\Vert.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarEngineO: Life_RscPicture {
			idc = 30202;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Engine\Orange.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarEngineR: Life_RscPicture {
			idc = 30203;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Engine\Rouge.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarLFV: Life_RscPicture {
			idc = 30204;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Roues\Av_Gauche_Vert.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarLFO: Life_RscPicture {
			idc = 30205;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Roues\Av_Gauche_Orange.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarLFR: Life_RscPicture {
			idc = 30206;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Roues\Av_Gauche_Rouge.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarLF2V: Life_RscPicture {
			idc = 30207;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Roues\Ar_Gauche_Vert.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarLF2O: Life_RscPicture {
			idc = 30208;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Roues\Ar_Gauche_Orange.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarLF2R: Life_RscPicture {
			idc = 30209;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Roues\Ar_Gauche_Rouge.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarRFV: Life_RscPicture {
			idc = 30210;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Roues\Av_Droite_Vert.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarRFO: Life_RscPicture {
			idc = 30211;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Roues\Av_Droite_Orange.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarRFR: Life_RscPicture {
			idc = 30212;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Roues\Av_Droite_Rouge.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarRF2V: Life_RscPicture {
			idc = 30213;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Roues\Ar_Droite_Vert.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarRF2O: Life_RscPicture {
			idc = 30214;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Roues\Ar_Droite_Orange.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarRF2R: Life_RscPicture {
			idc = 30215;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\Roues\Ar_Droite_Rouge.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarMainV: Life_RscPicture {
			idc = 30216;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\All\Vert.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarMainO: Life_RscPicture {
			idc = 30217;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\All\Orange.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class HitCarMainR: Life_RscPicture {
			idc = 30218;
			text = "\ALF_Client\textures\Vehicles\Menu\Car\All\Rouge.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class Fuel0: Life_RscPicture {
			idc = 30300;
			text = "\ALF_Client\textures\Vehicles\Menu\Fuel\0.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class Fuel10: Life_RscPicture {
			idc = 30301;
			text = "\ALF_Client\textures\Vehicles\Menu\Fuel\10.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class Fuel20: Life_RscPicture {
			idc = 30302;
			text = "\ALF_Client\textures\Vehicles\Menu\Fuel\20.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class Fuel30: Life_RscPicture {
			idc = 30303;
			text = "\ALF_Client\textures\Vehicles\Menu\Fuel\30.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class Fuel40: Life_RscPicture {
			idc = 30304;
			text = "\ALF_Client\textures\Vehicles\Menu\Fuel\40.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class Fuel50: Life_RscPicture {
			idc = 30305;
			text = "\ALF_Client\textures\Vehicles\Menu\Fuel\50.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class Fuel60: Life_RscPicture {
			idc = 30306;
			text = "\ALF_Client\textures\Vehicles\Menu\Fuel\60.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class Fuel70: Life_RscPicture {
			idc = 30307;
			text = "\ALF_Client\textures\Vehicles\Menu\Fuel\70.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class Fuel80: Life_RscPicture {
			idc = 30308;
			text = "\ALF_Client\textures\Vehicles\Menu\Fuel\80.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class Fuel90: Life_RscPicture {
			idc = 30309;
			text = "\ALF_Client\textures\Vehicles\Menu\Fuel\90.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class Fuel100: Life_RscPicture {
			idc = 30310;
			text = "\ALF_Client\textures\Vehicles\Menu\Fuel\100.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class ButtonOne: Life_RscButtonMenu {
			idc = 30401;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonTwo: Life_RscButtonMenu {
			idc = 30402;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonTrois: Life_RscButtonMenu {
			idc = 30403;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonQuatre: Life_RscButtonMenu {
			idc = 30404;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonCinq: Life_RscButtonMenu {
			idc = 30405;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonSix: Life_RscButtonMenu {
			idc = 30406;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonSept: Life_RscButtonMenu {
			idc = 30407;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonR1: Life_RscButtonMenu {
			idc = 30411;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonR2: Life_RscButtonMenu {
			idc = 30412;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonR3: Life_RscButtonMenu {
			idc = 30413;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonR4: Life_RscButtonMenu {
			idc = 30414;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonR5: Life_RscButtonMenu {
			idc = 30415;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonR6: Life_RscButtonMenu {
			idc = 30416;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
