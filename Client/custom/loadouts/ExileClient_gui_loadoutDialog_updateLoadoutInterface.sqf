 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */

private ["_dialog", "_addButton", "_headgearBackground", "_headgearEmptyBackground", "_configName", "_headgearIcon", "_facewearBackground", "_facewearEmptyBackground", "_facewearIcon", "_mapBackground", "_mapEmptyBackground", "_mapIcon", "_gpsBackground", "_gpsEmptyBackground", "_gpsIcon", "_radioBackground", "_radioEmptyBackground", "_radioIcon", "_compassBackground", "_compassEmptyBackground", "_compassIcon", "_watchBackground", "_watchEmptyBackground", "_watchIcon", "_nvgBackground", "_nvgEmptyBackground", "_nvgIcon", "_binocularBackground", "_binocularEmptyBackground", "_binocularIcon", "_uniformBackground", "_uniformEmptyBackground", "_uniformIcon", "_vestBackground", "_vestEmptyBackground", "_vestIcon", "_backpackBackground", "_backpackEmptyBackground", "_backpackIcon", "_primaryBackground", "_primaryEmptyBackground", "_primaryIcon", "_secondaryBackground", "_secondaryEmptyBackground", "_secondaryIcon", "_pistolBackground", "_pistolEmptyBackground", "_pistolIcon"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];

_addButton = _dialog displayCtrl 2020;
_addButton ctrlEnable false;

if !(ExileClientPlayerLoadoutHeadgear isEqualTo "") then
{
	_headgearBackground = _dialog displayCtrl 3000;
	_headgearBackground ctrlEnable false;
	_headgearBackground ctrlShow false;
	_headgearBackground ctrlCommit 0;
	
	_headgearEmptyBackground = _dialog displayCtrl 3001;
	_headgearEmptyBackground ctrlEnable true;
	_headgearEmptyBackground ctrlShow true;
	_headgearEmptyBackground ctrlCommit 0;
	
	_configName = ExileClientPlayerLoadoutHeadgear call ExileClient_util_gear_getConfigNameByClassName;
	
	_headgearIcon = _dialog displayCtrl 3002;
	_headgearIcon ctrlSetText (getText(configFile >> _configName >> ExileClientPlayerLoadoutHeadgear >> "picture"));
	_headgearIcon ctrlEnable true;
	_headgearIcon ctrlShow true;
	_headgearIcon ctrlCommit 0;
}
else
{
	_headgearBackground = _dialog displayCtrl 3000;
	_headgearBackground ctrlEnable true;
	_headgearBackground ctrlShow true;
	_headgearBackground ctrlCommit 0;
	
	_headgearEmptyBackground = _dialog displayCtrl 3001;
	_headgearEmptyBackground ctrlEnable false;
	_headgearEmptyBackground ctrlShow false;
	_headgearEmptyBackground ctrlCommit 0;
	
	_headgearIcon = _dialog displayCtrl 3002;
	_headgearIcon ctrlSetText "";
	_headgearIcon ctrlEnable false;
	_headgearIcon ctrlShow false;
	_headgearIcon ctrlCommit 0;
};

if !(ExileClientPlayerLoadoutFacewear isEqualTo "") then
{
	_facewearBackground = _dialog displayCtrl 4000;
	_facewearBackground ctrlEnable false;
	_facewearBackground ctrlShow false;
	_facewearBackground ctrlCommit 0;
	
	_facewearEmptyBackground = _dialog displayCtrl 4001;
	_facewearEmptyBackground ctrlEnable true;
	_facewearEmptyBackground ctrlShow true;
	_facewearEmptyBackground ctrlCommit 0;
	
	_configName = ExileClientPlayerLoadoutFacewear call ExileClient_util_gear_getConfigNameByClassName;
	
	_facewearIcon = _dialog displayCtrl 4002;
	_facewearIcon ctrlSetText (getText(configFile >> _configName >> ExileClientPlayerLoadoutFacewear >> "picture"));
	_facewearIcon ctrlEnable true;
	_facewearIcon ctrlShow true;
	_facewearIcon ctrlCommit 0;
}
else
{
	_facewearBackground = _dialog displayCtrl 4000;
	_facewearBackground ctrlEnable true;
	_facewearBackground ctrlShow true;
	_facewearBackground ctrlCommit 0;
	
	_facewearEmptyBackground = _dialog displayCtrl 4001;
	_facewearEmptyBackground ctrlEnable false;
	_facewearEmptyBackground ctrlShow false;
	_facewearEmptyBackground ctrlCommit 0;
	
	_facewearIcon = _dialog displayCtrl 4002;
	_facewearIcon ctrlSetText "";
	_facewearIcon ctrlEnable false;
	_facewearIcon ctrlShow false;
	_facewearIcon ctrlCommit 0;
};

