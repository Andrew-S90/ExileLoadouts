 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
 
private["_responseCode", "_salesPrice", "_itemClassName", "_quantity", "_containerType", "_containerNetID", "_containersBefore", "_containersAfter", "_vehicle", "_dialog", "_storeListBox"];
_responseCode = _this select 0;
_totalPrice = _this select 1;
_newPlayerRespectString = _this select 2;
_add  = _this select 3;

ExileClientIsWaitingForServerTradeResponse = false;
if (_responseCode isEqualTo 0) then
{
	_newPlayerRespect = parseNumber _newPlayerRespectString;
	_respect = _newPlayerRespect - ExileClientPlayerScore;
	ExileClientPlayerScore = _newPlayerRespect;
	if (_add) then
	{
		if (_respect isEqualTo 0) then
		{
			["SuccessTitleAndText", ["Loadout Purchased!", format ["+%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/>", _totalPrice]]] call ExileClient_gui_toaster_addTemplateToast;
		}
		else 
		{
			["SuccessTitleAndText", ["Loadout Purchased!", format ["+%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/><br/>+%2 respect", _totalPrice, _respect]]] call ExileClient_gui_toaster_addTemplateToast;
		};
	}
	else
	{
		if (_respect isEqualTo 0) then
		{
			["SuccessTitleAndText", ["Loadout Purchased!", format ["-%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/>", _totalPrice]]] call ExileClient_gui_toaster_addTemplateToast;
		}
		else 
		{
			["SuccessTitleAndText", ["Loadout Purchased!", format ["-%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/><br/>+%2 respect", _totalPrice, _respect]]] call ExileClient_gui_toaster_addTemplateToast;
		};
	};
	
	_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];
	if !(_dialog isEqualTo displayNull) then
	{
		true call ExileClient_gui_loadoutDialog_updateInventoryDropdown;
		true call ExileClient_gui_loadoutDialog_updateLoadoutInterface;
		true call ExileClient_gui_loadoutDialog_updatePriceInterface;
		if(count ExileClientPlayerLoadoutUniform > 0) then
		{
			[(((ExileClientPlayerLoadoutUniform select 0) call BIS_fnc_itemType) select 1),false] call ExileClient_gui_loadoutDialog_updateLoadoutListBox;
		};
		true call ExileClient_gui_loadoutDialog_updateInventoryListBox;
	};
}
else 
{
	["ErrorTitleAndText", ["Whoops!", format ["Something went really wrong. Please tell a server admin that you have tried to purchase a loadout and tell them the code '%1'. Thank you!", _responseCode]]] call ExileClient_gui_toaster_addTemplateToast;
};