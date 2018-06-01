/*
	Author: ALF Team
	File: hud_stats.hpp

*/
class RSC_DOCALLPOPUP
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 4;
	name="RSC_DOCALLPOPUP";
	onLoad="uiNamespace setVariable ['RSC_DOCALLPOPUP',_this select 0]";
	objects[]={};
	class controlsBackground {
	};
	class controls
	{
		class alf_popup_text_basic7
		{
			type=13;
			style=0x0c+0x02;
			idc=13451;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.352 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOGPS
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 3;
	name="RSC_DOGPS";
	onLoad="uiNamespace setVariable ['RSC_DOGPS',_this select 0]";
	class controlsBackground {
	};
	class controls
	{
		class alf_popup_text_basic7 : Life_RscStructuredText
		{
			idc=13450;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.352 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG7
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 4;
	name="RSC_DOMSG7";
	onLoad="uiNamespace setVariable ['RSC_DOMSG7',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_info.paa";
			idc = 133771;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic7
		{
			type=13;
			style=0x0c+0x02;
			idc=13377;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.162704 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG6
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMSG6";
	onLoad="uiNamespace setVariable ['RSC_DOMSG6',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_info.paa";
			idc = 133761;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic6
		{
			type=CT_STRUCTURED_TEXT;
			idc=13376;
			style=ST_LEFT;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.637037 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG5
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMSG5";
	onLoad="uiNamespace setVariable ['RSC_DOMSG5',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_info.paa";
			idc = 133751;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic5
		{
			type=CT_STRUCTURED_TEXT;
			idc=13375;
			style=ST_LEFT;
			x = 0.0359377 * safezoneW + safezoneX;
			y = 0.560185 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG4
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMSG4";
	onLoad="uiNamespace setVariable ['RSC_DOMSG4',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_info.paa";
			idc = 133741;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic4
		{
			type=CT_STRUCTURED_TEXT;
			idc=13374;
			style=ST_LEFT;
			x = 0.0359371 * safezoneW + safezoneX;
			y = 0.482408 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG3
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMSG3";
	onLoad="uiNamespace setVariable ['RSC_DOMSG3',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_info.paa";
			idc = 133731;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic3
		{
			type=CT_STRUCTURED_TEXT;
			idc=13373;
			style=ST_LEFT;
			x = 0.035937 * safezoneW + safezoneX;
			y = 0.405555 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG2
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMSG2";
	onLoad="uiNamespace setVariable ['RSC_DOMSG2',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_info.paa";
			idc = 133721;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic2
		{
			type=CT_STRUCTURED_TEXT;
			idc=13372;
			style=ST_LEFT;
			x = 0.0359378 * safezoneW + safezoneX;
			y = 0.327778 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOMSG1
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOMSG1";
	onLoad="uiNamespace setVariable ['RSC_DOMSG1',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_info.paa";
			idc = 133711;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic1
		{
			type=CT_STRUCTURED_TEXT;
			idc=13371;
			style=ST_LEFT;
			x = 0.0359372 * safezoneW + safezoneX;
			y = 0.250926 * safezoneH + safezoneY;
			w = 0.148854 * safezoneW;
			h = 0.0633333 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOSMS4
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOSMS4";
	onLoad="uiNamespace setVariable ['RSC_DOSMS4',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_sms.paa";
			idc = 133334;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.428 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic4
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333341;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOSMS3
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOSMS3";
	onLoad="uiNamespace setVariable ['RSC_DOSMS3',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_sms.paa";
			idc = 133333;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.527 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic3
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333331;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOSMS2
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOSMS2";
	onLoad="uiNamespace setVariable ['RSC_DOSMS2',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_sms.paa";
			idc = 133332;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic2
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333321;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOSMS1
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOSMS1";
	onLoad="uiNamespace setVariable ['RSC_DOSMS1',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_sms.paa";
			idc = 133331;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic1
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333311;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOCOPCALL4
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOCOPCALL4";
	onLoad="uiNamespace setVariable ['RSC_DOCOPCALL4',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_copcall.paa";
			idc = 133334;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.428 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic4
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333341;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOCOPCALL3
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOCOPCALL3";
	onLoad="uiNamespace setVariable ['RSC_DOCOPCALL3',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_copcall.paa";
			idc = 133333;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.527 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic3
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333331;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOCOPCALL2
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOCOPCALL2";
	onLoad="uiNamespace setVariable ['RSC_DOCOPCALL2',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_copcall.paa";
			idc = 133332;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic2
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333321;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class RSC_DOCOPCALL1
{
	idd = -1;
	fadein=1;
  fadeout=1;
	duration = 6;
	name="RSC_DOCOPCALL1";
	onLoad="uiNamespace setVariable ['RSC_DOCOPCALL1',_this select 0]";
	objects[]={};
	class controlsBackground {
		class MainBackground: Life_RscPicture {
			text = "\ALF_Client\textures\header_copcall.paa";
			idc = 133331;
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.33 * safezoneH;
		};
	};
	class controls
	{
		class alf_popup_text_basic1
		{
			type=CT_STRUCTURED_TEXT;
			idc=1333311;
			style=ST_LEFT;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			valign = "left";
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=false;
			text="";
		};
	};
};

class playerHUD {
	idd = -1;
	duration = 10e10;
	movingEnable = 0;
	fadein = 1;
	fadeout = 1;
	name = "playerHUD";
	onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[] = {};

	class controls {

		class ALF_EarPlug {
			type=CT_STRUCTURED_TEXT;
			idc = 11108;
			fadein=1;
			fadeout=1;
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_Tfr {
			type=CT_STRUCTURED_TEXT;
			idc = 11109;
			fadein=1;
			fadeout=1;
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_Health {
			type=CT_STRUCTURED_TEXT;
			idc = 11110;
			fadein=1;
			fadeout=1;
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_Drink {
			type=CT_STRUCTURED_TEXT;
			idc = 11111;
			fadein=1;
			fadeout=1;
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_Food {
			type=CT_STRUCTURED_TEXT;
			idc = 11112;
			fadein=1;
			fadeout=1;
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_CallOff {
			type=CT_STRUCTURED_TEXT;
			idc = 11113;
			fadein=1;
			fadeout=1;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_Sms {
			type=CT_STRUCTURED_TEXT;
			idc = 11114;
			fadein=1;
			fadeout=1;
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_ViberMode {
			type=CT_STRUCTURED_TEXT;
			idc = 11115;
			fadein=1;
			fadeout=1;
			x = 0.881562 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class ALF_InCall {
			type=CT_STRUCTURED_TEXT;
			idc = 11116;
			fadein=1;
			fadeout=1;
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
		class ALF_Anonyme {
			type=CT_STRUCTURED_TEXT;
			idc = 11117;
			fadein=1;
			fadeout=1;
			x = 0.922813 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.407344;
			h = 0.429 * safezoneH;
			style=ST_LEFT;
			sizeEx=0.035;
			size=0.035;
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
	};
};