if (count ExileClientPlayerLoadoutItems > 0) then
{
	if !((ExileClientPlayerLoadoutItems select 0) isEqualTo "") then
	{
		_mapBackground = _dialog displayCtrl 11000;
		_mapBackground ctrlEnable false;
		_mapBackground ctrlShow false;
		_mapBackground ctrlCommit 0;
		
		_mapEmptyBackground = _dialog displayCtrl 11001;
		_mapEmptyBackground ctrlEnable true;
		_mapEmptyBackground ctrlShow true;
		_mapEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutItems select 0) call ExileClient_util_gear_getConfigNameByClassName;
		
		_mapIcon = _dialog displayCtrl 11002;
		_mapIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutItems select 0) >> "picture"));
		_mapIcon ctrlEnable true;
		_mapIcon ctrlShow true;
		_mapIcon ctrlCommit 0;
	}
	else
	{
		_mapBackground = _dialog displayCtrl 11000;
		_mapBackground ctrlEnable true;
		_mapBackground ctrlShow true;
		_mapBackground ctrlCommit 0;
		
		_mapEmptyBackground = _dialog displayCtrl 11001;
		_mapEmptyBackground ctrlEnable false;
		_mapEmptyBackground ctrlShow false;
		_mapEmptyBackground ctrlCommit 0;
		
		_mapIcon = _dialog displayCtrl 11002;
		_mapIcon ctrlSetText "";
		_mapIcon ctrlEnable false;
		_mapIcon ctrlShow false;
		_mapIcon ctrlCommit 0;
	};
	if !((ExileClientPlayerLoadoutItems select 1) isEqualTo "") then
	{
		_gpsBackground = _dialog displayCtrl 12000;
		_gpsBackground ctrlEnable false;
		_gpsBackground ctrlShow false;
		_gpsBackground ctrlCommit 0;
		
		_gpsEmptyBackground = _dialog displayCtrl 12001;
		_gpsEmptyBackground ctrlEnable true;
		_gpsEmptyBackground ctrlShow true;
		_gpsEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutItems select 1) call ExileClient_util_gear_getConfigNameByClassName;
		
		_gpsIcon = _dialog displayCtrl 12002;
		_gpsIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutItems select 1) >> "picture"));
		_gpsIcon ctrlEnable true;
		_gpsIcon ctrlShow true;
		_gpsIcon ctrlCommit 0;
	}
	else
	{
		_gpsBackground = _dialog displayCtrl 12000;
		_gpsBackground ctrlEnable true;
		_gpsBackground ctrlShow true;
		_gpsBackground ctrlCommit 0;
		
		_gpsEmptyBackground = _dialog displayCtrl 12001;
		_gpsEmptyBackground ctrlEnable false;
		_gpsEmptyBackground ctrlShow false;
		_gpsEmptyBackground ctrlCommit 0;
		
		_gpsIcon = _dialog displayCtrl 12002;
		_gpsIcon ctrlSetText "";
		_gpsIcon ctrlEnable false;
		_gpsIcon ctrlShow false;
		_gpsIcon ctrlCommit 0;
	};
	if !((ExileClientPlayerLoadoutItems select 2) isEqualTo "") then
	{
		_radioBackground = _dialog displayCtrl 14000;
		_radioBackground ctrlEnable false;
		_radioBackground ctrlShow false;
		_radioBackground ctrlCommit 0;
		
		_radioEmptyBackground = _dialog displayCtrl 14001;
		_radioEmptyBackground ctrlEnable true;
		_radioEmptyBackground ctrlShow true;
		_radioEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutItems select 2) call ExileClient_util_gear_getConfigNameByClassName;
		
		_radioIcon = _dialog displayCtrl 14002;
		_radioIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutItems select 2) >> "picture"));
		_radioIcon ctrlEnable true;
		_radioIcon ctrlShow true;
		_radioIcon ctrlCommit 0;
	}
	else
	{
		_radioBackground = _dialog displayCtrl 14000;
		_radioBackground ctrlEnable true;
		_radioBackground ctrlShow true;
		_radioBackground ctrlCommit 0;
		
		_radioEmptyBackground = _dialog displayCtrl 14001;
		_radioEmptyBackground ctrlEnable false;
		_radioEmptyBackground ctrlShow false;
		_radioEmptyBackground ctrlCommit 0;
		
		_radioIcon = _dialog displayCtrl 14002;
		_radioIcon ctrlSetText "";
		_radioIcon ctrlEnable false;
		_radioIcon ctrlShow false;
		_radioIcon ctrlCommit 0;
	};
	if !((ExileClientPlayerLoadoutItems select 3) isEqualTo "") then
	{
		_compassBackground = _dialog displayCtrl 13000;
		_compassBackground ctrlEnable false;
		_compassBackground ctrlShow false;
		_compassBackground ctrlCommit 0;
		
		_compassEmptyBackground = _dialog displayCtrl 13001;
		_compassEmptyBackground ctrlEnable true;
		_compassEmptyBackground ctrlShow true;
		_compassEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutItems select 3) call ExileClient_util_gear_getConfigNameByClassName;
		
		_compassIcon = _dialog displayCtrl 13002;
		_compassIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutItems select 3) >> "picture"));
		_compassIcon ctrlEnable true;
		_compassIcon ctrlShow true;
		_compassIcon ctrlCommit 0;
	}
	else
	{
		_compassBackground = _dialog displayCtrl 13000;
		_compassBackground ctrlEnable true;
		_compassBackground ctrlShow true;
		_compassBackground ctrlCommit 0;
		
		_compassEmptyBackground = _dialog displayCtrl 13001;
		_compassEmptyBackground ctrlEnable false;
		_compassEmptyBackground ctrlShow false;
		_compassEmptyBackground ctrlCommit 0;
		
		_compassIcon = _dialog displayCtrl 13002;
		_compassIcon ctrlSetText "";
		_compassIcon ctrlEnable false;
		_compassIcon ctrlShow false;
		_compassIcon ctrlCommit 0;
	};
	if !((ExileClientPlayerLoadoutItems select 4) isEqualTo "") then
	{
		_watchBackground = _dialog displayCtrl 10000;
		_watchBackground ctrlEnable false;
		_watchBackground ctrlShow false;
		_watchBackground ctrlCommit 0;
		
		_watchEmptyBackground = _dialog displayCtrl 10001;
		_watchEmptyBackground ctrlEnable true;
		_watchEmptyBackground ctrlShow true;
		_watchEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutItems select 4) call ExileClient_util_gear_getConfigNameByClassName;
		
		_watchIcon = _dialog displayCtrl 10002;
		_watchIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutItems select 4) >> "picture"));
		_watchIcon ctrlEnable true;
		_watchIcon ctrlShow true;
		_watchIcon ctrlCommit 0;
	}
	else
	{
		_watchBackground = _dialog displayCtrl 10000;
		_watchBackground ctrlEnable true;
		_watchBackground ctrlShow true;
		_watchBackground ctrlCommit 0;
		
		_watchEmptyBackground = _dialog displayCtrl 10001;
		_watchEmptyBackground ctrlEnable false;
		_watchEmptyBackground ctrlShow false;
		_watchEmptyBackground ctrlCommit 0;
		
		_watchIcon = _dialog displayCtrl 10002;
		_watchIcon ctrlSetText "";
		_watchIcon ctrlEnable false;
		_watchIcon ctrlShow false;
		_watchIcon ctrlCommit 0;
	};
	if !((ExileClientPlayerLoadoutItems select 5) isEqualTo "") then
	{
		_nvgBackground = _dialog displayCtrl 5500;
		_nvgBackground ctrlEnable false;
		_nvgBackground ctrlShow false;
		_nvgBackground ctrlCommit 0;
		
		_nvgEmptyBackground = _dialog displayCtrl 5501;
		_nvgEmptyBackground ctrlEnable true;
		_nvgEmptyBackground ctrlShow true;
		_nvgEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutItems select 5) call ExileClient_util_gear_getConfigNameByClassName;
		
		_nvgIcon = _dialog displayCtrl 5502;
		_nvgIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutItems select 5) >> "picture"));
		_nvgIcon ctrlEnable true;
		_nvgIcon ctrlShow true;
		_nvgIcon ctrlCommit 0;
	}
	else
	{
		_nvgBackground = _dialog displayCtrl 5500;
		_nvgBackground ctrlEnable true;
		_nvgBackground ctrlShow true;
		_nvgBackground ctrlCommit 0;
		
		_nvgEmptyBackground = _dialog displayCtrl 5501;
		_nvgEmptyBackground ctrlEnable false;
		_nvgEmptyBackground ctrlShow false;
		_nvgEmptyBackground ctrlCommit 0;
		
		_nvgIcon = _dialog displayCtrl 5502;
		_nvgIcon ctrlSetText "";
		_nvgIcon ctrlEnable false;
		_nvgIcon ctrlShow false;
		_nvgIcon ctrlCommit 0;
	};
};

