 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLoadoutDialog", displayNull];
_warningCheckbox = _dialog displayCtrl 2027;
if (cbChecked _warningCheckbox) then
{
	ExileClientPlayerLoadoutWarnings = true;
	profileNamespace setVariable ["ExileClientPlayerLoadoutWarnings",true];
}
else
{
	ExileClientPlayerLoadoutWarnings = false;
	profileNamespace setVariable ["ExileClientPlayerLoadoutWarnings",false];
};