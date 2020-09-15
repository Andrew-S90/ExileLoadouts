/**
 * ExileClient_gui_traderDialog_updateInventoryDropdown
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private ["_dialog", "_inventoryDropdown", "_index", "_nearVehicles"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];
_loadoutDropdown = _dialog displayCtrl 2028;
lbClear _loadoutDropdown;


for "_i" from 1 to ExileClientPlayerLoadoutMax do 
{ 
	_index = _loadoutDropdown lbAdd str _i;
	_loadoutDropdown lbSetValue [_index, _i];
};
_loadoutDropdown lbSetCurSel 0;
true