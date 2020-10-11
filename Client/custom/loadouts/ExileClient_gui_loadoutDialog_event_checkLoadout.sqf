 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
private ["_dialog", "_result", "_buyButton", "_addButton", "_applyButton", "_clearButton", "_currentLoadout", "_purchaseLoadout"];

_playerLoadout = _this;

//check for corruption/modification

if(count _playerLoadout isEqualTo 0) then
{
	_playerLoadout = [[],[],[],[],[],[],"","",[],["","","","","",""]];
	systemchat format["No Loadout Saved."];
}
else
{
	if !(typeName (_playerLoadout select 0) isEqualTo "ARRAY") then
	{
		_playerLoadout set [0,[]];
		systemchat format["Corrupt primary weapon slot. Loadout Repaired."];
	};

	if(count (_playerLoadout select 0) > 0) then
	{
		{
			if (typeName _x isEqualTo "STRING") then
			{
				_itemClassName = _x;
				if !(_itemClassName isEqualTo "") then
				{
					if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
					{
						_playerLoadout set [0,[]];
						systemchat format["Loadout Repaired. Blocked Item in primary weapon slot: %1",_itemClassName];
					};
				};
			}
			else
			{
				if(count (_playerLoadout select 0) > 0) then
				{
					if(count _x > 0) then
					{
						_itemClassName = _x select 0;
						if !(_itemClassName isEqualTo "") then
						{
							if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
							{
								_playerLoadout set [0,[]];
								systemchat format["Loadout Repaired. Blocked Item in primary weapon slot: %1",_itemClassName];
							};
						};
					};
				};
			};
		} forEach (_playerLoadout select 0);
	};
	
	if !(typeName (_playerLoadout select 1) isEqualTo "ARRAY") then
	{
		_playerLoadout set [1,[]];
		systemchat format["Corrupt launcher weapon slot. Loadout Repaired."];
	};
	
	if(count (_playerLoadout select 1) > 0) then
	{
		{
			if (typeName _x isEqualTo "STRING") then
			{
				_itemClassName = _x;
				if !(_itemClassName isEqualTo "") then
				{
					if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
					{
						_playerLoadout set [1,[]];
						systemchat format["Loadout Repaired. Blocked Item in secondary weapon slot: %1",_itemClassName];
					};
				};
			}
			else
			{
				if(count (_playerLoadout select 1) > 0) then
				{
					if(count _x > 0) then
					{
						_itemClassName = _x select 0;
						if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
						{
							_playerLoadout set [1,[]];
							systemchat format["Loadout Repaired. Blocked Item in secondary weapon slot: %1",_itemClassName];
						};
					};
				};
			};
		} forEach (_playerLoadout select 1);
	};
	
	if !(typeName (_playerLoadout select 2) isEqualTo "ARRAY") then
	{
		_playerLoadout set [2,[]];
		systemchat format["Corrupt pistol weapon slot. Loadout Repaired."];
	};

	if(count (_playerLoadout select 2) > 0) then
	{
		{
			if (typeName _x isEqualTo "STRING") then
			{
				_itemClassName = _x;
				if !(_itemClassName isEqualTo "") then
				{
					if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
					{
						_playerLoadout set [2,[]];
						systemchat format["Loadout Repaired. Blocked Item in pistol weapon slot: %1",_itemClassName];
					};
				};
			}
			else
			{
				if(count (_playerLoadout select 2) > 0) then
				{
					if(count _x > 0) then
					{
						_itemClassName = _x select 0;
						if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
						{
							_playerLoadout set [2,[]];
							systemchat format["Loadout Repaired. Blocked Item in pistol weapon slot: %1",_itemClassName];
						};
					};
				};
			};
		} forEach (_playerLoadout select 2);
	};
	
	if !(typeName (_playerLoadout select 3) isEqualTo "ARRAY") then
	{
		_playerLoadout set [3,[]];
		systemchat format["Corrupt uniform slot. Loadout Repaired."];
	};

	if(count (_playerLoadout select 3) > 0) then
	{
		{
			if (typeName _x isEqualTo "STRING") then
			{
				_itemClassName = _x;
				if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
				{
					_playerLoadout set [3,[]];
					systemchat format["Invalid or Blocked items in uniform. Loadout Repaired."];
				};
			}
			else
			{
				if(count (_playerLoadout select 3) > 0) then
				{
					{
						_itemClassName = _x select 0;
						if ((typeName _itemClassName) isEqualTo "ARRAY") then
						{
							_itemClassName = _itemClassName select 0;
						};
						if ((typeName _itemClassName) isEqualTo "ARRAY") then
						{
							_itemClassName = _itemClassName select 0;
						};
						if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
						{
							_playerLoadout set [3,[]];
							systemchat format["Invalid or Blocked items in uniform. Loadout Repaired."];
						};
					} forEach ((_playerLoadout select 3) select 1);
				};
			};
		} forEach (_playerLoadout select 3);
	};
	
	if !(typeName (_playerLoadout select 4) isEqualTo "ARRAY") then
	{
		_playerLoadout set [4,[]];
		systemchat format["Corrupt vest slot. Loadout Repaired."];
	};

	if(count (_playerLoadout select 4) > 0) then
	{
		{
			if !(typeName _x isEqualTo "ARRAY") then
			{
				_itemClassName = _x;
				if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
				{
					_playerLoadout set [4,[]];
					systemchat format["Invalid or Blocked items in vest. Loadout Repaired."];
				};
			}
			else
			{
				if(count (_playerLoadout select 4) > 0) then
				{
					{
						_itemClassName = _x select 0;
						if ((typeName _itemClassName) isEqualTo "ARRAY") then
						{
							_itemClassName = _itemClassName select 0;
						};
						if ((typeName _itemClassName) isEqualTo "ARRAY") then
						{
							_itemClassName = _itemClassName select 0;
						};
						if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
						{
							_playerLoadout set [4,[]];
							systemchat format["Invalid or Blocked items in vest. Loadout Repaired."];
						};
					} forEach ((_playerLoadout select 4) select 1);
				};
			};
		} forEach (_playerLoadout select 4);
	};
	
	if !(typeName (_playerLoadout select 5) isEqualTo "ARRAY") then
	{
		_playerLoadout set [5,[]];
		systemchat format["Corrupt backpack slot. Loadout Repaired."];
	};

	if(count (_playerLoadout select 5) > 0) then
	{
		{
			if !((typeName _x) isEqualTo "ARRAY") then
			{
				_itemClassName = _x;
				if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
				{
					_playerLoadout set [5,[]];
					systemchat format["Invalid or Blocked items in backpack. Loadout Repaired."];
				};
			}
			else
			{
				if(count (_playerLoadout select 5) > 0) then
				{
					{
						_itemClassName = _x select 0;
						if ((typeName _itemClassName) isEqualTo "ARRAY") then
						{
							_itemClassName = _itemClassName select 0;
						};
						if ((typeName _itemClassName) isEqualTo "ARRAY") then
						{
							_itemClassName = _itemClassName select 0;
						};
						if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
						{
							_playerLoadout set [5,[]];
							systemchat format["Invalid or Blocked items in backpack. Loadout Repaired."];
						};
					} forEach ((_playerLoadout select 5) select 1);
				};
			};
		} forEach (_playerLoadout select 5);
	};
	
	if !(typeName (_playerLoadout select 6) isEqualTo "STRING") then
	{
		_playerLoadout set [6,""];
		systemchat format["Corrupt helmet slot. Loadout Repaired."];
	};

	if !((_playerLoadout select 6) isEqualTo "") then
	{
		_itemClassName = (_playerLoadout select 6);
		if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
		{
			_playerLoadout set [6,""];
			systemchat format["Invalid or Blocked helmet. Loadout Repaired."];
		};
	};
	
	if !(typeName (_playerLoadout select 7) isEqualTo "STRING") then
	{
		_playerLoadout set [7,""];
		systemchat format["Corrupt facewear slot. Loadout Repaired."];
	};

	if !((_playerLoadout select 7) isEqualTo "") then
	{
		_itemClassName = (_playerLoadout select 7);
		if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
		{
			_playerLoadout set [7,""];
			systemchat format["Invalid or Blocked facewear. Loadout Repaired."];
		};
	};
	
	if !(typeName (_playerLoadout select 8) isEqualTo "ARRAY") then
	{
		_playerLoadout set [8,[]];
		systemchat format["Corrupt binocular slot. Loadout Repaired."];
	};

	if(count (_playerLoadout select 8) > 0) then
	{
		_itemClassName = ((_playerLoadout select 8) select 0);
		if (!(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
		{
			_playerLoadout set [8,[]];
			systemchat format["Invalid or Blocked binocular item. Loadout Repaired."];
		};
	};
	
	if !(typeName (_playerLoadout select 9) isEqualTo "ARRAY") then
	{
		_playerLoadout set [9,[]];
		systemchat format["Corrupt item slots. Loadout Repaired."];
	};

	if(count (_playerLoadout select 9) > 0) then
	{
		{
			if(count (_playerLoadout select 9) > 0) then
			{
				_itemClassName = _x;
				if !(_itemClassName isEqualTo "") then
				{
					if (!((isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName))) || ({_x == _itemClassName} count (getArray (MissionConfigFile >> "CfgLoadout" >> "Settings" >> "BlockedItems")) > 0)) then
					{
						_playerLoadout set [9,[]];
						systemchat format["Invalid or Blocked item slots. Loadout Repaired."];
					};
				};
			};
		} forEach (_playerLoadout select 9);
	};
};

_playerLoadout