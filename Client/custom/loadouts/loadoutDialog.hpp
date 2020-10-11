 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */

class RscExileLoadoutDialog
{
	idd = 47147;
	onLoad="uiNamespace setVariable ['RscExileLoadoutDialog', _this select 0]";
	onUnload="call ExileClient_gui_traderDialog_event_onUnload; call ExileClient_gui_loadoutDialog_event_onUnload; uiNamespace setVariable ['RscExileLoadoutDialog', displayNull]";
	
	class ControlsBackground
	{
		class BackgroundImage
		{
			type = 0;
			idc = 2000;
			x="18.25 * (0.025) + (0)";
			y="1.7 * (0.04) + (0)";
			w="21.5 * (0.025)";
			h="22.75 * (0.04)";
			colorBackground[]={0.050000001,0.050000001,0.050000001,0.69999999};
			style = 0;
			text = "";
			colorText[] = {0.3176,0.3294,0.4745,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
		class DialogCaptionMain: BackgroundImage
		{
			idc=2001;
			text="Loadout:";
			x="18.25 * (0.025) + (0)";
			y="0.5 * (0.04) + (0)";
			w="21.5 * (0.025)";
			h="1 * (0.04)";
			colorBackground[]={0.1,0.1,0.1,1};
			colorText[] = {1.0,1.0,1.0,1};
		};
		
		class BackgroundImageInventory: BackgroundImage
		{
			idc=2004;
			x="0.25 * (0.025) + (0)";
			y="1.7 * (0.04) + (0)";
			w="17.5 * (0.025)";
			h="22.75 * (0.04)";
		};
		
		class DialogCaptionInventory: DialogCaptionMain
		{
			idc=2005;
			text=$STR_LOADOUT_Inventory;
			x="0.25 * (0.025) + (0)";
			y="0.5 * (0.04) + (0)";
			w="17.5 * (0.025)";
			h="1 * (0.04)";
		};
		
		class BackgroundHeadgear: BackgroundImage
		{
			idc=3000;
			text="exile_assets\texture\ui\inventory\headgear_ca.paa";
			style = 48;
			colorText[] = {1,1,1,1};
			x="25.75 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="2.5 * (0.03)";
			h="2.5 * (0.04)";
		};
		
		class EmptyBackgroundHeadgear: BackgroundHeadgear
		{
			idc=3001;
			text="";
			style = 0;
			show = 0;
			colorBackground[]={1,1,1,0.1};
			x="25.75 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="2.5 * (0.03)";
			h="2.5 * (0.04)";
		};
		
		class BackgroundFacewear: BackgroundHeadgear
		{
			idc=4000;
			text="exile_assets\texture\ui\inventory\goggles_ca.paa";
			style = 48;
			x="29.25 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="2.5 * (0.03)";
			h="2.5 * (0.04)";
		};
		class EmptyBackgroundFacewear: EmptyBackgroundHeadgear
		{
			idc=4001;
			x="29.25 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="2.5 * (0.03)";
			h="2.5 * (0.04)";
		};
		
		class BackgroundGoggles: BackgroundHeadgear
		{
			idc=5500;
			text="exile_assets\texture\ui\inventory\nvgs_ca.paa";
			style = 48;
			x="32.75 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="2.5 * (0.03)";
			h="2.5 * (0.04)";
		};
		class EmptyBackgroundGoggles: EmptyBackgroundHeadgear
		{
			idc=5501;
			x="32.75 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="2.5 * (0.03)";
			h="2.5 * (0.04)";
		};
		
		class BackgroundBinocular: BackgroundHeadgear
		{
			idc=6000;
			text="exile_assets\texture\ui\inventory\binoculars_ca.paa";
			style = 48;
			x="36.25 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="2.5 * (0.03)";
			h="2.5 * (0.04)";
		};
		class EmptyBackgroundBinocular: EmptyBackgroundHeadgear
		{
			idc=6001;
			x="36.25 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="2.5 * (0.03)";
			h="2.5 * (0.04)";
		};
		
		class BackgroundUniform: BackgroundHeadgear
		{
			idc=7000;
			text="exile_assets\texture\ui\inventory\uniform_ca.paa";
			style = 48;
			x="18.75 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="4 * (0.03)";
			h="4 * (0.04)";
		};
		class EmptyBackgroundUniform: EmptyBackgroundHeadgear
		{
			idc=7001;
			x="18.75 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="4 * (0.03)";
			h="4 * (0.04)";
		};
		class EmptyBackgroundFrameUniform: EmptyBackgroundHeadgear
		{
			idc=7003;
			style=160;
			colorText[] = {1,1,1,1};
			x="18.75 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="4 * (0.03)";
			h="4 * (0.04)";
		};
		
		class BackgroundVest: BackgroundHeadgear
		{
			idc=8000;
			text="exile_assets\texture\ui\inventory\vest_ca.paa";
			style = 48;
			x="18.75 * (0.025) + (0)";
			y="6.7 * (0.04) + (0)";
			w="4 * (0.03)";
			h="4 * (0.04)";
		};
		class EmptyBackgroundVest: EmptyBackgroundHeadgear
		{
			idc=8001;
			x="18.75 * (0.025) + (0)";
			y="6.7 * (0.04) + (0)";
			w="4 * (0.03)";
			h="4 * (0.04)";
		};
		class EmptyBackgroundFrameVest: EmptyBackgroundFrameUniform
		{
			idc=8003;
			x="18.75 * (0.025) + (0)";
			y="6.7 * (0.04) + (0)";
			w="4 * (0.03)";
			h="4 * (0.04)";
		};
		
		class BackgroundBackpack: BackgroundHeadgear
		{
			idc=9000;
			text="exile_assets\texture\ui\inventory\backpack_ca.paa";
			style = 48;
			x="18.75 * (0.025) + (0)";
			y="11.2 * (0.04) + (0)";
			w="4 * (0.03)";
			h="4 * (0.04)";
		};
		class EmptyBackgroundBackpack: EmptyBackgroundHeadgear
		{
			idc=9001;
			x="18.75 * (0.025) + (0)";
			y="11.2 * (0.04) + (0)";
			w="4 * (0.03)";
			h="4 * (0.04)";
		};
		class EmptyBackgroundFrameBackpack: EmptyBackgroundFrameUniform
		{
			idc=9003;
			x="18.75 * (0.025) + (0)";
			y="11.2 * (0.04) + (0)";
			w="4 * (0.03)";
			h="4 * (0.04)";
		};
		
		class BackgroundWatch: BackgroundHeadgear
		{
			idc=10000;
			text="exile_assets\texture\ui\inventory\watch_ca.paa";
			style = 48;
			x="18.75 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
		};
		class EmptyBackgroundWatch: EmptyBackgroundHeadgear
		{
			idc=10001;
			x="18.75 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
		};
		
		class BackgroundMap: BackgroundHeadgear
		{
			idc=11000;
			text="exile_assets\texture\ui\inventory\map_ca.paa";
			style = 48;
			x="21.35 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
		};
		class EmptyBackgroundMap: EmptyBackgroundHeadgear
		{
			idc=11001;
			x="21.35 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
		};
		
		class BackgroundGPS: BackgroundHeadgear
		{
			idc=12000;
			text="exile_assets\texture\ui\inventory\gps_ca.paa";
			style = 48;
			x="18.75 * (0.025) + (0)";
			y="17.8 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
		};
		class EmptyBackgroundGPS: EmptyBackgroundHeadgear
		{
			idc=12001;
			x="18.75 * (0.025) + (0)";
			y="17.8 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
		};
		
		class BackgroundCompass: BackgroundHeadgear
		{
			idc=13000;
			text="exile_assets\texture\ui\inventory\compass_ca.paa";
			style = 48;
			x="21.35 * (0.025) + (0)";
			y="17.8 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
		};
		class EmptyBackgroundCompass: EmptyBackgroundHeadgear
		{
			idc=13001;
			x="21.35 * (0.025) + (0)";
			y="17.8 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
		};
		
		class BackgroundRadio: BackgroundHeadgear
		{
			idc=14000;
			text="exile_assets\texture\ui\inventory\radio_ca.paa";
			style = 48;
			x="20.05 * (0.025) + (0)";
			y="19.9 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
		};
		class EmptyBackgroundRadio: EmptyBackgroundHeadgear
		{
			idc=14001;
			x="20.05 * (0.025) + (0)";
			y="19.9 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
		};
		
		class BackgroundPrimary: BackgroundHeadgear
		{
			idc=15000;
			text="exile_assets\texture\ui\inventory\primaryweapon_ca.paa";
			style = 48;
			x="24.25 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="6 * (0.03)";
			h="3 * (0.04)";
		};
		class EmptyBackgroundPrimary: EmptyBackgroundHeadgear
		{
			idc=15001;
			x="24.25 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="6 * (0.03)";
			h="3 * (0.04)";
		};
		class EmptyBackgroundFramePrimary: EmptyBackgroundFrameUniform
		{
			idc=15003;
			x="24.25 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="6 * (0.03)";
			h="3 * (0.04)";
		};
		
		class BackgroundSecondary: BackgroundHeadgear
		{
			idc=16000;
			text="exile_assets\texture\ui\inventory\secondaryweapon_ca.paa";
			style = 48;
			x="32 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="6 * (0.03)";
			h="3 * (0.04)";
		};
		class EmptyBackgroundSecondary: EmptyBackgroundHeadgear
		{
			idc=16001;
			x="32 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="6 * (0.03)";
			h="3 * (0.04)";
		};
		class EmptyBackgroundFrameSecondary: EmptyBackgroundFrameUniform
		{
			idc=16003;
			x="32 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="6 * (0.03)";
			h="3 * (0.04)";
		};
		
		class BackgroundHandgun: BackgroundHeadgear
		{
			idc=17000;
			text="exile_assets\texture\ui\inventory\handgun_ca.paa";
			style = 48;
			x="24.25 * (0.025) + (0)";
			y="19.25 * (0.04) + (0)";
			w="6 * (0.03)";
			h="3 * (0.04)";
		};
		class EmptyBackgroundHandgun: EmptyBackgroundHeadgear
		{
			idc=17001;
			x="24.25 * (0.025) + (0)";
			y="19.25 * (0.04) + (0)";
			w="6 * (0.03)";
			h="3 * (0.04)";
		};
		class EmptyBackgroundFrameHandgun: EmptyBackgroundFrameUniform
		{
			idc=17003;
			x="24.25 * (0.025) + (0)";
			y="19.25 * (0.04) + (0)";
			w="6 * (0.03)";
			h="3 * (0.04)";
		};
	};
	class Controls
	{
		class closebtn
		{
			type = 1;
			idc = 2009;
			shadow=2;
			tooltipColorText[]={1,1,1,1};
			tooltipColorBox[]={1,1,1,1};
			tooltipColorShade[]={0,0,0,0.64999998};
			x = safeZoneX + safeZoneW * 0.6875;
			y = safeZoneY + safeZoneH * 0.2405;
			w = safeZoneW * 0.02125;
			h = safeZoneH * 0.01333334;
			action="closeDialog 0;";
			style=2096;
			color[]={1,1,1,0.69999999};
			colorText[]={1,1,1,0.69999999};
			colorActive[]={1,1,1,1};
			tooltip=$STR_LOADOUT_Close;
			text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
			borderSize = 0;
			colorBackground[] = {0.5098,0.0353,0.6667,0};
			colorBackgroundActive[] = {1,0,0,0};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0};
			colorShadow[] = {0,0,0,0};
			font = "PuristaMedium";
			offsetPressedX = 0.0;
			offsetPressedY = 0.0;
			offsetX = 0.0;
			offsetY = 0.0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			
		};
		
