 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
private ["_loadout", "_sell", "_loadoutPrimary", "_loadoutSecondary", "_loadoutPistol", "_loadoutUniform", "_loadoutVest", "_loadoutBackpack", "_loadoutHeadgear", "_loadoutFacewear", "_loadoutBinocular", "_loadoutItems", "_price", "_sellFactor", "_quantity"];

_loadout = (_this select 0);
_sell = (_this select 1);

if !(_sell) then
{
	_loadout = _loadout call ExileClient_gui_loadoutDialog_event_checkLoadout;
};

_loadoutPrimary = _loadout select 0;
_loadoutSecondary = _loadout select 1;
_loadoutPistol = _loadout select 2;
_loadoutUniform = _loadout select 3;
_loadoutVest = _loadout select 4;
_loadoutBackpack = _loadout select 5;
_loadoutHeadgear = _loadout select 6;
_loadoutFacewear = _loadout select 7;
_loadoutBinocular = _loadout select 8;
_loadoutItems = _loadout select 9;
_price = 0;
_sellFactor = getNumber (missionConfigFile >> "CfgTrading" >> "sellPriceFactor");

//primary
if (count _loadoutPrimary > 0) then
{
	{
		if (typeName _x isEqualTo "ARRAY") then
		{
			if (count _x > 0) then
			{	
				if (_sell) then
				{
					_price = _price + ((_x select 0) call ExileClient_util_gear_calculateSellPrice);
				}
				else
				{
					_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> (_x select 0) >> "price");
				};
			};
		}
		else
		{
			if !(_x isEqualTo "") then
			{
				if (_sell) then
				{
					_price = _price + (_x call ExileClient_util_gear_calculateSellPrice);
				}
				else
				{
					_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price");
				};
			};
		};
	} forEach _loadoutPrimary;
};

//secondary
if (count _loadoutSecondary > 0) then
{
	{
		if (typeName _x isEqualTo "ARRAY") then
		{
			if (count _x > 0) then
			{
				if (_sell) then
				{
					_price = _price + ((_x select 0) call ExileClient_util_gear_calculateSellPrice);
				}
				else
				{
					_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> (_x select 0) >> "price");
				};
			};
		}
		else
		{
			if !(_x isEqualTo "") then
			{
				if (_sell) then
				{
					_price = _price + (_x call ExileClient_util_gear_calculateSellPrice);
				}
				else
				{
					_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price");
				};
			};
		};
	} forEach _loadoutSecondary;
};

//handgun
if (count _loadoutPistol > 0) then
{
	{
		if (typeName _x isEqualTo "ARRAY") then
		{
			if (count _x > 0) then
			{
				if (_sell) then
				{
					_price = _price + ((_x select 0) call ExileClient_util_gear_calculateSellPrice);
				}
				else
				{
					_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> (_x select 0) >> "price");
				};
			};
		}
		else
		{
			if !(_x isEqualTo "") then
			{
				if (_sell) then
				{
					_price = _price + (_x call ExileClient_util_gear_calculateSellPrice);
				}
				else
				{
					_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price");
				};
			};
		};
	} forEach _loadoutPistol;
};


