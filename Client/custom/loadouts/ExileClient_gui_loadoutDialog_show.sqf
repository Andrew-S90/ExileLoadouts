 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */

private ["_dialog", "_message1", "_message2", "_inventoryApply", "_inventoryAdd", "_loadoutClear", "_loadoutBuy"];
disableSerialization;

createDialog "RscExileLoadoutDialog";
_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];

ExileClientPlayerLoadout = profileNamespace getVariable [format["ExileClientPlayerLoadout%1%2",ExileClientPlayerLoadoutServerName,ExileClientPlayerLoadoutNumber],[]];
ExileClientPlayerLoadout = ExileClientPlayerLoadout call ExileClient_gui_loadoutDialog_event_checkLoadout;
ExileClientPlayerLoadoutWarnings = profileNamespace getVariable ["ExileClientPlayerLoadoutWarnings",true];

ExileClientPlayerLoadoutPrimary = ExileClientPlayerLoadout select 0;
ExileClientPlayerLoadoutSecondary = ExileClientPlayerLoadout select 1;
ExileClientPlayerLoadoutPistol = ExileClientPlayerLoadout select 2;
ExileClientPlayerLoadoutUniform = ExileClientPlayerLoadout select 3;
ExileClientPlayerLoadoutVest = ExileClientPlayerLoadout select 4;
ExileClientPlayerLoadoutBackpack = ExileClientPlayerLoadout select 5;
ExileClientPlayerLoadoutHeadgear = ExileClientPlayerLoadout select 6;
ExileClientPlayerLoadoutFacewear = ExileClientPlayerLoadout select 7;
ExileClientPlayerLoadoutBinocular = ExileClientPlayerLoadout select 8;
ExileClientPlayerLoadoutItems = ExileClientPlayerLoadout select 9;
ExileClientPlayerLoadoutListBox = "Loadout";


_message1 = localize "STR_LOADOUT_Message1";
_message2 = localize "STR_LOADOUT_Message2";
["SuccessTitleAndText", ["Loadout", _message1]] call ExileClient_gui_toaster_addTemplateToast;
["SuccessTitleAndText", ["Loadout", _message2]] call ExileClient_gui_toaster_addTemplateToast;

_warningCheckbox = _dialog displayCtrl 2027;
_warningCheckbox cbSetChecked ExileClientPlayerLoadoutWarnings;

_inventoryApply = _dialog displayCtrl 2017;
_inventoryAdd = _dialog displayCtrl 2020;
_loadoutClear = _dialog displayCtrl 2019;
_loadoutBuy = _dialog displayCtrl 2015;

//_inventoryApply ctrlEnable false;
//_inventoryApply ctrlCommit 0;
_inventoryAdd ctrlEnable false;
_inventoryAdd ctrlCommit 0;
//_loadoutClear ctrlEnable false;
//_loadoutClear ctrlCommit 0;
_loadoutBuy ctrlEnable false;
_loadoutBuy ctrlCommit 0;

true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
true call ExileClient_gui_loadoutDialog_updateInventoryDropdown;
true call ExileClient_gui_loadoutDialog_updateLoadoutDropdown;
true call ExileClient_gui_loadoutDialog_updateLoadoutInterface;
true call ExileClient_gui_loadoutDialog_updatePriceInterface;
if(count ExileClientPlayerLoadoutUniform > 0) then
{
	[(((ExileClientPlayerLoadoutUniform select 0) call BIS_fnc_itemType) select 1),false] call ExileClient_gui_loadoutDialog_updateLoadoutListBox;
};
true call ExileClient_gui_loadoutDialog_updateInventoryListBox;
true