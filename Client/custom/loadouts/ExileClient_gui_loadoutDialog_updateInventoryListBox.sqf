 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
 
private ["_dialog", "_inventoryDropdown", "_dropdownIndex", "_tradeContainerType", "_tradeVehicleObject", "_inventoryListBox", "_items", "_tradeVehicleNetID", "_itemClassName", "_indexEntryIndex", "_add", "_blocked", "_configName", "_qualityColor", "_popTabColor", "_imageColor"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];
_inventoryDropdown = _dialog displayCtrl 2016;
_dropdownIndex = lbCurSel _inventoryDropdown;
_tradeContainerType = _inventoryDropdown lbValue _dropdownIndex;
_tradeVehicleObject = objNull;
_inventoryListBox = _dialog displayCtrl 2013;
_inventoryListBox lbSetCurSel -1;
lbClear _inventoryListBox;
_items = [];
switch (_tradeContainerType) do
{
	case 1: 
	{
		_items = [player, true] call ExileClient_util_playerEquipment_list;
	};
	case 2:
	{
		_items = (uniformContainer player) call ExileClient_gui_loadoutDialog_containerCargo_list;
	};
	case 3: 
	{
		_items = (vestContainer player) call ExileClient_gui_loadoutDialog_containerCargo_list;
	};
	case 4:
	{
		_items = (backpackContainer player) call ExileClient_gui_loadoutDialog_containerCargo_list;
	};
	default 
	{
		_tradeVehicleNetID = _inventoryDropdown lbData _dropdownIndex;
		_tradeVehicleObject = objectFromNetId _tradeVehicleNetID;
		_items = _tradeVehicleObject call ExileClient_gui_loadoutDialog_containerCargo_list;
	};
};

{
	_itemClassName = _x;
	_indexEntryIndex = 1;
	_add = true;
	_blocked = false;
	
	if ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0) then
	{
		_blocked = true;
	};
	
	if !(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) then
	{
		_blocked = true;
	};
	
	_configName = _itemClassName call ExileClient_util_gear_getConfigNameByClassName;
	_indexEntryIndex = _inventoryListBox lbAdd getText(configFile >> _configName >> _itemClassName >> "displayName");
	_inventoryListBox lbSetPicture [_indexEntryIndex, getText(configFile >> _configName >> _itemClassName >> "picture")];
	
	_qualityColor = [1, 1, 1, 1];
	_popTabColor = [1, 1, 1, 1];
	_imageColor = [1, 1, 1, 1];
	
	_inventoryListBox lbSetData [_indexEntryIndex, _itemClassName];
	_inventoryListBox lbSetColor [_indexEntryIndex, _qualityColor];
	
	_inventoryListBox lbSetPictureColor [_indexEntryIndex, _imageColor];
	_inventoryListBox lbSetColorRight [_indexEntryIndex, _popTabColor];
	_inventoryListBox lbSetPictureRightColor [_indexEntryIndex, _popTabColor];
	
	if(_blocked) then
	{
		_inventoryListBox lbSetColorRight [_indexEntryIndex, [1,0,0,1]];
		_inventoryListBox lbSetColor [_indexEntryIndex, [1,0,0,1]];
		_inventoryListBox lbSetTextRight [_indexEntryIndex, "(Blacklisted)"];
		_inventoryListBox lbSetData [_indexEntryIndex, "blocked"];
	};

} forEach _items;
true