if (count ExileClientPlayerLoadoutBinocular > 0) then
{
	if !((ExileClientPlayerLoadoutBinocular select 0) isEqualTo "") then
	{
		_binocularBackground = _dialog displayCtrl 6000;
		_binocularBackground ctrlEnable false;
		_binocularBackground ctrlShow false;
		_binocularBackground ctrlCommit 0;
		
		_binocularEmptyBackground = _dialog displayCtrl 6001;
		_binocularEmptyBackground ctrlEnable true;
		_binocularEmptyBackground ctrlShow true;
		_binocularEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutBinocular select 0) call ExileClient_util_gear_getConfigNameByClassName;
		
		_binocularIcon = _dialog displayCtrl 6002;
		_binocularIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutBinocular select 0) >> "picture"));
		_binocularIcon ctrlEnable true;
		_binocularIcon ctrlShow true;
		_binocularIcon ctrlCommit 0;
	};
}
else
{
	_binocularBackground = _dialog displayCtrl 6000;
	_binocularBackground ctrlEnable true;
	_binocularBackground ctrlShow true;
	_binocularBackground ctrlCommit 0;
	
	_binocularEmptyBackground = _dialog displayCtrl 6001;
	_binocularEmptyBackground ctrlEnable false;
	_binocularEmptyBackground ctrlShow false;
	_binocularEmptyBackground ctrlCommit 0;
	
	_binocularIcon = _dialog displayCtrl 6002;
	_binocularIcon ctrlSetText "";
	_binocularIcon ctrlEnable false;
	_binocularIcon ctrlShow false;
	_binocularIcon ctrlCommit 0;
};

