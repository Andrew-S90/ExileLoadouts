 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
 
private ["_listBox", "_index"];
disableSerialization;
_listBox = _this select 0;
_index = _this select 1;

_data = _listBox lbValue _index;

ExileClientPlayerLoadoutNumber = _data;

ExileClientPlayerLoadout = profileNamespace getVariable [format["ExileClientPlayerLoadout%1%2",ExileClientPlayerLoadoutServerName,ExileClientPlayerLoadoutNumber],[]];
ExileClientPlayerLoadout = ExileClientPlayerLoadout call ExileClient_gui_loadoutDialog_event_checkLoadout;

ExileClientPlayerLoadoutPrimary = ExileClientPlayerLoadout select 0;
ExileClientPlayerLoadoutSecondary = ExileClientPlayerLoadout select 1;
ExileClientPlayerLoadoutPistol = ExileClientPlayerLoadout select 2;
ExileClientPlayerLoadoutUniform = ExileClientPlayerLoadout select 3;
ExileClientPlayerLoadoutVest = ExileClientPlayerLoadout select 4;
ExileClientPlayerLoadoutBackpack = ExileClientPlayerLoadout select 5;
ExileClientPlayerLoadoutHeadgear = ExileClientPlayerLoadout select 6;
ExileClientPlayerLoadoutFacewear = ExileClientPlayerLoadout select 7;
ExileClientPlayerLoadoutBinocular = ExileClientPlayerLoadout select 8;
ExileClientPlayerLoadoutItems = ExileClientPlayerLoadout select 9;

true call ExileClient_gui_loadoutDialog_updateLoadoutInterface;
true call ExileClient_gui_loadoutDialog_updatePriceInterface;
