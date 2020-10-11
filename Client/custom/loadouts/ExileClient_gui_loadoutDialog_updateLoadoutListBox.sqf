 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
 
private ["_dialog", "_listBoxType", "_listBoxOldType", "_addButton", "_loadoutListBox", "_frame", "_containerInfo", "_count", "_itemClassName", "_itemQuantity", "_indexEntryIndex", "_configName", "_qualityColor", "_popTabColor", "_imageColor"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];
_listBoxType = _this select 0;
_close = _this select 1;
_listBoxOldType = ExileClientPlayerLoadoutListBox;
_addButton = _dialog displayCtrl 2020;
_addButton ctrlEnable false;

_loadoutListBox = _dialog displayCtrl 2010;
_loadoutListBox lbSetCurSel -1;
lbClear _loadoutListBox;

if ((_listBoxType isEqualTo _listBoxOldType) && _close) then
{
	ExileClientPlayerLoadoutListBox = "Loadout";
	
	{
		_frame = _dialog displayCtrl _x;
		_frame ctrlEnable false;
		_frame ctrlShow false;
		_frame ctrlCommit 0;
	} forEach [7003,8003,9003,15003,16003,17003];
}
else
{
	ExileClientPlayerLoadoutListBox = (_this select 0);
	_containerInfo = [];
	_count = true;

	switch ((_this select 0)) do 
	{
		case "Uniform": 
		{ 
			_containerInfo = ExileClientPlayerLoadoutUniform select 1;
			{
				_frame = _dialog displayCtrl _x;
				_frame ctrlEnable false;
				_frame ctrlShow false;
				_frame ctrlCommit 0;
			} forEach [7003,8003,9003,15003,16003,17003];			
			_frame = _dialog displayCtrl 7003;
			_frame ctrlEnable true;
			_frame ctrlShow true;
			_frame ctrlCommit 0;
		};
		case "Vest": 
		{ 
			_containerInfo = ExileClientPlayerLoadoutVest select 1; 
			{
				_frame = _dialog displayCtrl _x;
				_frame ctrlEnable false;
				_frame ctrlShow false;
				_frame ctrlCommit 0;
			} forEach [7003,8003,9003,15003,16003,17003];	
			_frame = _dialog displayCtrl 8003;
			_frame ctrlEnable true;
			_frame ctrlShow true;
			_frame ctrlCommit 0;
		};
		case "Backpack": 
		{ 
			_containerInfo = ExileClientPlayerLoadoutBackpack select 1; 
			{
				_frame = _dialog displayCtrl _x;
				_frame ctrlEnable false;
				_frame ctrlShow false;
				_frame ctrlCommit 0;
			} forEach [7003,8003,9003,15003,16003,17003];	
			_frame = _dialog displayCtrl 9003;
			_frame ctrlEnable true;
			_frame ctrlShow true;
			_frame ctrlCommit 0;
		};
		case "Primary": 
		{ 
			{
				if (typeName _x isEqualTo "STRING") then
				{
					if !(_x isEqualTo "") then
					{
						if (_forEachIndex != 0) then
						{
							_containerInfo pushBack [_x,1];
						};
					};
				}
				else
				{
					if (count _x > 0) then
					{
						_containerInfo pushBack [(_x select 0),1];
					};
				};
			} forEach ExileClientPlayerLoadoutPrimary;
			{
				_frame = _dialog displayCtrl _x;
				_frame ctrlEnable false;
				_frame ctrlShow false;
				_frame ctrlCommit 0;
			} forEach [7003,8003,9003,15003,16003,17003];	
			_frame = _dialog displayCtrl 15003;
			_frame ctrlEnable true;
			_frame ctrlShow true;
			_frame ctrlCommit 0;
		};
		case "Secondary": 
		{ 
			{
				if (typeName _x isEqualTo "STRING") then
				{
					if !(_x isEqualTo "") then
					{
						if (_forEachIndex != 0) then
						{
							_containerInfo pushBack [_x,1];
						};
					};
				}
				else
				{
					if (count _x > 0) then
					{
						_containerInfo pushBack [(_x select 0),1];
					};
				};
			} forEach ExileClientPlayerLoadoutSecondary;
			{
				_frame = _dialog displayCtrl _x;
				_frame ctrlEnable false;
				_frame ctrlShow false;
				_frame ctrlCommit 0;
			} forEach [7003,8003,9003,15003,16003,17003];	
			_frame = _dialog displayCtrl 16003;
			_frame ctrlEnable true;
			_frame ctrlShow true;
			_frame ctrlCommit 0;
		};
		case "Pistol": 
		{ 
			{
				if (typeName _x isEqualTo "STRING") then
				{
					if !(_x isEqualTo "") then
					{
						if (_forEachIndex != 0) then
						{
							_containerInfo pushBack [_x,1];
						};
					};
				}
				else
				{
					if (count _x > 0) then
					{
						_containerInfo pushBack [(_x select 0),1];
					};
				};
			} forEach ExileClientPlayerLoadoutPistol; 
			{
				_frame = _dialog displayCtrl _x;
				_frame ctrlEnable false;
				_frame ctrlShow false;
				_frame ctrlCommit 0;
			} forEach [7003,8003,9003,15003,16003,17003];	
			_frame = _dialog displayCtrl 17003;
			_frame ctrlEnable true;
			_frame ctrlShow true;
			_frame ctrlCommit 0;
		};
		default { };
	};

	{
		_itemClassName = (_x select 0);
		_itemQuantity = (_x select 1);
		_indexEntryIndex = 1;
		if ((typeName _itemClassName) isEqualTo "ARRAY") then
		{
			_itemClassName = _itemClassName select 0;
		};
		_configName = _itemClassName call ExileClient_util_gear_getConfigNameByClassName;
		_indexEntryIndex = _loadoutListBox lbAdd getText(configFile >> _configName >> _itemClassName >> "displayName");
		_loadoutListBox lbSetPicture [_indexEntryIndex, getText(configFile >> _configName >> _itemClassName >> "picture")];
		
		_qualityColor = [1, 1, 1, 1];
		_popTabColor = [1, 1, 1, 1];
		_imageColor = [1, 1, 1, 1];
		
		_loadoutListBox lbSetData [_indexEntryIndex, _itemClassName];
		_loadoutListBox lbSetColor [_indexEntryIndex, _qualityColor];
		
		_loadoutListBox lbSetPictureColor [_indexEntryIndex, _imageColor];
		if (_count) then
		{
			_loadoutListBox lbSetTextRight [_indexEntryIndex, format["%1", _itemQuantity]];
		};
		_loadoutListBox lbSetColorRight [_indexEntryIndex, _popTabColor];
		_loadoutListBox lbSetPictureRightColor [_indexEntryIndex, _popTabColor];

	} forEach _containerInfo;
};