		class LoadoutListBox
		{
			idc=2010;
			font="RobotoCondensed";
			colorSelect[]={0,0,0,1};
			colorPictureRightSelected[]={1,1,1,1};
			soundSelect[]=
			{
				"\A3\ui_f\data\sound\RscListbox\soundSelect",
				0.090000004,
				1
			};
			class ListScrollBar
			{
				color[]={1,1,1,1};
				autoScrollEnabled=1;
				colorActive[]={1,1,1,1};
				colorDisabled[]={1,1,1,0.30000001};
				thumb="\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowEmpty="\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull="\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border="\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				shadow=0;
				scrollSpeed=0.059999999;
				width=0;
				height=0;
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
			};
			sizeEx="0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx2="0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			rowHeight="2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			canDrag=0;
			itemSpacing=0.001;
			period=1.2;
			shadow=0;
			maxHistoryDelay=1;
			fade=0;
			deletable=0;
			type=5;
			style=16;
			colorDisabled[]={1,1,1,0.25};
			colorPicture[]={1,1,1,1};
			colorPictureDisabled[]={1,1,1,0.25};
			colorPictureRight[]={1,1,1,1};
			colorPictureRightDisabled[]={1,1,1,0.25};
			colorPictureSelected[]={1,1,1,1};
			colorScrollbar[]={1,0,0,0};
			colorSelect2[]={0,0,0,1};
			colorSelect2Right[]={0,0,0,1};
			colorSelectBackground2[]={1,1,1,0.5};
			colorSelectBackground[]={0.94999999,0.94999999,0.94999999,1};
			colorSelectRight[]={0,0,0,1};
			colorShadow[]={0,0,0,0.5};
			colorText[]={1,1,1,1};
			colorTextRight[]={1,1,1,1};
			disabledCtrlColor[]={1,1,1,0.5};
			itemBackground[]={1,1,1,0.1};
			tooltipColorBox[]={1,1,1,1};
			tooltipColorShade[]={0,0,0,0.64999998};
			tooltipColorText[]={1,1,1,1};
			x="24.25 * (0.025) + (0)";
			y="5.2 * (0.04) + (0)";
			w="15 * (0.025)";
			h="10 * (0.04)";
			colorBackground[]={1,1,1,0.1};
			onLBSelChanged = "";
			onMouseButtonDblClick = "_this spawn ExileClient_gui_loadoutDialog_removeLoadoutListboxItem;";
		};
		
