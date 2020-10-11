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

_inventoryListBox = _dialog displayCtrl 2013;
_loadoutListBox = _dialog displayCtrl 2010;
_addButton = _dialog displayCtrl 2020;
_type = ExileClientPlayerLoadoutListBox;
_inventoryDropdown = _dialog displayCtrl 2016;
_dropdownIndex = lbCurSel _inventoryDropdown;
_tradeContainerType = _inventoryDropdown lbValue _dropdownIndex;
_index = lbCurSel _inventoryListBox;

if (_index > -1) then
{
	_itemClassName = _inventoryListBox lbData _index;
	_canAddItem = false;
	_canAddItem = _itemClassName call ExileClient_gui_loadoutDialog_canAddLoadoutItem;
	if(_canAddItem) then
	{
		switch (_type) do
		{
			case "Loadout":
			{
				_itemType = _itemClassName call BIS_fnc_itemType;
				
				switch (_itemType select 1) do
				{
					case "Uniform":
					{
						_result = [localize "STR_LOADOUT_AddUniformLoadout", "Loadout Uniform", "Yes", "No"] call BIS_fnc_guiMessage;
						waitUntil { !isNil "_result" };
						if (_result) then
						{
							_loadout = getUnitLoadout player;
							ExileClientPlayerLoadoutUniform = _loadout select 3;
						}
						else
						{
							ExileClientPlayerLoadoutUniform = [_itemClassName,[]];
						};
					};
					case "Vest":
					{
						_result = [localize "STR_LOADOUT_AddVestLoadout", "Loadout Vest", "Yes", "No"] call BIS_fnc_guiMessage;
						waitUntil { !isNil "_result" };
						if (_result) then
						{
							_loadout = getUnitLoadout player;
							ExileClientPlayerLoadoutVest = _loadout select 4;
						}
						else
						{
							ExileClientPlayerLoadoutVest = [_itemClassName,[]];
						};
					};
					case "Backpack":
					{
						_result = [localize "STR_LOADOUT_AddBackpackLoadout", "Loadout Backpack", "Yes", "No"] call BIS_fnc_guiMessage;
						waitUntil { !isNil "_result" };
						if (_result) then
						{
							_loadout = getUnitLoadout player;
							ExileClientPlayerLoadoutBackpack = _loadout select 5;
						}
						else
						{
							ExileClientPlayerLoadoutBackpack = [_itemClassName,[]];
						};
					};
					case "Headgear":
					{
						ExileClientPlayerLoadoutHeadgear = _itemClassName;
					};
					case "Glasses":
					{
						ExileClientPlayerLoadoutFacewear = _itemClassName;
					};
					case "Map":
					{
						ExileClientPlayerLoadoutItems set [0,_itemClassName];
					};
					case "GPS":
					{
						ExileClientPlayerLoadoutItems set [1,_itemClassName];
					};
					case "Radio": 
					{
						ExileClientPlayerLoadoutItems set [2,_itemClassName];
					};
					case "Compass": 
					{
						ExileClientPlayerLoadoutItems set [3,_itemClassName];
					};
					case "Watch": 
					{
						ExileClientPlayerLoadoutItems set [4,_itemClassName];
					};
					case "NVGoggles": 
					{
						ExileClientPlayerLoadoutItems set [5,_itemClassName];
					};
					case "Binocular": 
					{
						_loadout = getUnitLoadout player;
						ExileClientPlayerLoadoutBinocular = _loadout select 8;
					};
					case "SniperRifle";
					case "SubmachineGun";
					case "Rifle";
					case "Shotgun";
					case "MachineGun";
					case "AssaultRifle": 
					{
						_result = [localize "STR_LOADOUT_AddWeaponLoadout", "Loadout Weapon", "Yes", "No"] call BIS_fnc_guiMessage;
						waitUntil { !isNil "_result" };
						_weapon = [];
						if (_result) then
						{
							switch (_tradeContainerType) do
							{
								case 1: 
								{
									_loadout = getUnitLoadout player;
									_weapon = _loadout select 0;
								};
								case 2:
								{
									_weapons = (weaponsItemsCargo (uniformContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								case 3: 
								{
									_weapons = (weaponsItemsCargo (vestContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								case 4:
								{
									_weapons = (weaponsItemsCargo (backpackContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								default 
								{
									_tradeVehicleNetID = _inventoryDropdown lbData _dropdownIndex;
									_tradeVehicleObject = objectFromNetId _tradeVehicleNetID;
									_weapons = (weaponsItemsCargo _tradeVehicleObject);
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
							};
						}
						else
						{
							_weapon = [_itemClassName,"","","",[],[],""];
						};
						ExileClientPlayerLoadoutPrimary = _weapon;
					};
					case "GrenadeLauncher";
					case "Launcher";
					case "RocketLauncher";
					case "MissileLauncher": 
					{
						_result = [localize "STR_LOADOUT_AddWeaponLoadout", "Loadout Weapon", "Yes", "No"] call BIS_fnc_guiMessage;
						waitUntil { !isNil "_result" };
						_weapon = [];
						if (_result) then
						{
							switch (_tradeContainerType) do
							{
								case 1: 
								{
									_loadout = getUnitLoadout player;
									_weapon = _loadout select 1;
								};
								case 2:
								{
									_weapons = (weaponsItemsCargo (uniformContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								case 3: 
								{
									_weapons = (weaponsItemsCargo (vestContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								case 4:
								{
									_weapons = (weaponsItemsCargo (backpackContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								default 
								{
									_tradeVehicleNetID = _inventoryDropdown lbData _dropdownIndex;
									_tradeVehicleObject = objectFromNetId _tradeVehicleNetID;
									_weapons = (weaponsItemsCargo _tradeVehicleObject);
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
							};
						}
						else
						{
							_weapon = [_itemClassName,"","","",[],[],""];
						};
						ExileClientPlayerLoadoutSecondary = _weapon;
					};
					case "Handgun": 
					{
						_result = [localize "STR_LOADOUT_AddWeaponLoadout", "Loadout Weapon", "Yes", "No"] call BIS_fnc_guiMessage;
						waitUntil { !isNil "_result" };
						_weapon = [];
						if (_result) then
						{
							switch (_tradeContainerType) do
							{
								case 1: 
								{
									_loadout = getUnitLoadout player;
									_weapon = _loadout select 2;
								};
								case 2:
								{
									_weapons = (weaponsItemsCargo (uniformContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								case 3: 
								{
									_weapons = (weaponsItemsCargo (vestContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								case 4:
								{
									_weapons = (weaponsItemsCargo (backpackContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								default 
								{
									_tradeVehicleNetID = _inventoryDropdown lbData _dropdownIndex;
									_tradeVehicleObject = objectFromNetId _tradeVehicleNetID;
									_weapons = (weaponsItemsCargo _tradeVehicleObject);
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
							};
						}
						else
						{
							_weapon = [_itemClassName,"","","",[],[],""];
						};
						ExileClientPlayerLoadoutPistol = _weapon;
					};
				};
			};
			case "Uniform":
			{
				if !(count ExileClientPlayerLoadoutUniform isEqualTo 0) then
				{
					_items = ExileClientPlayerLoadoutUniform select 1;
					_itemType = _itemClassName call BIS_fnc_itemType;
					_ok = true;
					if((_itemType select 1) isEqualTo "Weapon") then
					{
						_result = [localize "STR_LOADOUT_AddWeaponLoadout", "Loadout Weapon", "Yes", "No"] call BIS_fnc_guiMessage;
						_weapon = [];
						waitUntil { !isNil "_result" };
						if (_result) then
						{
							switch (_tradeContainerType) do
							{
								case 1: 
								{
									_loadout = getUnitLoadout player;
									{
										if(count _x > 0) then
										{
											if((_x select 0) isEqualTo _itemClassName) then
											{
												_weapon = _x;
											};
										};
									} forEach [(_loadout select 0),(_loadout select 1),(_loadout select 2)];
								};
								case 2:
								{
									_weapons = (weaponsItemsCargo (uniformContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								case 3: 
								{
									_weapons = (weaponsItemsCargo (vestContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								case 4:
								{
									_weapons = (weaponsItemsCargo (backpackContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								default 
								{
									_tradeVehicleNetID = _inventoryDropdown lbData _dropdownIndex;
									_tradeVehicleObject = objectFromNetId _tradeVehicleNetID;
									_weapons = (weaponsItemsCargo _tradeVehicleObject);
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
							};
						}
						else
						{
							_weapon = [_itemClassName,"","","",[],[],""];
						};
						_items pushBack [_weapon,1];
					}
					else
					{
						if ((_itemType select 1) isEqualTo "Binocular") then
						{
							_ok = false;
							_items pushBack [[_itemClassName,"","","",[],[],""],1];
						};
						_count = (getNumber (configfile >> "CfgMagazines" >> _itemClassName >> "count"));
						if(_count isEqualTo 0 && _ok) then
						{
							_items pushBack [_itemClassName,1];
						}
						else
						{
							if(_ok) then
							{
								_items pushBack [_itemClassName,1,_count];
							};
						};
					};
					ExileClientPlayerLoadoutUniform set [1,_items];
				};
			};
			case "Vest":
			{
				if !(count ExileClientPlayerLoadoutVest isEqualTo 0) then
				{
					_items = ExileClientPlayerLoadoutVest select 1;
					_itemType = _itemClassName call BIS_fnc_itemType;
					_ok = true;
					if((_itemType select 1) isEqualTo "Weapon") then
					{
						_result = [localize "STR_LOADOUT_AddWeaponLoadout", "Loadout Weapon", "Yes", "No"] call BIS_fnc_guiMessage;
						_weapon = [];
						waitUntil { !isNil "_result" };
						if (_result) then
						{
							switch (_tradeContainerType) do
							{
								case 1: 
								{
									_loadout = getUnitLoadout player;
									{
										if(count _x > 0) then
										{
											if((_x select 0) isEqualTo _itemClassName) then
											{
												_weapon = _x;
											};
										};
									} forEach [(_loadout select 0),(_loadout select 1),(_loadout select 2)];
								};
								case 2:
								{
									_weapons = (weaponsItemsCargo (uniformContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								case 3: 
								{
									_weapons = (weaponsItemsCargo (vestContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								case 4:
								{
									_weapons = (weaponsItemsCargo (backpackContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								default 
								{
									_tradeVehicleNetID = _inventoryDropdown lbData _dropdownIndex;
									_tradeVehicleObject = objectFromNetId _tradeVehicleNetID;
									_weapons = (weaponsItemsCargo _tradeVehicleObject);
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
							};
						}
						else
						{
							_weapon = [_itemClassName,"","","",[],[],""];
						};
						_items pushBack [_weapon,1];
					}
					else
					{
						if ((_itemType select 1) isEqualTo "Binocular") then
						{
							_ok = false;
							_items pushBack [[_itemClassName,"","","",[],[],""],1];
						};
						_count = (getNumber (configfile >> "CfgMagazines" >> _itemClassName >> "count"));
						if(_count isEqualTo 0 && _ok) then
						{
							_items pushBack [_itemClassName,1];
						}
						else
						{
							if(_ok) then
							{
								_items pushBack [_itemClassName,1,_count];
							};
						};
					};
					ExileClientPlayerLoadoutVest set [1,_items];
				};
			};
			case "Backpack":
			{
				if !(count ExileClientPlayerLoadoutBackpack isEqualTo 0) then
				{
					_items = ExileClientPlayerLoadoutBackpack select 1;
					_itemType = _itemClassName call BIS_fnc_itemType;
					_ok = true;
					if((_itemType select 0) isEqualTo "Weapon") then
					{
						_result = [localize "STR_LOADOUT_AddWeaponLoadout", "Loadout Weapon", "Yes", "No"] call BIS_fnc_guiMessage;
						_weapon = [];
						waitUntil { !isNil "_result" };
						
						if (_result) then
						{
							switch (_tradeContainerType) do
							{
								case 1: 
								{
									_loadout = getUnitLoadout player;
									{
										if(count _x > 0) then
										{
											if((_x select 0) isEqualTo _itemClassName) then
											{
												_weapon = _x;
											};
										};
									} forEach [(_loadout select 0),(_loadout select 1),(_loadout select 2)];
								};
								case 2:
								{
									_weapons = (weaponsItemsCargo (uniformContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								case 3: 
								{
									_weapons = (weaponsItemsCargo (vestContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								case 4:
								{
									_weapons = (weaponsItemsCargo (backpackContainer player));
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
								default 
								{
									_tradeVehicleNetID = _inventoryDropdown lbData _dropdownIndex;
									_tradeVehicleObject = objectFromNetId _tradeVehicleNetID;
									_weapons = (weaponsItemsCargo _tradeVehicleObject);
									{
										if((_x select 0) isEqualTo _itemClassName) then
										{
											_weapon = _x;
										};
									} forEach _weapons;
								};
							};
						}
						else
						{
							_weapon = [_itemClassName,"","","",[],[],""];
						};
						_items pushBack [_weapon,1];
					}
					else
					{
						if ((_itemType select 1) isEqualTo "Binocular") then
						{
							_ok = false;
							_items pushBack [[_itemClassName,"","","",[],[],""],1];
						};
						_count = (getNumber (configfile >> "CfgMagazines" >> _itemClassName >> "count"));
						if(_count isEqualTo 0 && _ok) then
						{
							_items pushBack [_itemClassName,1];
						}
						else
						{
							if(_ok) then
							{
								_items pushBack [_itemClassName,1,_count];
							};
						};
					};
					ExileClientPlayerLoadoutBackpack set [1,_items];
				};
			};
			case "Primary":
			{
				if !((count (ExileClientPlayerLoadoutPrimary)) isEqualTo 0) then
				{
					_compatable = (ExileClientPlayerLoadoutPrimary select 0) call BIS_fnc_compatibleItems;
					_found = true;
					if !({_x == _itemClassName} count (_compatable) > 0) then
					{
						_found = false;
					};
					if (_found) then
					{
						_itemType = _itemClassName call BIS_fnc_itemType;
						switch (_itemType select 0) do
						{
							case "Item":
							{
								switch (_itemType select 1) do
								{
									case "AccessoryMuzzle":
									{
										ExileClientPlayerLoadoutPrimary set [1,_itemClassName];
									};
									case "AccessoryPointer":
									{
										ExileClientPlayerLoadoutPrimary set [2,_itemClassName];
									};
									case "AccessorySights":
									{
										ExileClientPlayerLoadoutPrimary set [3,_itemClassName];
									};
									case "AccessoryBipod":
									{
										ExileClientPlayerLoadoutPrimary set [6,_itemClassName];
									};
									default 
									{
									};
								};	
							};
							case "Magazine":
							{
								switch (_itemType select 1) do
								{
									case "SmokeShell";
									case "Flare";
									case "Grenade";
									case "Shell":
									{
										_count = (getNumber (configfile >> "CfgMagazines" >> _itemClassName >> "count"));
										ExileClientPlayerLoadoutPrimary set [5,[_itemClassName,_count]];
									};
									case "Artillery";
									case "CounterMeasures";
									case "Missile";
									case "Rocket";
									case "ShotgunShell";
									case "Bullet":
									{
										_count = (getNumber (configfile >> "CfgMagazines" >> _itemClassName >> "count"));
										ExileClientPlayerLoadoutPrimary set [4,[_itemClassName,_count]];
									};
									default 
									{
									};
								};	
							};
						};
					};
				};
			};
			case "Secondary":
			{
				if !((count ExileClientPlayerLoadoutSecondary) isEqualTo 0) then
				{
					_compatable = (ExileClientPlayerLoadoutPrimary select 0) call BIS_fnc_compatibleItems;
					_found = true;
					if !({_x == _itemClassName} count (_compatable) > 0) then
					{
						_found = false;
					};
					if (_found) then
					{
						_itemType = _itemClassName call BIS_fnc_itemType;
						switch (_itemType select 0) do
						{
							case "Item":
							{
								switch (_itemType select 1) do
								{
									case "AccessoryMuzzle":
									{
										ExileClientPlayerLoadoutPrimary set [1,_itemClassName];
									};
									case "AccessoryPointer":
									{
										ExileClientPlayerLoadoutPrimary set [2,_itemClassName];
									};
									case "AccessorySights":
									{
										ExileClientPlayerLoadoutPrimary set [3,_itemClassName];
									};
									case "AccessoryBipod":
									{
										ExileClientPlayerLoadoutPrimary set [6,_itemClassName];
									};
									default 
									{
									};
								};	
							};
							case "Magazine":
							{
								switch (_itemType select 1) do
								{
									case "SmokeShell";
									case "Flare";
									case "Grenade";
									case "Shell":
									{
										_count = (getNumber (configfile >> "CfgMagazines" >> _itemClassName >> "count"));
										ExileClientPlayerLoadoutPrimary set [5,[_itemClassName,_count]];
									};
									case "Artillery";
									case "CounterMeasures";
									case "Missile";
									case "Rocket";
									case "ShotgunShell";
									case "Bullet":
									{
										_count = (getNumber (configfile >> "CfgMagazines" >> _itemClassName >> "count"));
										ExileClientPlayerLoadoutPrimary set [4,[_itemClassName,_count]];
									};
									default 
									{
									};
								};	
							};
						};
					};
				};
			};
			case "Pistol":
			{
				if !((count ExileClientPlayerLoadoutPistol) isEqualTo 0) then
				{
					_compatable = (ExileClientPlayerLoadoutPrimary select 0) call BIS_fnc_compatibleItems;
					_found = true;
					if !({_x == _itemClassName} count (_compatable) > 0) then
					{
						_found = false;
					};
					if (_found) then
					{
						_itemType = _itemClassName call BIS_fnc_itemType;
						switch (_itemType select 0) do
						{
							case "Item":
							{
								switch (_itemType select 1) do
								{
									case "AccessoryMuzzle":
									{
										ExileClientPlayerLoadoutPrimary set [1,_itemClassName];
									};
									case "AccessoryPointer":
									{
										ExileClientPlayerLoadoutPrimary set [2,_itemClassName];
									};
									case "AccessorySights":
									{
										ExileClientPlayerLoadoutPrimary set [3,_itemClassName];
									};
									case "AccessoryBipod":
									{
										ExileClientPlayerLoadoutPrimary set [6,_itemClassName];
									};
									default 
									{
									};
								};	
							};
							case "Magazine":
							{
								switch (_itemType select 1) do
								{
									case "SmokeShell";
									case "Flare";
									case "Grenade";
									case "Shell":
									{
										_count = (getNumber (configfile >> "CfgMagazines" >> _itemClassName >> "count"));
										ExileClientPlayerLoadoutPrimary set [5,[_itemClassName,_count]];
									};
									case "Artillery";
									case "CounterMeasures";
									case "Missile";
									case "Rocket";
									case "ShotgunShell";
									case "Bullet":
									{
										_count = (getNumber (configfile >> "CfgMagazines" >> _itemClassName >> "count"));
										ExileClientPlayerLoadoutPrimary set [4,[_itemClassName,_count]];
									};
									default 
									{
									};
								};	
							};
						};
					};
				};
			};
			default 
			{
			};
		};
		
		["SuccessTitleAndText", ["Loadout",  "Item Added!"]] call ExileClient_gui_toaster_addTemplateToast;
		[] call ExileClient_gui_loadoutDialog_event_save;
		if (_type isEqualTo "Loadout") then
		{
			true call ExileClient_gui_loadoutDialog_updateLoadoutInterface;
			true call ExileClient_gui_loadoutDialog_updatePriceInterface;
		}
		else
		{
			[_type,false] call ExileClient_gui_loadoutDialog_updateLoadoutListBox;
			true call ExileClient_gui_loadoutDialog_updatePriceInterface;
		};
		_addButton ctrlEnable false;
	}
	else
	{
		_addButton ctrlEnable false;
		systemchat format["Unable to add item, if you think this is an error please report it!"];
	};
};