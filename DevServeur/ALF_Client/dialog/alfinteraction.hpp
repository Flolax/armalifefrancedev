class menuGendarme_dialog {
	idd = 522110;
	name= "menuGendarme_dialog";
	onLoad = "uiNamespace setVariable ['gendmenu',0]";
	movingEnable = false;
	enableSimulation = false;
	class controlsBackground {};

	class controls {
		class PicPage1 : Life_RscPicture {
			idc = 522111;
			text = "\ALF_Client\textures\Gmenu\GMenu1.paa";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class BtnPage1: Life_RscButtonInvisible {
			idc = 522112;
			text = "";
			onButtonClick = "uiNamespace setVariable ['gendmenu',0]; [] call ALF_fnc_menuGendarme;";
			x = 0.558282 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.0314061 * safezoneW;
			h = 0.0283704 * safezoneH;
		};
		class PicPage2 : Life_RscPicture {
			idc = 522113;
			text = "\ALF_Client\textures\Gmenu\GMenu2.paa";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class BtnPage2: Life_RscButtonInvisible {
			idc = 522114;
			text = "";
			onButtonClick = "uiNamespace setVariable ['gendmenu',1]; [] call ALF_fnc_menuGendarme;";
			x = 0.592709 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.0314061 * safezoneW;
			h = 0.0283704 * safezoneH;
		};
		class PicPage3 : Life_RscPicture {
			idc = 522115;
			text = "\ALF_Client\textures\Gmenu\GMenu3.paa";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class BtnPage3: Life_RscButtonInvisible {
			idc = 522116;
			text = "";
			onButtonClick = "uiNamespace setVariable ['gendmenu',2]; [] call ALF_fnc_menuGendarme;";
			x = 0.628125 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.0314061 * safezoneW;
			h = 0.0283704 * safezoneH;
		};
		class PicPage4 : Life_RscPicture {
			idc = 522117;
			text = "\ALF_Client\textures\Gmenu\GMenu4.paa";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class BtnPage4: Life_RscButtonInvisible {
			idc = 522118;
			text = "";
			onButtonClick = "uiNamespace setVariable ['gendmenu',3]; [] call ALF_fnc_menuGendarme;";
			x = 0.666146 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.0314061 * safezoneW;
			h = 0.0283704 * safezoneH;
		};

		class Btn1: Life_RscButtonMenu {
			idc = 522119;
			text = "";
			x = 0.56875 * safezoneW + safezoneX;
			y = 0.668519 * safezoneH + safezoneY;
			w = 0.114479 * safezoneW;
			h = 0.0274444 * safezoneH;
		};
		class Btn2: Life_RscButtonMenu {
			idc = 522120;
			text = "";
			x = 0.56875 * safezoneW + safezoneX;
			y = 0.705556 * safezoneH + safezoneY;
			w = 0.114479 * safezoneW;
			h = 0.0274444 * safezoneH;
		};
		class Btn3: Life_RscButtonMenu {
			idc = 522121;
			text = "";
			x = 0.56875 * safezoneW + safezoneX;
			y = 0.743518 * safezoneH + safezoneY;
			w = 0.114479 * safezoneW;
			h = 0.0274444 * safezoneH;
		};
		class Btn4: Life_RscButtonMenu {
			idc = 522122;
			text = "";
			x = 0.56875 * safezoneW + safezoneX;
			y = 0.781481 * safezoneH + safezoneY;
			w = 0.114479 * safezoneW;
			h = 0.0274444 * safezoneH;
		};
		class Btn5: Life_RscButtonMenu {
			idc = 522123;
			text = "";
			x = 0.56875 * safezoneW + safezoneX;
			y = 0.818519 * safezoneH + safezoneY;
			w = 0.114479 * safezoneW;
			h = 0.0274444 * safezoneH;
		};
		class Btn6: Life_RscButtonMenu {
			idc = 522124;
			text = "";
			x = 0.56875 * safezoneW + safezoneX;
			y = 0.855556 * safezoneH + safezoneY;
			w = 0.114479 * safezoneW;
			h = 0.0274444 * safezoneH;
		};
	};
};

class menuCivil_dialog {
	idd = 532110;
	name= "menuCivil_dialog";
	onLoad = "uiNamespace setVariable ['civmenu',0]";
	movingEnable = false;
	enableSimulation = false;
	class controlsBackground {};

	class controls {
		class PicPage1 : Life_RscPicture {
			idc = 532111;
			text = "\ALF_Client\textures\Gmenu\GMenu1.paa";
			x = 0.530625 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class BtnPage1: Life_RscButtonInvisible {
			idc = 532112;
			text = "";
			onButtonClick = "uiNamespace setVariable ['civmenu',0]; [] call ALF_fnc_menuGendarme;";
			x = 0.558282 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.0314061 * safezoneW;
			h = 0.0283704 * safezoneH;
		};
		class PicPage2 : Life_RscPicture {
			idc = 532113;
			text = "\ALF_Client\textures\Gmenu\GMenu2.paa";
			x = 0.530625 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class BtnPage2: Life_RscButtonInvisible {
			idc = 532114;
			text = "";
			onButtonClick = "uiNamespace setVariable ['civmenu',1]; [] call ALF_fnc_menuGendarme;";
			x = 0.592709 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.0314061 * safezoneW;
			h = 0.0283704 * safezoneH;
		};
		class PicPage3 : Life_RscPicture {
			idc = 532115;
			text = "\ALF_Client\textures\Gmenu\GMenu3.paa";
			x = 0.530625 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class BtnPage3: Life_RscButtonInvisible {
			idc = 532116;
			text = "";
			onButtonClick = "uiNamespace setVariable ['civmenu',2]; [] call ALF_fnc_menuGendarme;";
			x = 0.628125 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.0314061 * safezoneW;
			h = 0.0283704 * safezoneH;
		};
		class PicPage4 : Life_RscPicture {
			idc = 532117;
			text = "\ALF_Client\textures\Gmenu\GMenu4.paa";
			x = 0.530625 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class BtnPage4: Life_RscButtonInvisible {
			idc = 532118;
			text = "";
			onButtonClick = "uiNamespace setVariable ['civmenu',3]; [] call ALF_fnc_menuGendarme;";
			x = 0.666146 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.0314061 * safezoneW;
			h = 0.0283704 * safezoneH;
		};

		class Btn1: Life_RscButtonInvisible {
			idc = 532119;
			text = "";
			x = 0.56875 * safezoneW + safezoneX;
			y = 0.668519 * safezoneH + safezoneY;
			w = 0.114479 * safezoneW;
			h = 0.0274444 * safezoneH;
		};
		class Btn2: Life_RscButtonInvisible {
			idc = 532120;
			text = "";
			x = 0.56875 * safezoneW + safezoneX;
			y = 0.705556 * safezoneH + safezoneY;
			w = 0.114479 * safezoneW;
			h = 0.0274444 * safezoneH;
		};
		class Btn3: Life_RscButtonInvisible {
			idc = 532121;
			text = "";
			x = 0.56875 * safezoneW + safezoneX;
			y = 0.743518 * safezoneH + safezoneY;
			w = 0.114479 * safezoneW;
			h = 0.0274444 * safezoneH;
		};
		class Btn4: Life_RscButtonInvisible {
			idc = 532122;
			text = "";
			x = 0.56875 * safezoneW + safezoneX;
			y = 0.781481 * safezoneH + safezoneY;
			w = 0.114479 * safezoneW;
			h = 0.0274444 * safezoneH;
		};
		class Btn5: Life_RscButtonInvisible {
			idc = 532123;
			text = "";
			x = 0.56875 * safezoneW + safezoneX;
			y = 0.818519 * safezoneH + safezoneY;
			w = 0.114479 * safezoneW;
			h = 0.0274444 * safezoneH;
		};
		class Btn6: Life_RscButtonInvisible {
			idc = 532124;
			text = "";
			x = 0.56875 * safezoneW + safezoneX;
			y = 0.855556 * safezoneH + safezoneY;
			w = 0.114479 * safezoneW;
			h = 0.0274444 * safezoneH;
		};
	};
};