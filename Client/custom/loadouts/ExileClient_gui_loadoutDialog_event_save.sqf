 /*
 *
 * Author: Andrew_S90
 *
 * This work is protected by Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). 
 *
 */
ExileClientPlayerLoadout set [0,ExileClientPlayerLoadoutPrimary];
ExileClientPlayerLoadout set [1,ExileClientPlayerLoadoutSecondary];
ExileClientPlayerLoadout set [2,ExileClientPlayerLoadoutPistol];
ExileClientPlayerLoadout set [3,ExileClientPlayerLoadoutUniform];
ExileClientPlayerLoadout set [4,ExileClientPlayerLoadoutVest];
ExileClientPlayerLoadout set [5,ExileClientPlayerLoadoutBackpack];
ExileClientPlayerLoadout set [6,ExileClientPlayerLoadoutHeadgear];
ExileClientPlayerLoadout set [7,ExileClientPlayerLoadoutFacewear];
ExileClientPlayerLoadout set [8,ExileClientPlayerLoadoutBinocular];
ExileClientPlayerLoadout set [9,ExileClientPlayerLoadoutItems];

profileNamespace setVariable [format["ExileClientPlayerLoadout%1%2",ExileClientPlayerLoadoutServerName,ExileClientPlayerLoadoutNumber],ExileClientPlayerLoadout];
missionNamespace setVariable [format["ExileClientPlayerLoadout%1%2",ExileClientPlayerLoadoutServerName,ExileClientPlayerLoadoutNumber],ExileClientPlayerLoadout];
