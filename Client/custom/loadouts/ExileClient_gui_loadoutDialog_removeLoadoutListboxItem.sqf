 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
 
private ["_dialog", "_listBox", "_control", "_index", "_type", "_base", "_loadoutArray", "_itemClassName", "_item", "_i", "_num", "_array", "_loadoutListBox"];
params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
disableSerialization;

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
	_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];
	_listBox = _control;
	_index = lbCurSel _listBox;
	_type = ExileClientPlayerLoadoutListBox;
	_base = format["%1%2",format["ExileClientPlayerLoadout%1%2",ExileClientPlayerLoadoutServerName,ExileClientPlayerLoadoutNumber],_type];


	_loadoutArray = missionNamespace getVariable [_base,[]];

	if (_index > -1) then
	{
		_itemClassName = _listBox lbData _index;
		
		switch (_type) do 
		{
			case "Uniform": 
			{ 
				for "_i" from 0 to ((count (_loadoutArray select 1))-1) do 
				{ 
					_item =(((_loadoutArray select 1) select _i) select 0);
					if ((typeName _item) isEqualTo "ARRAY") then
					{
						_item = _item select 0;
					};
					if(_item isEqualTo _itemClassName) then
					{
						if ((((_loadoutArray select 1) select _i) select 1) > 1) then
						{
							_num = (((_loadoutArray select 1) select _i) select 1)-1;
							((_loadoutArray select 1) select _i) set [1,_num];
						}
						else
						{
							(_loadoutArray select 1) deleteAt _i;
						};
					};
				};
				missionNamespace setVariable [_base,_loadoutArray]; 
			};
			case "Vest": 
			{ 
				for "_i" from 0 to ((count (_loadoutArray select 1))-1) do 
				{ 
					_item = (((_loadoutArray select 1) select _i) select 0);
					if ((typeName _item) isEqualTo "ARRAY") then
					{
						_item = _item select 0;
					};
					if(_item isEqualTo _itemClassName) then
					{
						if ((((_loadoutArray select 1) select _i) select 1) > 1) then
						{
							_num = (((_loadoutArray select 1) select _i) select 1)-1;
							((_loadoutArray select 1) select _i) set [1,_num];
						}
						else
						{
							(_loadoutArray select 1) deleteAt _i;
						};
					};
				};
				missionNamespace setVariable [_base,_loadoutArray];
			};
			case "Backpack": 
			{ 
				for "_i" from 0 to ((count (_loadoutArray select 1))-1) do 
				{ 
					_item = (((_loadoutArray select 1) select _i) select 0);
					if ((typeName _item) isEqualTo "ARRAY") then
					{
						_item = _item select 0;
					};
					if(_item isEqualTo _itemClassName) then
					{
						if ((((_loadoutArray select 1) select _i) select 1) > 1) then
						{
							_num = (((_loadoutArray select 1) select _i) select 1)-1;
							((_loadoutArray select 1) select _i) set [1,_num];
						}
						else
						{
							(_loadoutArray select 1) deleteAt _i;
						};
					};
				};
				missionNamespace setVariable [_base,_loadoutArray];
			};
			case "Primary": 
			{ 
				for "_i" from 0 to ((count _loadoutArray)-1) do 
				{ 
					_item = (_loadoutArray select _i);
					
					_array = false;
					if ((typeName _item) isEqualTo "ARRAY") then
					{
						_array = true;
						_item = _item select 0;
					};
					
					if(_item isEqualTo _itemClassName) then
					{
						if (_array) then
						{
							_loadoutArray set [_i,[]];
						}
						else
						{
							_loadoutArray set [_i,""];
						};
					};
				};
				missionNamespace setVariable [_base,_loadoutArray];
			};
			case "Secondary": 
			{ 
				for "_i" from 0 to ((count _loadoutArray)-1) do 
				{ 
					_item = (_loadoutArray select _i);
					_array = false;
					if ((typeName _item) isEqualTo "ARRAY") then
					{
						_array = true;
						_item = _item select 0;
					};
					
					if(_item isEqualTo _itemClassName) then
					{
						if (_array) then
						{
							_loadoutArray set [_i,[]];
						}
						else
						{
							_loadoutArray set [_i,""];
						};
					};
				};
				missionNamespace setVariable [_base,_loadoutArray];
			};
			case "Pistol": 
			{ 
				for "_i" from 0 to ((count _loadoutArray)-1) do 
				{ 
					_item = (_loadoutArray select _i);
					_array = false;
					if ((typeName _item) isEqualTo "ARRAY") then
					{
						_array = true;
						_item = _item select 0;
					};
					
					if(_item isEqualTo _itemClassName) then
					{
						if (_array) then
						{
							_loadoutArray set [_i,[]];
						}
						else
						{
							_loadoutArray set [_i,""];
						};
					};
				};
				missionNamespace setVariable [_base,_loadoutArray];
			};
			default {};
		};
	}
	else 
	{
		systemchat "Error in removing item.";
	};

	lbClear _listBox;
	[_type,false] call ExileClient_gui_loadoutDialog_updateLoadoutListBox;
	true call ExileClient_gui_loadoutDialog_updateLoadoutInterface;
	["ErrorTitleAndText", ["Loadout",  "Item Removed!"]] call ExileClient_gui_toaster_addTemplateToast;
	[] call ExileClient_gui_loadoutDialog_event_save;
	true call ExileClient_gui_loadoutDialog_updatePriceInterface;
};