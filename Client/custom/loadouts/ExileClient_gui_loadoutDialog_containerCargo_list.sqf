private ["_dialog", "_result", "_buyButton", "_addButton", "_applyButton", "_clearButton", "_currentLoadout", "_purchaseLoadout"];
_container = _this;
_list = [];
_backpacks = backpackCargo _container;
if !(isNil "_backpacks") then
{
	_list append _backpacks;
};
_magazines = magazineCargo _container;
if !(isNil "_magazines") then
{
	_list append _magazines;
};
_weapons = weaponsItemsCargo _container;
if !(isNil "_weapons") then
{
	{
		{
			_itemClassName = "";
			if ((typeName _x) isEqualTo "STRING") then
			{
				_itemClassName = _x;
			}
			else 
			{
				if(count(_x) > 0) then
				{
					_itemClassName = _x select 0;
				};
			};
			if !(_itemClassName isEqualTo "") then
			{
				_list pushBack _itemClassName;
			};
		}
		forEach _x;
	} 
	forEach _weapons;
};
_items = getItemCargo _container;
if !(isNil "_items") then
{
	{
		_itemClassName = (_items select 0) select _forEachIndex;
		_itemQuantity = (_items select 1) select _forEachIndex;
		for "_i" from 1 to _itemQuantity do
		{
			_list pushBack _itemClassName;
		};
	}
	forEach (_items select 0);
};
_list