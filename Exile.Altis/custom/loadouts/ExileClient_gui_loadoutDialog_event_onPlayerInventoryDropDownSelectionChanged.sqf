/**
 * ExileClient_gui_traderDialog_event_onPlayerInventoryDropDownSelectionChanged
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private ["_listBox", "_index", "_dialog", "_loadoutListBox", "_inventoryListBox"];
disableSerialization;
_listBox = _this select 0;
_index = _this select 1;
_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];
_loadoutListBox = _dialog displayCtrl 2010;
_loadoutListBox lbSetCurSel -1;
_inventoryListBox = _dialog displayCtrl 2013;
_inventoryListBox lbSetCurSel -1;
call ExileClient_gui_loadoutDialog_updateInventoryListBox;
true