		//Player Inventory
		class InventoryListBox: LoadoutListBox
		{
			idc=2013;
			x="0.75 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="16.5 * (0.025)";
			h="19 * (0.04)";
			//tooltip="Select what you want to add the item into on the right side!";
			onLBSelChanged = "_this call ExileClient_gui_loadoutDialog_event_onInventoryListBoxSelectionChanged;";
			onMouseButtonDblClick = "";
		};
		
		class InventoryDropDown
		{
			type = 4;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			
			colorDisabled[] = {1,1,1,0.25};
			
			colorSelect[] = {0,0,0,1};
			colorText[] = {1,1,1,1.0};
			colorBackground[] = {0,0,0,1};
			colorSelectBackground[] = {1,1,1,0.7};
			
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			idc=2016;
			x="10.75 * (0.025) + (0)";
			y="0.5 * (0.04) + (0)";
			w="7 * (0.025)";
			h="1 * (0.04)";
			onLBSelChanged="_this call ExileClient_gui_loadoutDialog_event_onPlayerInventoryDropDownSelectionChanged";
		};
		
		class InventoryApplyButton
		{
			idc=2017;
			text=$STR_LOADOUT_Apply;
			x="0.75 * (0.025) + (0)";
			y="23 * (0.04) + (0)";
			w="6 * (0.025)";
			h="1 * (0.04)";
			class HitZone
			{
				left=0;
				top=0;
				right=0;
				bottom=0;
			};
			action="";
			class AttributesImage
			{
				font="RobotoCondensed";
				color="#E5E5E5";
				align="left";
			};
			type=16;
			style="0x02 + 0xC0";
			default=0;
			shadow=0;
			animTextureNormal="#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled="#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver="#(argb,8,8,3)color(1,1,1,1)";
			animTextureFocused="#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed="#(argb,8,8,3)color(1,1,1,1)";
			animTextureDefault="#(argb,8,8,3)color(1,1,1,1)";
			colorBackgroundFocused[]={1,1,1,1};
			colorBackground2[]={0.75,0.75,0.75,1};
			color[]={1,1,1,1};
			colorFocused[]={0,0,0,1};
			color2[]={0,0,0,1};
			colorDisabled[]={1,1,1,0.25};
			textSecondary="";
			colorSecondary[]={1,1,1,1};
			colorFocusedSecondary[]={0,0,0,1};
			color2Secondary[]={0,0,0,1};
			colorDisabledSecondary[]={1,1,1,0.25};
			sizeExSecondary="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			fontSecondary="PuristaLight";
			period=1.2;
			periodFocus=1.2;
			periodOver=1.2;
			size="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			tooltipColorText[]={1,1,1,1};
			tooltipColorBox[]={1,1,1,1};
			tooltipColorShade[]={0,0,0,0.64999998};
			textureNoShortcut="";
			class TextPos
			{
				left="0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
				top="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
				right=0.0049999999;
				bottom=0;
			};
			class Attributes
			{
				font="PuristaLight";
				color="#E5E5E5";
				align="left";
				shadow="false";
			};
			class ShortcutPos
			{
				left="5.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
				top=0;
				w="1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
				h="1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			};
			soundEnter[]=
			{
				"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
				0.090000004,
				1
			};
			soundPush[]=
			{
				"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
				0.090000004,
				1
			};
			soundClick[]=
			{
				"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
				0.090000004,
				1
			};
			soundEscape[]=
			{
				"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
				0.090000004,
				1
			};
			colorText[]={1,1,1,1};
			colorBackground[]={0,0,0,0.80000001};
			tooltip=$STR_LOADOUT_Save;
			onMouseButtonClick="_this spawn ExileClient_gui_loadoutDialog_event_onApplyLoadoutButtonClick;";
		};
		
