 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
 
private ["_dialog", "_result", "_buyButton", "_addButton", "_applyButton", "_clearButton", "_currentLoadout", "_purchaseLoadout"];
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
