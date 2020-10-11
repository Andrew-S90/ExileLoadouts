class CfgLoadout
{
	class Settings
	{
		ServerName = "Survival";
		//NAME THIS SOMETHING UNIQUE!!! NO SPACES!
		//If someone loaded this up default they could get items/weapons not in your trader config on your server if you don't change this!
		
		MaxLoadouts = 5; //Maximum number of loadouts a player can have.
		
		BlockedItems[] = 
		{
			"G_Goggles_VR",
			"Exile_Item_Laptop",
			"Exile_Item_MobilePhone",
			"Exile_Item_Grinder",
			"Exile_Magazine_Battery",
			"Laserbatteries",
			"Exile_IteM_BaseCameraKit",
			"H_HelmetO_ViperSP_ghex_F",
			"H_HelmetO_ViperSP_hex_F",
			"NVGogglesB_blk_F",
			"NVGogglesB_grn_F",
			"NVGogglesB_gry_F",
			"Exile_Headgear_GasMask",
			"I_UAV_01_backpack_F",
			"launch_NLAW_F",
			"launch_RPG32_F",
			"launch_B_Titan_F",
			"launch_I_Titan_F",
			"launch_O_Titan_F",
			"launch_B_Titan_short_F",
			"launch_I_Titan_short_F",
			"launch_O_Titan_short_F",
			"launch_RPG32_ghex_F",
			"launch_RPG7_F",
			"launch_B_Titan_tna_F",
			"launch_B_Titan_short_tna_F",
			"launch_O_Titan_ghex_F",
			"launch_O_Titan_short_ghex_F",
			"launch_MRAWS_olive_F",
			"launch_MRAWS_olive_rail_F",
			"launch_MRAWS_green_F",
			"launch_MRAWS_green_rail_F",
			"launch_MRAWS_sand_F",
			"launch_MRAWS_sand_rail_F",
			"launch_O_Vorona_brown_F",
			"launch_O_Vorona_green_F",
			"RPG32_F",
			"RPG32_HE_F",
			"NLAW_F",
			"Titan_AA",
			"Titan_AP",
			"Titan_AT",
			"RPG7_F",
			"Vorona_HEAT",
			"Vorona_HE",
			"MRAWS_HEAT_F",
			"MRAWS_HE_F",
			"ATMine_Range_Mag",
			"SLAMDirectionalMine_Wire_Mag",
			"APERSMine_Range_Mag",
			"APERSBoundingMine_Range_Mag",
			"APERSTripMine_Wire_Mag",
			"ClaymoreDirectionalMine_Remote_Mag",
			"SatchelCharge_Remote_Mag",
			"DemoCharge_Remote_Mag",
			"IEDUrbanBig_Remote_Mag",
			"IEDLandBig_Remote_Mag",
			"IEDUrbanSmall_Remote_Mag",
			"IEDLandSmall_Remote_Mag",
			"TrainingMine_Mag",
			"B_HMG_01_F",
			"O_HMG_01_F",
			"I_HMG_01_F",
			"B_HMG_01_high_F",
			"O_HMG_01_high_F",
			"I_HMG_01_high_F",
			"B_HMG_01_A_F",
			"O_HMG_01_A_F",
			"I_HMG_01_A_F",
			"B_GMG_01_F",
			"O_GMG_01_F",
			"I_GMG_01_F",
			"B_GMG_01_high_F",
			"O_GMG_01_high_F",
			"I_GMG_01_high_F",
			"B_GMG_01_A_F",
			"O_GMG_01_A_F",
			"I_GMG_01_A_F",
			"B_static_AA_F",
			"O_static_AA_F",
			"I_static_AA_F",
			"B_static_AT_F",
			"O_static_AT_F",
			"I_static_AT_F",
			"B_Static_Designator_01_F",
			"O_Static_Designator_02_F",
			"B_T_Static_AA_F",
			"B_T_Static_AT_F",
			"B_T_GMG_01_F",
			"B_T_HMG_01_F",
			"B_HMG_01_support_F",
			"O_HMG_01_support_F",
			"I_HMG_01_support_F",
			"B_HMG_01_support_high_F",
			"O_HMG_01_support_high_F",
			"I_HMG_01_support_high_F",
			"Exile_Item_RepairKitWood",
			"Exile_Item_ConcreteGateKit",
			"Exile_Item_ConcreteFloorPortKit",
			"Exile_Item_ConcreteWallKit",
			"Exile_Item_ConcreteDoorKit",
			"Exile_Item_ConcreteFloorKit",
			"Exile_Item_RepairKitConcrete",
			"Exile_IteM_BaseCameraKit",
			"Exile_Item_BreachingCharge_Wood",
			"Exile_Item_RepairKitMetal",
			"Exile_Item_BreachingCharge_Metal",
			"Exile_Item_BreachingCharge_BigMomma",
			"Exile_Item_Knife",
			"Exile_Item_ThermalScannerPro",
			"Exile_Item_Rope",
			"Exile_Item_LightBulb",
			"Exile_Item_ExtensionCord",
			"Exile_Item_FuelCanisterEmpty",
			"Exile_Item_FuelCanisterFull",
			"Exile_Item_CamoTentKit",
			"Exile_Item_MetalWire",
			"Exile_Item_JunkMetal",
			"Exile_Item_MetalScrews",
			"Exile_Item_MetalBoard",
			"Exile_Item_MetalPole",
			"Exile_Item_Cement",
			"Exile_Item_Sand",
			"Exile_Item_PortableGeneratorKit",
			"Exile_Item_CodeLock",
			"Exile_Item_SafeKit",
			"Exile_Item_WorkBenchKit",
			"Exile_Item_WoodWallHalfKit",
			"Exile_Item_WoodWallKit",
			"Exile_Item_WaterCanisterDirtyWater",
			"Exile_Item_WoodFloorKit",
			"Exile_Item_WoodStairsKit",
			"Exile_Item_WoodWindowKit",
			"Exile_Item_WoodDoorwayKit",
			"Exile_Item_WooDDoorKit",
			"Exile_Item_WoodFloorPortKit",
			"Exile_IteM_WoodGateKit",
			"Exile_Item_Handsaw",
			"Exile_Item_Pliers",
			"Exile_Item_Foolbox",
			"Exile_Item_CordlessScrewdriver",
			"Exile_Item_FireExtinguisher",
			"Exile_Item_Hammer",
			"Exile_Item_OilCanister",
			"Exile_Item_Screwdriver",
			"Exile_Item_Shovel",
			"Exile_Item_Wrench",
			"Exile_Item_SleepingMat",
			"Exile_Item_ToiletPaper",
			"Exile_Item_ZipTie"
		};
	};
}; 
 
class CfgNetworkMessages
{
	class purchaseLoadoutRequest
	{
		module="system_trading";
		parameters[]=
		{
			"ARRAY",
			"ARRAY"
		};
	};

	class purchaseLoadoutResponse
	{
		module="system_trading";
		parameters[]=
		{
			"SCALAR",
			"SCALAR",
			"STRING",
			"BOOL"
		};
	};
};	


//**********

	class Locker
	{
	   targetType = 2;
	   target = "Exile_Locker";
		class Actions
		{
			class Loadout
			{
				title = "Player Loadout";
				condition = "player call ExileClient_util_world_isInTraderZone";
				action = "_this call ExileClient_gui_loadoutDialog_show";
			};
		};
	};