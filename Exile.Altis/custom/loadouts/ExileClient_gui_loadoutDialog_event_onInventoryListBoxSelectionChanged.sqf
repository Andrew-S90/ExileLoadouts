/*
 * ExileClient_gui_safeXDialog_event_onListBoxSelectionChanged
 *
 * Rewards Client - Made by Andrew_S90
 *
 * Derived from ExileMod Code
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private ["_dialog", "_inventoryListBox", "_index", "_addButton", "_loadoutListBox", "_classname", "_canAddItem", "_result"];
disableSerialization;


_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];
_inventoryListBox = _dialog displayCtrl 2013;

_index = lbCurSel _inventoryListBox;
_addButton = _dialog displayCtrl 2020;
_loadoutListBox = _dialog displayCtrl 2010;
_loadoutListBox lbSetCurSel -1;

if (_index > -1) then
{
	_classname = _inventoryListBox lbData _index;
	
	_canAddItem = true;
	try 
	{
		_canAddItem = _classname call ExileClient_gui_loadoutDialog_canAddLoadoutItem;
	}
	catch
	{
		_result = _exception;
		_canAddItem = false;
	};
	if (_canAddItem) then 
	{
		_addButton ctrlEnable true;
	}
	else 
	{
		_addButton ctrlEnable false;
	};
}
else 
{
	_addButton ctrlEnable false;
};
true