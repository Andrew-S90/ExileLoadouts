
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