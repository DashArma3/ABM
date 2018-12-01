class CfgPatches
{
	class Dash_AdvancedBreaching
	{
		units[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Weapons_F", "cba_xeh"};
	};
};

class CfgFunctions 
{
	class Dash
	{
		class AdvancedBreaching
		{
			file = "\Dash_AdvancedBreaching\functions";
			class AdvancedBreachingInit{};
		};
	};
};

class Extended_Init_EventHandlers
{
    class CAManBase
    {
        class AdvancedBreaching_Init_EH
        {
            init = "[_this select 0] call Dash_fnc_AdvancedBreachingInit";
        };
    };
};

class CfgAmmo
{
	class CUP_B_12Gauge_74Slug;
    class CUP_B_12Gauge_74Breaching: CUP_B_12Gauge_74Slug {};
};

class CfgMagazines {
    class CA_Magazine;

    /* CUP */

    class CUP_20Rnd_B_AA12_74Slug;
    class CUP_8Rnd_B_Saiga12_74Slug_M;
    class CUP_8Rnd_B_Beneli_74Slug;

    class CUP_20Rnd_B_AA12_74Breaching : CUP_20Rnd_B_AA12_74Slug {
        ammo = "CUP_B_12Gauge_74Breaching";
        descriptionShort = "20Rnd. AA12 Breaching";        
        displayName = "20Rnd. AA12 Breaching";
    };

    class CUP_8Rnd_B_Saiga12_74Breaching_M : CUP_8Rnd_B_Saiga12_74Slug_M {
        ammo = "CUP_B_12Gauge_74Breaching";
        descriptionShort = "8Rnd. Saiga 12K Breaching";        
        displayName = "8Rnd. Saiga 12K Breaching";
    };

    class CUP_8Rnd_B_Beneli_74Breaching : CUP_8Rnd_B_Beneli_74Slug {
        ammo = "CUP_B_12Gauge_74Breaching";
        descriptionShort = "8Rnd. M1014 Breaching";        
        displayName = "8Rnd. M1014 Breaching";
    };
};
