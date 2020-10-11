 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
//_amountString = _amount call ExileClient_util_addCommas;
 
private ["_output", "_popTabsString", "_split", "_display"];
_output = [];
_popTabsString = _this call ExileClient_util_string_exponentToString;
 
 
_split = _popTabsString splitString "";
reverse _split;
 
{
    if((_forEachIndex%3==0) && (_forEachIndex!=0)) then {
        _output pushBack ",";
    };
    _output pushBack _x;
} forEach _split;
 
reverse _output;
_display = _output joinString "";
_display