if (count _loadoutUniform > 0) then
{
	{
		if (typeName _x isEqualTo "ARRAY") then
		{
			if (count _x > 0) then
			{
				{
					switch (count _x) do
					{
						case 2:
						{
							_quantity = (_x select 1);
							if (typeName (_x select 0) isEqualTo "ARRAY") then
							{
								{
									if (typeName _x isEqualTo "ARRAY") then
									{
										if (count _x > 0) then
										{
											if (_sell) then
											{
												_price = _price + (((_x select 0) call ExileClient_util_gear_calculateSellPrice) * _quantity);
											}
											else
											{
												_price = _price + (getNumber (missionConfigFile >> "CfgExileArsenal" >> (_x select 0) >> "price") * _quantity);
											};
										};
									}
									else
									{
										if !(_x isEqualTo "") then
										{
											if (_sell) then
											{
												_price = _price + ((_x call ExileClient_util_gear_calculateSellPrice) * _quantity);
											}
											else
											{
												_price = _price + (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price") * _quantity);
											};
										};
									};
								} forEach (_x select 0);
							}
							else
							{
								if (_sell) then
								{
									_price = _price + (((_x select 0) call ExileClient_util_gear_calculateSellPrice) * _quantity);
								}
								else
								{
									_price = _price + (getNumber (missionConfigFile >> "CfgExileArsenal" >> (_x select 0) >> "price") * _quantity);
								};
							};
						};
						case 3:
						{
							if (_sell) then
							{
								_price = _price + (((_x select 0) call ExileClient_util_gear_calculateSellPrice) * (_x select 1));
							}
							else
							{
								_price = _price + (getNumber (missionConfigFile >> "CfgExileArsenal" >> (_x select 0) >> "price") * (_x select 1));
							};
						};
						default 
						{
							
						};
					};
				} forEach _x;
			};
		}
		else
		{
			if !(_x isEqualTo "") then
			{
				if (_sell) then
				{
					_price = _price + (_x call ExileClient_util_gear_calculateSellPrice);
				}
				else
				{
					_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price");
				};
			};
		};
	} forEach _loadoutUniform;
};

if (count _loadoutVest > 0) then
{
	{
		if (typeName _x isEqualTo "ARRAY") then
		{
			if (count _x > 0) then
			{
				{
					switch (count _x) do
					{
						case 2:
						{
							_quantity = (_x select 1);
							if (typeName (_x select 0) isEqualTo "ARRAY") then
							{
								{
									if (typeName _x isEqualTo "ARRAY") then
									{
										if (count _x > 0) then
										{
											if (_sell) then
											{
												_price = _price + (((_x select 0) call ExileClient_util_gear_calculateSellPrice) * _quantity);
											}
											else
											{
												_price = _price + (getNumber (missionConfigFile >> "CfgExileArsenal" >> (_x select 0) >> "price") * _quantity);
											};
										};
									}
									else
									{
										if !(_x isEqualTo "") then
										{
											if (_sell) then
											{
												_price = _price + ((_x call ExileClient_util_gear_calculateSellPrice) * _quantity);
											}
											else
											{
												_price = _price + (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price") * _quantity);
											};
										};
									};
								} forEach (_x select 0);
							}
							else
							{
								if (_sell) then
								{
									_price = _price + (((_x select 0) call ExileClient_util_gear_calculateSellPrice) * _quantity);
								}
								else
								{
									_price = _price + (getNumber (missionConfigFile >> "CfgExileArsenal" >> (_x select 0) >> "price") * _quantity);
								};
							};
						};
						case 3:
						{
							if (_sell) then
							{
								_price = _price + (((_x select 0) call ExileClient_util_gear_calculateSellPrice) * (_x select 1));
							}
							else
							{
								_price = _price + (getNumber (missionConfigFile >> "CfgExileArsenal" >> (_x select 0) >> "price") * (_x select 1));
							};
						};
						default 
						{
							
						};
					};
				} forEach _x;
			};
		}
		else
		{
			if !(_x isEqualTo "") then
			{
				if (_sell) then
				{
					_price = _price + (_x call ExileClient_util_gear_calculateSellPrice);
				}
				else
				{
					_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price");
				};
			};
		};
	} forEach _loadoutVest;
};

if (count _loadoutBackpack > 0) then
{
	{
		if (typeName _x isEqualTo "ARRAY") then
		{
			if (count _x > 0) then
			{
				{
					switch (count _x) do
					{
						case 2:
						{
							_quantity = (_x select 1);
							if (typeName (_x select 0) isEqualTo "ARRAY") then
							{
								{
									if (typeName _x isEqualTo "ARRAY") then
									{
										if (count _x > 0) then
										{
											if (_sell) then
											{
												_price = _price + (((_x select 0) call ExileClient_util_gear_calculateSellPrice) * _quantity);
											}
											else
											{
												_price = _price + (getNumber (missionConfigFile >> "CfgExileArsenal" >> (_x select 0) >> "price") * _quantity);
											};
										};
									}
									else
									{
										if !(_x isEqualTo "") then
										{
											if (_sell) then
											{
												_price = _price + ((_x call ExileClient_util_gear_calculateSellPrice) * _quantity);
											}
											else
											{
												_price = _price + (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price") * _quantity);
											};
										};
									};
								} forEach (_x select 0);
							}
							else
							{
								if (_sell) then
								{
									_price = _price + (((_x select 0) call ExileClient_util_gear_calculateSellPrice) * _quantity);
								}
								else
								{
									_price = _price + (getNumber (missionConfigFile >> "CfgExileArsenal" >> (_x select 0) >> "price") * _quantity);
								};
							};
						};
						case 3:
						{
							if (_sell) then
							{
								_price = _price + (((_x select 0) call ExileClient_util_gear_calculateSellPrice) * (_x select 1));
							}
							else
							{
								_price = _price + (getNumber (missionConfigFile >> "CfgExileArsenal" >> (_x select 0) >> "price") * (_x select 1));
							};
						};
						default 
						{
							
						};
					};
				} forEach _x;
			};
		}
		else
		{
			if !(_x isEqualTo "") then
			{
				if (_sell) then
				{
					_price = _price + (_x call ExileClient_util_gear_calculateSellPrice);
				}
				else
				{
					_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price");
				};
			};
		};
	} forEach _loadoutBackpack;
};

if !(_loadoutHeadgear isEqualTo "") then
{
	if (_sell) then
	{
		_price = _price + (_loadoutHeadgear call ExileClient_util_gear_calculateSellPrice);
	}
	else
	{
		_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> _loadoutHeadgear >> "price");
	};
};

if !(_loadoutFacewear isEqualTo "") then
{
	if (_sell) then
	{
		_price = _price + (_loadoutFacewear call ExileClient_util_gear_calculateSellPrice);
	}
	else
	{
		_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> _loadoutFacewear >> "price");
	};
};

if (count _loadoutBinocular > 0) then
{
	if (_sell) then
	{
		_price = _price + ((_loadoutBinocular select 0) call ExileClient_util_gear_calculateSellPrice);
	}
	else
	{
		_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> (_loadoutBinocular select 0) >> "price");
	};
};

if (count _loadoutItems > 0) then
{
	{
		if !(_x isEqualTo "") then
		{
			if (_sell) then
			{
				_price = _price + (_x call ExileClient_util_gear_calculateSellPrice);
			}
			else
			{
				_price = _price + getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price");
			};
		};
	} forEach _loadoutItems;
};

_price