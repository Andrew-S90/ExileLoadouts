 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */

private ["_canAddItem", "_itemClassName", "_cargoItems", "_itemType", "_cargoMass", "_cargoCapacity", "_itemMass", "_item", "_compatable", "_found"];
_canAddItem = true;
_itemClassName = _this;
if (_itemClassName isEqualTo "blocked") then
{
	_canAddItem = false;
}
else
{
	_cargoItems = ["Uniform","Vest","Backpack"];
	_itemType = _itemClassName call BIS_fnc_itemType;
	if ((_itemType select 1) in _cargoItems) then
	{
		switch (_itemType select 1) do
		{
			case "Uniform":
			{
				if !(count ExileClientPlayerLoadoutUniform isEqualTo 0) then
				{
					_canAddItem = false;
					systemchat format["Remove Uniform to add a new one!"];
				};
			};
			case "Vest":
			{
				if !(count ExileClientPlayerLoadoutVest isEqualTo 0) then
				{
					_canAddItem = false;
					systemchat format["Remove Vest to add a new one!"];
				};
			};
			case "Backpack":
			{
				if !(count ExileClientPlayerLoadoutBackpack isEqualTo 0) then
				{
					_canAddItem = false;
					systemchat format["Remove Backpack to add a new one!"];
				};
			};
			default 
			{
				_canAddItem = false;
			};
		};
	}
	else
	{
		switch (ExileClientPlayerLoadoutListBox) do
		{
			case "Loadout":
			{
				_cargoItems = ["Uniform","Vest","Backpack","Headgear","Binocular","Compass","GPS","Radio","Watch","NVGoggles","Map","Glasses","AssaultRifle","GrenadeLauncher","Handgun","Launcher","MachineGun","MissileLauncher","RocketLauncher","Shotgun","Rifle","SubmachineGun","SniperRifle"];
				_itemType = _itemClassName call BIS_fnc_itemType;
				if !((_itemType select 1) in _cargoItems) then
				{
					_canAddItem = false;
				};
			};
			case "Uniform":
			{
				if !(count ExileClientPlayerLoadoutUniform isEqualTo 0) then
				{
					if !((count (ExileClientPlayerLoadoutUniform select 1)) isEqualTo 0) then
					{
						_cargoMass = 0;
						_cargoCapacity = (ExileClientPlayerLoadoutUniform select 0) call ExileClient_gui_loadoutDialog_getItemCapacity;
						_itemMass = _itemClassName call ExileClient_gui_loadoutDialog_getItemMass;
						{
							_item = (_x select 0);
							if(typeName _item isEqualTo "ARRAY") then
							{
								_item = _item select 0;
							};
							_cargoMass = _cargoMass + ((_item call ExileClient_gui_loadoutDialog_getItemMass)*(_x select 1));
						} forEach (ExileClientPlayerLoadoutUniform select 1);
						if !((_cargoMass + _itemMass) <= _cargoCapacity) then
						{
							_canAddItem = false;
						};
					};
				}
				else
				{
					_canAddItem = false;
				};
			};
			case "Vest":
			{
				if !(count ExileClientPlayerLoadoutVest isEqualTo 0) then
				{
					if !((count (ExileClientPlayerLoadoutVest select 1)) isEqualTo 0) then
					{
						_cargoMass = 0;
						_cargoCapacity = (ExileClientPlayerLoadoutVest select 0) call ExileClient_gui_loadoutDialog_getItemCapacity;
						_itemMass = _itemClassName call ExileClient_gui_loadoutDialog_getItemMass;
						{
							_item = (_x select 0);
							if(typeName _item isEqualTo "ARRAY") then
							{
								_item = _item select 0;
							};
							_cargoMass = _cargoMass + ((_item call ExileClient_gui_loadoutDialog_getItemMass)*(_x select 1));
						} forEach (ExileClientPlayerLoadoutVest select 1);
						if !((_cargoMass + _itemMass) <= _cargoCapacity) then
						{
							_canAddItem = false;
						};
					};
				}
				else
				{
					_canAddItem = false;
				};
			};
			case "Backpack":
			{
				if !(count ExileClientPlayerLoadoutBackpack isEqualTo 0) then
				{
					if !((count (ExileClientPlayerLoadoutBackpack select 1)) isEqualTo 0) then
					{
						_cargoMass = 0;
						_cargoCapacity = (ExileClientPlayerLoadoutBackpack select 0) call ExileClient_gui_loadoutDialog_getItemCapacity;
						_itemMass = _itemClassName call ExileClient_gui_loadoutDialog_getItemMass;
						{
							_item = (_x select 0);
							if(typeName _item isEqualTo "ARRAY") then
							{
								_item = _item select 0;
							};
							_cargoMass = _cargoMass + ((_item call ExileClient_gui_loadoutDialog_getItemMass)*(_x select 1));
						} forEach (ExileClientPlayerLoadoutBackpack select 1);
						if !((_cargoMass + _itemMass) <= _cargoCapacity) then
						{
							_canAddItem = false;
						};
					};
				}
				else
				{
					_canAddItem = false;
				};
			};
			case "Primary":
			{
				if !((count (ExileClientPlayerLoadoutPrimary)) isEqualTo 0) then
				{
					_compatable = (ExileClientPlayerLoadoutPrimary select 0) call BIS_fnc_compatibleItems;
					_found = false;
					if !({_x == _itemClassName} count (_compatable) > 0) then
					{
						_canAddItem = false;
					};
				}
				else
				{
					_canAddItem = false;
				};
			};
			case "Secondary":
			{
				if !((count (ExileClientPlayerLoadoutSecondary select 1)) isEqualTo 0) then
				{
					_compatable = (ExileClientPlayerLoadoutPrimary select 0) call BIS_fnc_compatibleItems;
					if !({_x == _itemClassName} count (_compatable) > 0) then
					{
						_canAddItem = false;
					};
				}
				else
				{
					_canAddItem = false;
				};
			};
			case "Pistol":
			{
				if !((count (ExileClientPlayerLoadoutPistol select 1)) isEqualTo 0) then
				{
					_compatable = (ExileClientPlayerLoadoutPrimary select 0) call BIS_fnc_compatibleItems;
					if !({_x == _itemClassName} count (_compatable) > 0) then
					{
						_canAddItem = false;
					};
				}
				else
				{
					_canAddItem = false;
				};
			};
			default 
			{
				_canAddItem = false;
			};
		};
	};
};
_canAddItem