		class InventoryAddButton: InventoryApplyButton
		{
			idc=2020;
			text=$STR_LOADOUT_AddButton;
			x="11.25 * (0.025) + (0)";
			y="23 * (0.04) + (0)";
			w="6 * (0.025)";
			h="1 * (0.04)";
			class Attributes
			{
				font="PuristaLight";
				color="#E5E5E5";
				align="right";
				shadow="false";
			};
			tooltip = $STR_LOADOUT_AddText;
			onMouseButtonClick="_this spawn ExileClient_gui_loadoutDialog_event_onAddLoadoutButtonClick;";
		};
		
		class LoadoutClearButton: InventoryApplyButton
		{
			idc=2019;
			text=$STR_LOADOUT_ClearButton;
			x="18.75 * (0.025) + (0)";
			y="23 * (0.04) + (0)";
			w="6 * (0.025)";
			h="1 * (0.04)";
			class Attributes
			{
				font="PuristaLight";
				color="#E5E5E5";
				align="left";
				shadow="false";
			};
			tooltip = $STR_LOADOUT_ClearText;
			onMouseButtonClick="_this spawn ExileClient_gui_loadoutDialog_event_onClearLoadoutButtonClick;";
		};
		
		class LoadoutBuyButton: InventoryApplyButton
		{
			idc=2015;
			text=$STR_LOADOUT_BuyButton;
			x="33.25 * (0.025) + (0)";
			y="23 * (0.04) + (0)";
			w="6 * (0.025)";
			h="1 * (0.04)";
			class Attributes
			{
				font="PuristaLight";
				color="#E5E5E5";
				align="right";
				shadow="false";
			};
			tooltip = $STR_LOADOUT_BuyText;
			onMouseButtonClick="_this spawn ExileClient_gui_loadoutDialog_event_onBuyLoadoutButtonClick";
		};
		
		
		class HeadGearImage 
		{
			type = 11;
			idc = 3002;
			colorBackground[]={0.050000001,0.050000001,0.050000001,0.69999999};
			style = 48;
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			x="25.75 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="2.5 * (0.03)";
			h="2.5 * (0.04)";
			shadow = 2;
			show = 0;
			url = "";
			colorDisabled[] = {1,1,1,0.25};
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
			color[] = {1,1,1,0.7};
			colorActive[] = {1,1,1,1};
			tooltip = "";
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			text="";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutHeadgear',-1] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
		};
		
