/**
 * ExileServer_system_trading_network_purchaseItemRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID", "_parameters", "_itemClassName", "_quantity", "_containerType", "_containerNetID", "_playerObject", "_vehicleObject", "_salesPrice", "_playerMoney", "_playerRespect", "_quality", "_requiredRespect", "_logging", "_traderLog", "_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_purchaseLoadout = _parameters select 0;
_currentLoadout = _parameters select 1;
try 
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (_playerObject getVariable ["ExileMutex",false]) then
	{
		throw 12;
	};
	_playerObject setVariable ["ExileMutex",true];
	if (isNull _playerObject) then
	{
		throw 1;
	};
	if !(alive _playerObject) then
	{
		throw 2;
	};
	_playerObject setUnitLoadout (configFile >> "EmptyLoadout");
	_loadoutNumber = [_purchaseLoadout,false] call ExileClient_gui_LoadoutDialog_calculateLoadoutPrice;
	_gearNumber = [_currentLoadout,true] call ExileClient_gui_LoadoutDialog_calculateLoadoutPrice;
	_totalNumber = 0;
	_add = false;
	if (_loadoutNumber >= _gearNumber) then
	{
		_add = false;
		_totalNumber = _loadoutNumber - _gearNumber;
	}
	else
	{
		_add = true;
		_totalNumber = _gearNumber - _loadoutNumber;
	};
	_playerMoney = _playerObject getVariable ["ExileMoney", 0];
	_playerRespect = _playerObject getVariable ["ExileScore", 0];
	if (_playerMoney < _totalNumber && (_add isEqualTo false)) then
	{
		throw 5;
	};
	
	_respectGain = _gearNumber * getNumber (configFile >> "CfgSettings" >> "Respect" >> "tradingRespectFactor");
	_playerRespect = floor (_playerRespect + _respectGain);
	_playerObject setVariable ["ExileScore", _playerRespect];
	format["setAccountScore:%1:%2", _playerRespect, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
	if !(getNumber(configFile >> "CfgSettings" >> "Escape" >> "enableEscape") isEqualTo 1) then 
	{
		if (_add) then
		{
			_playerMoney = _playerMoney + _totalNumber;
		}
		else
		{
			_playerMoney = _playerMoney - _totalNumber;
		};
		
		_playerObject setVariable ["ExileMoney", _playerMoney, true];
		format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	};
	_playerObject setUnitLoadout _purchaseLoadout;
	[_sessionID, "purchaseLoadoutResponse", [0, _totalNumber, str _playerRespect, _add]] call ExileServer_system_network_send_to;
	_logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "traderLogging");
	if (_logging isEqualTo 1) then
	{
		_traderLog = format ["PLAYER: ( %1 ) %2 PURCHASED LOADOUT FOR %3 POPTABS | PLAYER TOTAL MONEY: %4",getPlayerUID _playerObject,_playerObject,_totalNumber,_playerMoney];
		"extDB2" callExtension format["1:TRADING:%1",_traderLog];
	};
	_playerObject call ExileServer_object_player_database_update;
}
catch 
{
	_responseCode = _exception; 
	_playerObject setUnitLoadout _currentLoadout;
	[_sessionID, "purchaseLoadoutResponse", [_responseCode, 0, "", false]] call ExileServer_system_network_send_to;
};	
_playerObject setVariable ["ExileMutex",false];
true