if (count ExileClientPlayerLoadoutUniform > 0) then
{
	if !((ExileClientPlayerLoadoutUniform select 0) isEqualTo "") then
	{
		_uniformBackground = _dialog displayCtrl 7000;
		_uniformBackground ctrlEnable false;
		_uniformBackground ctrlShow false;
		_uniformBackground ctrlCommit 0;
		
		_uniformEmptyBackground = _dialog displayCtrl 7001;
		_uniformEmptyBackground ctrlEnable true;
		_uniformEmptyBackground ctrlShow true;
		_uniformEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutUniform select 0) call ExileClient_util_gear_getConfigNameByClassName;
		
		_uniformIcon = _dialog displayCtrl 7002;
		_uniformIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutUniform select 0) >> "picture"));
		_uniformIcon ctrlEnable true;
		_uniformIcon ctrlShow true;
		_uniformIcon ctrlCommit 0;
	};
}
else
{
	_uniformBackground = _dialog displayCtrl 7000;
	_uniformBackground ctrlEnable true;
	_uniformBackground ctrlShow true;
	_uniformBackground ctrlCommit 0;
	
	_uniformEmptyBackground = _dialog displayCtrl 7001;
	_uniformEmptyBackground ctrlEnable false;
	_uniformEmptyBackground ctrlShow false;
	_uniformEmptyBackground ctrlCommit 0;
	
	_uniformIcon = _dialog displayCtrl 7002;
	_uniformIcon ctrlSetText "";
	_uniformIcon ctrlEnable false;
	_uniformIcon ctrlShow false;
	_uniformIcon ctrlCommit 0;
};