		class FaceWearImage: HeadGearImage 
		{
			idc = 4002;
			x="29.25 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="2.5 * (0.03)";
			h="2.5 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutFacewear',-1] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
		};
		
		class GogglesImage: HeadGearImage
		{
			idc=5502;
			x="32.75 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="2.5 * (0.03)";
			h="2.5 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutItems',5] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
		};
		
		class BinocularImage: HeadGearImage
		{
			idc=6002;
			x="36.25 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="2.5 * (0.03)";
			h="2.5 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutBinocular',-1] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
		};
	
		class UniformImage: HeadGearImage
		{
			idc=7002;
			x="18.75 * (0.025) + (0)";
			y="2.2 * (0.04) + (0)";
			w="4 * (0.03)";
			h="4 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutUniform',-1] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
			onMouseButtonClick = "if(count ExileClientPlayerLoadoutUniform > 0) then{[(((ExileClientPlayerLoadoutUniform select 0) call BIS_fnc_itemType) select 1),true] call ExileClient_gui_loadoutDialog_updateLoadoutListBox;};";
		};
		
		class VestImage: HeadGearImage
		{
			idc=8002;
			x="18.75 * (0.025) + (0)";
			y="6.7 * (0.04) + (0)";
			w="4 * (0.03)";
			h="4 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutVest',-1] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
			onMouseButtonClick = "if(count ExileClientPlayerLoadoutVest > 0) then{[(((ExileClientPlayerLoadoutVest select 0) call BIS_fnc_itemType) select 1),true] call ExileClient_gui_loadoutDialog_updateLoadoutListBox;};";
		};
	
