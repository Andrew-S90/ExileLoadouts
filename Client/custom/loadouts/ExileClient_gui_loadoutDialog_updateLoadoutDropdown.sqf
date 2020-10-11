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
_loadoutDropdown = _dialog displayCtrl 2028;
lbClear _loadoutDropdown;


for "_i" from 1 to ExileClientPlayerLoadoutMax do 
{ 
	_index = _loadoutDropdown lbAdd str _i;
	_loadoutDropdown lbSetValue [_index, _i];
};
_loadoutDropdown lbSetCurSel 0;
true