if (count ExileClientPlayerLoadoutVest > 0) then
{
	if !((ExileClientPlayerLoadoutVest select 0) isEqualTo "") then
	{
		_vestBackground = _dialog displayCtrl 8000;
		_vestBackground ctrlEnable false;
		_vestBackground ctrlShow false;
		_vestBackground ctrlCommit 0;
		
		_vestEmptyBackground = _dialog displayCtrl 8001;
		_vestEmptyBackground ctrlEnable true;
		_vestEmptyBackground ctrlShow true;
		_vestEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutVest select 0) call ExileClient_util_gear_getConfigNameByClassName;
		
		_vestIcon = _dialog displayCtrl 8002;
		_vestIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutVest select 0) >> "picture"));
		_vestIcon ctrlEnable true;
		_vestIcon ctrlShow true;
		_vestIcon ctrlCommit 0;
	};
}
else
{
	_vestBackground = _dialog displayCtrl 8000;
	_vestBackground ctrlEnable true;
	_vestBackground ctrlShow true;
	_vestBackground ctrlCommit 0;
	
	_vestEmptyBackground = _dialog displayCtrl 8001;
	_vestEmptyBackground ctrlEnable false;
	_vestEmptyBackground ctrlShow false;
	_vestEmptyBackground ctrlCommit 0;
	
	_vestIcon = _dialog displayCtrl 8002;
	_vestIcon ctrlSetText "";
	_vestIcon ctrlEnable false;
	_vestIcon ctrlShow false;
	_vestIcon ctrlCommit 0;
};

if (count ExileClientPlayerLoadoutBackpack > 0) then
{
	if !((ExileClientPlayerLoadoutBackpack select 0) isEqualTo "") then
	{
		_backpackBackground = _dialog displayCtrl 9000;
		_backpackBackground ctrlEnable false;
		_backpackBackground ctrlShow false;
		_backpackBackground ctrlCommit 0;
		
		_backpackEmptyBackground = _dialog displayCtrl 9001;
		_backpackEmptyBackground ctrlEnable true;
		_backpackEmptyBackground ctrlShow true;
		_backpackEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutBackpack select 0) call ExileClient_util_gear_getConfigNameByClassName;
		
		_backpackIcon = _dialog displayCtrl 9002;
		_backpackIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutBackpack select 0) >> "picture"));
		_backpackIcon ctrlEnable true;
		_backpackIcon ctrlShow true;
		_backpackIcon ctrlCommit 0;
	};
}
else
{
	_backpackBackground = _dialog displayCtrl 9000;
	_backpackBackground ctrlEnable true;
	_backpackBackground ctrlShow true;
	_backpackBackground ctrlCommit 0;
	
	_backpackEmptyBackground = _dialog displayCtrl 9001;
	_backpackEmptyBackground ctrlEnable false;
	_backpackEmptyBackground ctrlShow false;
	_backpackEmptyBackground ctrlCommit 0;
	
	_backpackIcon = _dialog displayCtrl 9002;
	_backpackIcon ctrlSetText "";
	_backpackIcon ctrlEnable false;
	_backpackIcon ctrlShow false;
	_backpackIcon ctrlCommit 0;
};

if (count ExileClientPlayerLoadoutPrimary > 0) then
{
	if !((ExileClientPlayerLoadoutPrimary select 0) isEqualTo "") then
	{
		_primaryBackground = _dialog displayCtrl 15000;
		_primaryBackground ctrlEnable false;
		_primaryBackground ctrlShow false;
		_primaryBackground ctrlCommit 0;
		
		_primaryEmptyBackground = _dialog displayCtrl 15001;
		_primaryEmptyBackground ctrlEnable true;
		_primaryEmptyBackground ctrlShow true;
		_primaryEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutPrimary select 0) call ExileClient_util_gear_getConfigNameByClassName;
		
		_primaryIcon = _dialog displayCtrl 15002;
		_primaryIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutPrimary select 0) >> "picture"));
		_primaryIcon ctrlEnable true;
		_primaryIcon ctrlShow true;
		_primaryIcon ctrlCommit 0;
	};
}
else
{
	_primaryBackground = _dialog displayCtrl 15000;
	_primaryBackground ctrlEnable true;
	_primaryBackground ctrlShow true;
	_primaryBackground ctrlCommit 0;
	
	_primaryEmptyBackground = _dialog displayCtrl 15001;
	_primaryEmptyBackground ctrlEnable false;
	_primaryEmptyBackground ctrlShow false;
	_primaryEmptyBackground ctrlCommit 0;
	
	_primaryIcon = _dialog displayCtrl 15002;
	_primaryIcon ctrlSetText "";
	_primaryIcon ctrlEnable false;
	_primaryIcon ctrlShow false;
	_primaryIcon ctrlCommit 0;
};

