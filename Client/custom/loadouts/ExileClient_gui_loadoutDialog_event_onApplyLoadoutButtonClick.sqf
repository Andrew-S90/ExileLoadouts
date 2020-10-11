 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
 
private ["_dialog", "_inventoryListBox", "_loadoutListBox", "_addButton", "_type", "_inventoryDropdown", "_dropdownIndex", "_tradeContainerType", "_index", "_itemClassName", "_canAddItem", "_itemType", "_result", "_loadout", "_weapon", "_weapons", "_tradeVehicleNetID", "_tradeVehicleObject", "_items", "_ok", "_count", "_compatable", "_found"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];

_result = [localize "STR_LOADOUT_ApplyLoadout", "Loadout", "Yes", "No"] call BIS_fnc_guiMessage;
waitUntil { !isNil "_result" };
if (_result) then
{
	ExileClientPlayerLoadout = getUnitLoadout player;

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
	
	[] call ExileClient_gui_loadoutDialog_event_save;
	true call ExileClient_gui_loadoutDialog_updateInventoryDropdown;
	true call ExileClient_gui_loadoutDialog_updateLoadoutInterface;
	true call ExileClient_gui_loadoutDialog_updatePriceInterface;
	if(count ExileClientPlayerLoadoutUniform > 0) then
	{
		[(((ExileClientPlayerLoadoutUniform select 0) call BIS_fnc_itemType) select 1),false] call ExileClient_gui_loadoutDialog_updateLoadoutListBox;
	};
	true call ExileClient_gui_loadoutDialog_updateInventoryListBox;
	["SuccessTitleAndText", ["Loadout", "New Loadout Applied!"]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{

};
