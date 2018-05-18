class CfgGroups
{
	class West
	{
		name = $STR_A3_CfgGroups_West0;
		side = TWest;
		class BLU_F
		{
			name = $STR_A3_CfgGroups_West_BLU_F0;
			class Infantry
			{
				name = $STR_A3_CfgGroups_West_BLU_F_Infantry0;
                                // cost: 6.6
				class GS05_BUS_InfSquad
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_InfSquad0;
					side = TWest;
					faction = BLU_F;
					class Unit0	{side = TWest; vehicle = B_soldier_SL_F; rank = "SERGEANT";};
					class Unit1	{side = TWest; vehicle = B_medic_F; rank = "CORPORAL";};
					class Unit2	{side = TWest; vehicle = B_soldier_GL_F; rank = "CORPORAL";};
					class Unit3	{side = TWest; vehicle = B_soldier_AR_F; rank = "PRIVATE";};
					class Unit4	{side = TWest; vehicle = B_soldier_LAT_F; rank = "PRIVATE";};
					class Unit5	{side = TWest; vehicle = B_soldier_M_F; rank = "PRIVATE";};
					class Unit6 	{side = TWest; vehicle = B_soldier_F; rank = "PRIVATE";};
					class Unit7 	{side = TWest; vehicle = B_soldier_F; rank = "PRIVATE";};
				};
                                // cost: 4.4
				class GS05_BUS_InfTeam
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_InfSquad0;
					side = TWest;
					faction = BLU_F;
					class Unit0 	{side = TWest; vehicle = B_soldier_TL_F; rank = "CORPORAL";};
					class Unit1 	{side = TWest; vehicle = B_soldier_AR_F; rank = "PRIVATE";};
					class Unit2 	{side = TWest; vehicle = B_soldier_LAT_F; rank = "PRIVATE";};
					class Unit3 	{side = TWest; vehicle = B_soldier_F; rank = "PRIVATE";};
				};
                                // cost: 6.2
				class GS05_BUS_InfTeam_AT
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_InfTeam_AT0;
					side = TWest;
					faction = BLU_F;
					class Unit0	{side = TWest; vehicle = B_soldier_TL_F; rank = "CORPORAL";};
					class Unit1	{side = TWest; vehicle = B_soldier_F; rank = "PRIVATE";};
					class Unit2	{side = TWest; vehicle = B_soldier_LAT_F; rank = "PRIVATE";};
					class Unit3	{side = TWest; vehicle = B_soldier_LAT_F; rank = "PRIVATE";};
				};
                                // cost: 2.6
				class GS05_BUS_InfTeam_MG
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_InfSquad0;
					side = TWest;
					faction = BLU_F;
					class Unit0	{side = TWest; vehicle = B_soldier_TL_F; rank = "CORPORAL";};
					class Unit1	{side = TWest; vehicle = B_soldier_AR_F; rank = "PRIVATE";};
					class Unit2	{side = TWest; vehicle = B_soldier_AR_F; rank = "PRIVATE";};
					class Unit3	{side = TWest; vehicle = B_soldier_AAR_F; rank = "PRIVATE";};
				};
                                /*
                                // cost: 6.9
				class GS05_BUS_InfTeam_Sniper
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_SniperTeam0;
					side = TWest;
					faction = BLU_F;
					class Unit0	{side = TWest; vehicle = B_spotter_F; rank = "SERGEANT";};
					class Unit1	{side = TWest; vehicle = B_sniper_F; rank = "CORPORAL";};
					class Unit2	{side = TWest; vehicle = B_sniper_F; rank = "CORPORAL";};
					class Unit3	{side = TWest; vehicle = B_sniper_F; rank = "CORPORAL";};
				};
                                */                                
			};
			class Motorized
			{
				class GS05_BUS_HunterHMG
				{
					side = TWest;
					faction = BLU_F;
					class Unit0	{side = TWest; vehicle = B_MRAP_01_hmg_F; rank = "PRIVATE";};
				};
			};
			class Mechanized
			{
				class GS05_BUS_Panther
				{
					side = TWest;
					faction = BLU_F;
					class Unit0	{side = TWest; vehicle = B_APC_Tracked_01_rcws_F; rank = "PRIVATE";};
				};
			};
		};
		class Guerilla
		{
			name = $STR_A3_cfggroups_Indep_Guerilla0;
			class Infantry
			{
				name = $STR_A3_cfggroups_West_BLU_F_Infantry0;
                                // cost: 4.7
				class GS05_IRG_InfSquad
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_InfSquad0;
					side = TWest;
					faction = BLU_G_F;
					class Unit0	{side = TWest; vehicle = B_G_soldier_SL_F; rank = "SERGEANT";};
					class Unit1	{side = TWest; vehicle = B_G_medic_F; rank = "CORPORAL";};
					class Unit2	{side = TWest; vehicle = B_G_Soldier_GL_F; rank = "CORPORAL";};
					class Unit3	{side = TWest; vehicle = B_G_Soldier_AR_F; rank = "PRIVATE";};
					class Unit4	{side = TWest; vehicle = B_G_Soldier_LAT_F; rank = "PRIVATE";};
					class Unit5	{side = TWest; vehicle = B_G_Soldier_M_F; rank = "PRIVATE";};
					class Unit6	{side = TWest; vehicle = B_G_Soldier_F; rank = "PRIVATE";};
					class Unit7	{side = TWest; vehicle = B_G_Soldier_F; rank = "PRIVATE";};
				};
                                // cost: 3.3
				class GS05_IRG_InfTeam
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_InfTeam_AT0;
					side = TWest;
					faction = BLU_G_F;
					class Unit0	{side = TWest; vehicle = B_G_Soldier_TL_F; rank = "CORPORAL";};
					class Unit1	{side = TWest; vehicle = B_G_Soldier_AR_F; rank = "PRIVATE";};
					class Unit2	{side = TWest; vehicle = B_G_Soldier_LAT_F; rank = "PRIVATE";};
					class Unit3	{side = TWest; vehicle = B_G_Soldier_F; rank = "PRIVATE";};
				};
                                // cost: 2.5
				class GS05_IRG_InfTeam_MG
				{
					name = $STR_A3_cfggroups_West_BLU_F_Infantry_BUS_SniperTeam0;
					side = TWest;
					faction = BLU_G_F;
					class Unit0	{side = TWest; vehicle = B_G_Soldier_TL_F; rank = "CORPORAL";};
					class Unit1	{side = TWest; vehicle = B_G_Soldier_AR_F; rank = "PRIVATE";};
					class Unit2	{side = TWest; vehicle = B_G_Soldier_AR_F; rank = "PRIVATE";};
					class Unit3	{side = TWest; vehicle = B_G_Soldier_A_F; rank = "PRIVATE";};
				};
			};
		};
	};
	class Indep
	{
		name = $STR_A3_CfgGroups_Indep0;
		side = TGuerrila;
		class IND_F
		{
			name = $STR_A3_CfgGroups_Indep_IND_F0;
			class Infantry
			{
				name = $STR_A3_CfgGroups_West_BLU_F_Infantry0;
                                // cost: 4.4
				class GS05_HAF_InfTeam
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_InfSquad0;
					side = TGuerrila;
					faction = IND_F;
					class Unit0	{side = TGuerrila; vehicle = I_Soldier_TL_F; rank = "CORPORAL";};
					class Unit1	{side = TGuerrila; vehicle = I_Soldier_AR_F; rank = "PRIVATE";};
					class Unit2	{side = TGuerrila; vehicle = I_soldier_LAT_F; rank = "PRIVATE";};
					class Unit3	{side = TGuerrila; vehicle = I_soldier_F; rank = "PRIVATE";};
				};                                
                                // cost: 5.4
				class GS05_HAF_InfSquad6A
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_InfSquad0;
					side = TGuerrila;
					faction = IND_F;
					class Unit0	{side = TGuerrila; vehicle = I_soldier_TL_F; rank = "SERGEANT";};
					class Unit1	{side = TGuerrila; vehicle = I_medic_F; rank = "CORPORAL";};
					class Unit2	{side = TGuerrila; vehicle = I_Soldier_AR_F; rank = "PRIVATE";};
					class Unit3	{side = TGuerrila; vehicle = I_soldier_LAT_F; rank = "PRIVATE";};
					class Unit4	{side = TGuerrila; vehicle = I_soldier_F; rank = "PRIVATE";};
					class Unit5	{side = TGuerrila; vehicle = I_Soldier_A_F; rank = "PRIVATE";};
				};
                                // cost: 5.5
				class GS05_HAF_InfSquad6B
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_InfSquad0;
					side = TGuerrila;
					faction = IND_F;
					class Unit0	{side = TGuerrila; vehicle = I_soldier_TL_F; rank = "SERGEANT";};
					class Unit1	{side = TGuerrila; vehicle = I_Soldier_GL_F; rank = "CORPORAL";};
					class Unit2	{side = TGuerrila; vehicle = I_Soldier_AR_F; rank = "PRIVATE";};
					class Unit3	{side = TGuerrila; vehicle = I_soldier_LAT_F; rank = "PRIVATE";};
					class Unit4	{side = TGuerrila; vehicle = I_soldier_F; rank = "PRIVATE";};
					class Unit5	{side = TGuerrila; vehicle = I_Soldier_A_F; rank = "PRIVATE";};
				};
                                // cost: 5.3
				class GS05_HAF_InfSquad6C
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_InfTeam_AT0;
					side = TGuerrila;
					faction = IND_F;
					class Unit0	{side = TGuerrila; vehicle = I_soldier_TL_F; rank = "SERGEANT";};
					class Unit1	{side = TGuerrila; vehicle = I_Soldier_M_F; rank = "CORPORAL";};
					class Unit2	{side = TGuerrila; vehicle = I_Soldier_AR_F; rank = "PRIVATE";};
					class Unit3	{side = TGuerrila; vehicle = I_soldier_LAT_F; rank = "PRIVATE";};
					class Unit4	{side = TGuerrila; vehicle = I_soldier_F; rank = "PRIVATE";};
					class Unit5	{side = TGuerrila; vehicle = I_Soldier_A_F; rank = "PRIVATE";};                                                                                
				};
			};
			class Motorized
			{
				name = $STR_A3_CfgGroups_West_BLU_F_Motorized0;
                                // cost: 13.3
				class GS05_HAF_MotInf_Team_GMG
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Motorized_BUS_MotInf_Team0;
					side = TGuerrila;
					faction = IND_F;
					class Unit0	{side = TGuerrila; vehicle = I_MRAP_03_gmg_F; rank = "PRIVATE";};
				};
                                // cost: 11.8
				class GS05_HAF_MotInf_Team_HMG
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Motorized_BUS_MotInf_Team0;
					side = TGuerrila;
					faction = IND_F;
					class Unit0	{side = TGuerrila; vehicle = I_MRAP_03_hmg_F; rank = "PRIVATE";};
				};
                                /*
                                // cost: 6.9
				class GS05_HAF_MotInf_Team_Truck
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_InfTeam_AT0;
					side = TGuerrila;
					faction = IND_F;
					class Unit0	{side = TGuerrila; vehicle = I_Soldier_SL_F; rank = "SERGEANT";};
					class Unit1	{side = TGuerrila; vehicle = I_medic_F; rank = "CORPORAL";};
					class Unit2	{side = TGuerrila; vehicle = I_Soldier_GL_F; rank = "CORPORAL";};
					class Unit3	{side = TGuerrila; vehicle = I_Soldier_AR_F; rank = "PRIVATE";};
					class Unit4	{side = TGuerrila; vehicle = I_soldier_LAT_F; rank = "PRIVATE";};
					class Unit5     {side = TGuerrila; vehicle = I_soldier_F; rank = "PRIVATE";};
					class Unit6     {side = TGuerrila; vehicle = I_soldier_F; rank = "PRIVATE";};                                                                                
					class Unit7     {side = TGuerrila; vehicle = I_Truck_02_covered_F; rank = "PRIVATE";};                                                                                                                                                                
				};
                                */                                
			};
		};
	};
};