if (count ExileClientPlayerLoadoutSecondary > 0) then
{
	if !((ExileClientPlayerLoadoutSecondary select 0) isEqualTo "") then
	{
		_secondaryBackground = _dialog displayCtrl 16000;
		_secondaryBackground ctrlEnable false;
		_secondaryBackground ctrlShow false;
		_secondaryBackground ctrlCommit 0;
		
		_secondaryEmptyBackground = _dialog displayCtrl 16001;
		_secondaryEmptyBackground ctrlEnable true;
		_secondaryEmptyBackground ctrlShow true;
		_secondaryEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutSecondary select 0) call ExileClient_util_gear_getConfigNameByClassName;
		
		_secondaryIcon = _dialog displayCtrl 16002;
		_secondaryIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutSecondary select 0) >> "picture"));
		_secondaryIcon ctrlEnable true;
		_secondaryIcon ctrlShow true;
		_secondaryIcon ctrlCommit 0;
	};
}
else
{
	_secondaryBackground = _dialog displayCtrl 16000;
	_secondaryBackground ctrlEnable true;
	_secondaryBackground ctrlShow true;
	_secondaryBackground ctrlCommit 0;
	
	_secondaryEmptyBackground = _dialog displayCtrl 16001;
	_secondaryEmptyBackground ctrlEnable false;
	_secondaryEmptyBackground ctrlShow false;
	_secondaryEmptyBackground ctrlCommit 0;
	
	_secondaryIcon = _dialog displayCtrl 16002;
	_secondaryIcon ctrlSetText "";
	_secondaryIcon ctrlEnable false;
	_secondaryIcon ctrlShow false;
	_secondaryIcon ctrlCommit 0;
};

if (count ExileClientPlayerLoadoutPistol > 0) then
{
	if !((ExileClientPlayerLoadoutPistol select 0) isEqualTo "") then
	{
		_pistolBackground = _dialog displayCtrl 17000;
		_pistolBackground ctrlEnable false;
		_pistolBackground ctrlShow false;
		_pistolBackground ctrlCommit 0;
		
		_pistolEmptyBackground = _dialog displayCtrl 17001;
		_pistolEmptyBackground ctrlEnable true;
		_pistolEmptyBackground ctrlShow true;
		_pistolEmptyBackground ctrlCommit 0;
		
		_configName = (ExileClientPlayerLoadoutPistol select 0) call ExileClient_util_gear_getConfigNameByClassName;
		
		_pistolIcon = _dialog displayCtrl 17002;
		_pistolIcon ctrlSetText (getText(configFile >> _configName >> (ExileClientPlayerLoadoutPistol select 0) >> "picture"));
		_pistolIcon ctrlEnable true;
		_pistolIcon ctrlShow true;
		_pistolIcon ctrlCommit 0;
	};
}
else
{
	_pistolBackground = _dialog displayCtrl 17000;
	_pistolBackground ctrlEnable true;
	_pistolBackground ctrlShow true;
	_pistolBackground ctrlCommit 0;
	
	_pistolEmptyBackground = _dialog displayCtrl 17001;
	_pistolEmptyBackground ctrlEnable false;
	_pistolEmptyBackground ctrlShow false;
	_pistolEmptyBackground ctrlCommit 0;
	
	_pistolIcon = _dialog displayCtrl 17002;
	_pistolIcon ctrlSetText "";
	_pistolIcon ctrlEnable false;
	_pistolIcon ctrlShow false;
	_pistolIcon ctrlCommit 0;
};