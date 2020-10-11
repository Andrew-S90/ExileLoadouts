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

_buyButton = _dialog displayCtrl 2015;
_buyButton ctrlEnable false;
_buyButton ctrlCommit 0;

_loadoutNumber = [ExileClientPlayerLoadout,false] call ExileClient_gui_LoadoutDialog_calculateLoadoutPrice;
_gearNumber = [(getUnitLoadout player),true] call ExileClient_gui_LoadoutDialog_calculateLoadoutPrice;
_totalNumber = 0;

_loadoutPrice = _dialog displayCtrl 2022;
_loadoutPrice ctrlSetText str (_loadoutNumber);
_loadoutPrice ctrlSetTooltip format["%1: %2",(localize "STR_LOADOUT_PriceToolTip"),_loadoutNumber call ExileClient_util_addCommas];
_loadoutPrice ctrlCommit 0;

if (_loadoutNumber >= _gearNumber) then
{
	_totalNumber = _loadoutNumber - _gearNumber;
	_gearPrice = _dialog displayCtrl 2024;
	_gearPrice ctrlSetText format["-%1",(_gearNumber)];
	_gearPrice ctrlSetTooltip format["%1: %2",(localize "STR_LOADOUT_GearToolTip"),_gearNumber call ExileClient_util_addCommas];
	_gearPrice ctrlCommit 0;
	
	_totalPrice = _dialog displayCtrl 2026;
	_totalPrice ctrlSetText str (_totalNumber);
	_totalPrice ctrlSetTextColor [1,1,1,1];
	_totalPrice ctrlSetTooltip format["%1: %2",(localize "STR_LOADOUT_TotalToolTip"),_totalNumber call ExileClient_util_addCommas];
	_totalPrice ctrlCommit 0;
	
	if((player getVariable ["ExileMoney", 0]) >= _totalNumber) then
	{
		_buyButton ctrlEnable true;	
		_buyButton ctrlCommit 0;
	};
}
else
{
	_totalNumber = _gearNumber - _loadoutNumber;
	_gearPrice = _dialog displayCtrl 2024;
	_gearPrice ctrlSetText format["%1",(_gearNumber)];
	_gearPrice ctrlSetTooltip format["%1: %2",(localize "STR_LOADOUT_GearToolTip"),_gearNumber call ExileClient_util_addCommas];
	_gearPrice ctrlCommit 0;
	
	_totalPrice = _dialog displayCtrl 2026;
	_totalPrice ctrlSetText format["+%1",(_totalNumber)];
	_totalPrice ctrlSetTextColor [0,1,0,1];
	_totalPrice ctrlSetTooltip format["%1: +%2",(localize "STR_LOADOUT_TotalToolTip"),_totalNumber call ExileClient_util_addCommas];
	_totalPrice ctrlCommit 0;
	
	_buyButton ctrlEnable true;	
	_buyButton ctrlCommit 0;
};
