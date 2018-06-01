class ALF_DabMenu_Dialog {
	idd = 10520;
	name= "ALF_DabMenu_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "";
			idc = -1;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
	};

	class controls {

		class livreta: Life_RscButtonInvisible {
			idc = 10521;
			text = "";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class livretb: Life_RscButtonInvisible {
			idc = 10522;
			text = "";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class livretc: Life_RscButtonInvisible {
			idc = 10523;
			text = "";
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.231 * safezoneH;
		};
	};
};

class ALF_DabAccess_Dialog {
	idd = 10620;
	name= "ALF_DabAccess_Dialog";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "";
			idc = -1;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
	};

	class controls {

		class SoldeLivret: Life_RscStructuredText
		{
			idc = 10622;
			text = "";
			colorText[] = {0,0,0,1};
			x = 0.294271 * safezoneW + safezoneX;
			y = 0.485 * safezoneH + safezoneY;
			w = 0.116771 * safezoneW;
			h = 0.0309259 * safezoneH;
		};
		class SoldeCash: Life_RscStructuredText
		{
			idc = 10623;
			text = "";
			colorText[] = {0,0,0,1};
			x = 0.294271 * safezoneW + safezoneX;
			y = 0.565 * safezoneH + safezoneY;
			w = 0.116771 * safezoneW;
			h = 0.0309259 * safezoneH;
		};
		class Retirer: Life_RscButtonInvisible {
			idc = 10621;
			text = "";
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.101146 * safezoneW;
			h = 0.0392593 * safezoneH;
		};
		class picTransfertA: Life_RscPicture {
			text = "";
			idc = 106241;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class TransfertAB: Life_RscButtonInvisible {
			idc = 10624;
			text = "";
			x = 0.535938 * safezoneW + safezoneX;
			y = 0.616667 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042963 * safezoneH;
		};
		class TransfertAC: Life_RscButtonInvisible {
			idc = 10625;
			text = "";
			x = 0.535938 * safezoneW + safezoneX;
			y = 0.671296 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042963 * safezoneH;
		};
		class picTransfertB: Life_RscPicture {
			text = "";
			idc = 106261;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class TransfertBA: Life_RscButtonInvisible {
			idc = 10626;
			text = "";
			x = 0.535938 * safezoneW + safezoneX;
			y = 0.616667 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042963 * safezoneH;
		};
		class TransfertBC: Life_RscButtonInvisible {
			idc = 10627;
			text = "";
			x = 0.535938 * safezoneW + safezoneX;
			y = 0.671296 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042963 * safezoneH;
		};
		class picTransfertC: Life_RscPicture {
			text = "";
			idc = 106281;
			x = 0.213854 * safezoneW + safezoneX;
			y = 0.141629 * safezoneH + safezoneY;
			w = 0.578542 * safezoneW;
			h = 0.993593 * safezoneH;
		};
		class TransfertCA: Life_RscButtonInvisible {
			idc = 10628;
			text = "";
			x = 0.535938 * safezoneW + safezoneX;
			y = 0.616667 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042963 * safezoneH;
		};
		class TransfertCB: Life_RscButtonInvisible {
			idc = 10629;
			text = "";
			x = 0.535938 * safezoneW + safezoneX;
			y = 0.671296 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042963 * safezoneH;
		};
		class NumberEdit: Life_RscEdit {
			idc = 10630;
			text = "";
			style=ST_CENTER;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0};
			x = 0.572917 * safezoneW + safezoneX;
			y = 0.488888 * safezoneH + safezoneY;
			w = 0.125625 * safezoneW;
			h = 0.0309259 * safezoneH;
		};
	};
};
