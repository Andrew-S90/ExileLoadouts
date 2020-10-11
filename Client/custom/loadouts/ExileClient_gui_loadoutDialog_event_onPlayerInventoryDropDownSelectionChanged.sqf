 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
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