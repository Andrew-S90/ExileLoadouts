 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
 
private ["_itemClassName", "_itemType", "_mass"];

_itemClassName = _this;
_itemType = _itemClassName call BIS_fnc_itemType;
_mass = 0; 
switch (_itemType select 0) do
{
	case "Equipment": 
	{
		switch (_itemType select 1) do
		{
			case "Headgear": 
			{
				_mass = getNumber(configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "mass");
			};
			case "Vest":
			{
				_mass = getNumber(configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "mass");
			};
			case "Backpack":
			{
				_mass = getNumber(configFile >> "CfgVehicles" >> _itemClassName >> "mass");
			};
			case "Uniform":
			{
				_mass = getNumber(configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "mass");
			};
		};
	};
	case "Mine": 
	{
		_mass = getNumber(configFile >> "CfgMagazines" >> _itemClassName >> "mass");
	};
	case "Item":
	{
		_mass = getNumber(configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "mass");
	};
	case "Magazine":
	{
		_mass = getNumber(configFile >> "CfgMagazines" >> _itemClassName >> "mass");
	};
	case "Weapon":
	{
		_mass = getNumber(configFile >> "CfgWeapons" >> _itemClassName >> "WeaponSlotsInfo" >> "mass");
	};
};

_mass