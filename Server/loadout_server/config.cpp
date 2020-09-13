class CfgPatches
{
	class loadout_server
	{
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_server_config"};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgFunctions
{
	class loadout_server
	{
		class Bootstrap
		{
			file = "loadout_server\bootstrap";
			class preInit
			{
				preInit = 1;
			};
			class postInit
			{
				postInit = 1;
			};
		};
	};
};