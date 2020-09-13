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
 
private ["_dialog", "_loadoutListBox", "_base", "_index", "_loadoutArray", "_clear"];

disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];

_close = false;
if (ExileClientPlayerLoadoutWarnings) then
{
	_result = [localize "STR_LOADOUT_RemoveItemLoadout", "Loadout", "Yes", "No"] call BIS_fnc_guiMessage;
	waitUntil { !isNil "_result" };
	if(_result) then
	{
		_close = true;
	};
}
else
{
	_close = true;
};

if (_close) then
{
	_loadoutListBox = _dialog displayCtrl 2010;
	_base = _this select 0;
	_index = _this select 1;
	_loadoutArray = missionNamespace getVariable [_base,[]];
	_clear = false;


	if(_index isEqualTo -1) then
	{
		_clear = true;
	};

	if (_clear) then
	{
		if (typeName _loadoutArray isEqualTo "ARRAY") then
		{
			missionNamespace setVariable [_base,[]];
		}
		else
		{
			missionNamespace setVariable [_base,""];
		};
	}
	else
	{
		switch (typeName (_loadoutArray select _index)) do 
		{
			case "ARRAY": 
			{ 
				_loadoutArray set [_index,[]];
				missionNamespace setVariable [_base,_loadoutArray]; 
			};
			case "STRING": 
			{ 
				_loadoutArray set [_index,""];
				missionNamespace setVariable [_base,_loadoutArray]; 
			};
			default {};
		};
	};
	lbClear _loadoutListBox;
	[ExileClientPlayerLoadoutListBox,true] call ExileClient_gui_loadoutDialog_updateLoadoutListBox;
	ExileClientPlayerLoadoutListBox = "Loadout";
	true call ExileClient_gui_loadoutDialog_updateLoadoutInterface;
	["ErrorTitleAndText", ["Loadout",  "Item Removed!"]] call ExileClient_gui_toaster_addTemplateToast;
	[] call ExileClient_gui_loadoutDialog_event_save;
};

true call ExileClient_gui_loadoutDialog_updatePriceInterface;