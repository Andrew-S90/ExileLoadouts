 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
 
private ["_dialog", "_inventoryDropdown", "_index", "_nearVehicles"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];
_inventoryDropdown = _dialog displayCtrl 2016;
lbClear _inventoryDropdown;
_index = _inventoryDropdown lbAdd (localize "STR_LOADOUT_Equipment");
_inventoryDropdown lbSetValue [_index, 1];
_inventoryDropdown lbSetCurSel 0;
if !((uniform player) isEqualTo "") then
{
	_index = _inventoryDropdown lbAdd (localize "STR_LOADOUT_Uniform");
	_inventoryDropdown lbSetValue [_index, 2];
};
if !((vest player) isEqualTo "") then
{
	_index = _inventoryDropdown lbAdd (localize "STR_LOADOUT_Vest");
	_inventoryDropdown lbSetValue [_index, 3];
};
if !((backpack player) isEqualTo "") then
{
	_index = _inventoryDropdown lbAdd (localize "STR_LOADOUT_Backpack");
	_inventoryDropdown lbSetValue [_index, 4];
};
_nearVehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], 80];
{
	if (local _x) then
	{
		if (alive _x) then
		{
			_index = _inventoryDropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
			_inventoryDropdown lbSetData [_index, netId _x];
			_inventoryDropdown lbSetValue [_index, 5];
		};
	};
}
forEach _nearVehicles;
true