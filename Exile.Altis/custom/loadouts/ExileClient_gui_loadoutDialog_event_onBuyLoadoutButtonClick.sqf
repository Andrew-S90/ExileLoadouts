/*
 * ExileClient_gui_safeXDialog_updateListBox
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
 
private ["_dialog", "_inventoryListBox", "_loadoutListBox", "_addButton", "_type", "_inventoryDropdown", "_dropdownIndex", "_tradeContainerType", "_index", "_itemClassName", "_canAddItem", "_itemType", "_result", "_loadout", "_weapon", "_weapons", "_tradeVehicleNetID", "_tradeVehicleObject", "_items", "_ok", "_count", "_compatable", "_found"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];

_result = false;
if (ExileClientPlayerLoadoutWarnings) then
{
	_result = ["Buy?", "Loadout", "Yes", "No"] call BIS_fnc_guiMessage;
	waitUntil { !isNil "_result" };
}
else
{
	_result = true;
};

if (_result) then
{
	_buyButton = _dialog displayCtrl 2015;
	_buyButton ctrlEnable false;
	_buyButton ctrlCommit 0;
	
	_addButton = _dialog displayCtrl 2020;
	_addButton ctrlEnable false;
	_addButton ctrlCommit 0;
	
	_applyButton = _dialog displayCtrl 2017;
	_applyButton ctrlEnable false;
	_applyButton ctrlCommit 0;

	_clearButton = _dialog displayCtrl 2019;
	_clearButton ctrlEnable false;
	_clearButton ctrlCommit 0;
	
	if !(ExileClientIsWaitingForServerTradeResponse) then
	{
		ExileClientPlayerLoadoutListBox = "Loadout";
		_currentLoadout = getUnitLoadout player;
		_purchaseLoadout = ExileClientPlayerLoadout;
		player setUnitLoadout (configFile >> "EmptyLoadout");
		ExileClientIsWaitingForServerTradeResponse = true;
		["purchaseLoadoutRequest", [_purchaseLoadout,_currentLoadout]] call ExileClient_system_network_send;
	};
};