		class BackpackImage: HeadGearImage
		{
			idc=9002;
			x="18.75 * (0.025) + (0)";
			y="11.2 * (0.04) + (0)";
			w="4 * (0.03)";
			h="4 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutBackpack',-1] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
			onMouseButtonClick = "if(count ExileClientPlayerLoadoutBackpack > 0) then{[(((ExileClientPlayerLoadoutBackpack select 0) call BIS_fnc_itemType) select 1),true] call ExileClient_gui_loadoutDialog_updateLoadoutListBox;};";
		};
		
		class WatchImage: HeadGearImage
		{
			idc=10002;
			x="18.75 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutItems',4] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
		};
		
		class MapImage: HeadGearImage
		{
			idc=11002;
			x="21.35 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutItems',0] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
		};
		
		class GPSImage: HeadGearImage
		{
			idc=12002;
			x="18.75 * (0.025) + (0)";
			y="17.8 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutItems',1] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
		};
		
		class CompassImage: HeadGearImage
		{
			idc=13002;
			x="21.35 * (0.025) + (0)";
			y="17.8 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutItems',3] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
		};
		
		class RadioImage: HeadGearImage
		{
			idc=14002;
			x="20.05 * (0.025) + (0)";
			y="19.9 * (0.04) + (0)";
			w="1.8 * (0.03)";
			h="1.8 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutItems',2] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
		};
		
		class PrimaryImage: HeadGearImage
		{
			idc=15002;
			x="24.25 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="6 * (0.03)";
			h="3 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutPrimary',-1] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
			onMouseButtonClick = "if(count ExileClientPlayerLoadoutPrimary > 0) then {['Primary',true] call ExileClient_gui_loadoutDialog_updateLoadoutListBox;};";
		};
		
		class SecondaryImage: HeadGearImage
		{
			idc=16002;
			x="32 * (0.025) + (0)";
			y="15.7 * (0.04) + (0)";
			w="6 * (0.03)";
			h="3 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutSecondary',-1] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
			onMouseButtonClick = "if(count ExileClientPlayerLoadoutSecondary > 0) then {['Secondary',true] call ExileClient_gui_loadoutDialog_updateLoadoutListBox;};";
		};
		
		class HandgunImage: HeadGearImage
		{
			idc=17002;
			x="24.25 * (0.025) + (0)";
			y="19.25 * (0.04) + (0)";
			w="6 * (0.03)";
			h="3 * (0.04)";
			onMouseButtonDblClick = "['ExileClientPlayerLoadoutPistol',-1] spawn ExileClient_gui_loadoutDialog_removeLoadoutItem;";
			onMouseButtonClick = "if(count ExileClientPlayerLoadoutPistol > 0) then {['Pistol',true] call ExileClient_gui_loadoutDialog_updateLoadoutListBox;};";
		};
		
