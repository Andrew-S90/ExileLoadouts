 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */

private ["_itemClassName", "_itemType", "_capacity", "_containerClass"];

_itemClassName = _this;
_itemType = _itemClassName call BIS_fnc_itemType;
_capacity = 0;
switch (_itemType select 0) do
{
	case "Equipment": 
	{
		switch (_itemType select 1) do
		{
			case "Vest":
			{
				_containerClass = getText(configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "containerClass");
				_capacity = getNumber(configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
			};
			case "Backpack":
			{
				_capacity = getNumber(configFile >> "CfgVehicles" >> _itemClassName >> "maximumLoad");
			};
			case "Uniform":
			{
				_containerClass = getText(configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "containerClass");
				_capacity = getNumber(configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
			};
		};
	};
};
_capacity