		class LoadoutPrice
		{
			idc=2021;
			type = 0;
			style = 0;
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			text=$STR_LOADOUT_Price;
			colorBackground[]={0.1,0.1,0.1,1};
			colorText[] = {1.0,1.0,1.0,1};
			x="32 * (0.025) + (0)";
			y="19.25 * (0.04) + (0)";
			w="6 * (0.03)";
			h="1 * (0.04)";
			tooltip = $STR_LOADOUT_PriceToolTip;
		};
		class LoadoutNum: LoadoutPrice
		{
			idc=2022;
			//type = 0;
			style = 0;
			type = 13;
			font = "PuristaMedium";
			size="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			text="00000";
			colorBackground[]={0,0,0,0};
			colorText[] = {1.0,1.0,1.0,1};
			class Attributes
			{
				font="PuristaMedium";
				color="#E5E5E5";
				align="right";
				shadow="false";
			};
			class AttributesImage
			{
				font="PuristaMedium";
				color="#E5E5E5";
				align="right";
			};
			x="34.25 * (0.025) + (0)";
			y="19.25 * (0.04) + (0)";
			w="4.25 * (0.03)";
			h="1 * (0.04)";
			tooltip = $STR_LOADOUT_PriceToolTip;
		};
		
		class GearPrice: LoadoutPrice
		{
			idc=2023;
			text=$STR_LOADOUT_Gear;
			y="20.3 * (0.04) + (0)";
			tooltip = $STR_LOADOUT_GearToolTip;
		};
		class GearNum: LoadoutNum
		{
			idc=2024;
			text="00000";
			y="20.3 * (0.04) + (0)";
			tooltip = $STR_LOADOUT_GearToolTip;
		};
		
		class TotalPrice: LoadoutPrice
		{
			idc=2025;
			text=$STR_LOADOUT_Total;
			y="21.35 * (0.04) + (0)";
			tooltip = $STR_LOADOUT_TotalToolTip;
		};
		class TotalNum: LoadoutNum
		{
			idc=2026;
			text="00000";
			y="21.35 * (0.04) + (0)";
			tooltip = $STR_LOADOUT_TotalToolTip;
		};
		
		class RemoveCheckBox
		{
			idc = 2027;
			type = 77;
			style = "0x00 + 0x10";
			enable = 1;
			show = 1;
			fade = 0;
			blinkingPeriod = 0;
			x = safeZoneX + safeZoneW * 0.68;
			y = safeZoneY + safeZoneH * 0.236;
			w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			color[] = {1,1,1,0.7};
			colorFocused[] = {1,1,1,1};
			colorHover[] = {1,1,1,1};
			colorPressed[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,0.2};
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackgroundHover[] = {0,0,0,0};
			colorBackgroundPressed[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			soundClick[]=
			{
				"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
				0.090000004,
				1
			};
			soundEnter[]=
			{
				"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
				0.090000004,
				1
			};
			soundEscape[]=
			{
				"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
				0.090000004,
				1
			};
			soundPush[]=
			{
				"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
				0.090000004,
				1
			};
			textureChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
			textureUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
			textureFocusedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
			textureFocusedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
			textureHoverChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
			textureHoverUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
			texturePressedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
			texturePressedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
			textureDisabledChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
			textureDisabledUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
			onCheckedChanged="_this call ExileClient_gui_loadoutDialog_event_onWarningCheckboxStateChanged";
			tooltip = $STR_LOADOUT_Warnings;
			tooltipColorShade[] = {0,0,0,1};
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
		};
		
		class LoadoutDropDown: InventoryDropDown
		{
			idc=2028;	
			x="22.75 * (0.025) + (0)";
			y="0.5 * (0.04) + (0)";
			w="3 * (0.025)";
			h="1 * (0.04)";
			onLBSelChanged="_this call ExileClient_gui_loadoutDialog_event_onLoudoutDropDownSelectionChanged";
		};
	};
};