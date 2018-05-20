class CfgGroups
{
	class Empty
	{
		class Mission_comp_MilitaryStructures
		{
			class Mission_comp_MilitaryStructures_Camps
			{
				#include "compositions\BIS Small Jungle Camp.hpp"
				#include "compositions\BIS Small Recon Camp.hpp"
			};
		};
	};
	class West
	{
		side = 1;
		class BLU_F
		{
			class Infantry
			{
				// cost: ?.?
				class Mission_group_BN_InfSquad
				{
					side = 1;
					faction = "BLU_F";
					class Unit0	{side = 1; vehicle = "B_soldier_SL_F"; rank = "SERGEANT";};
					class Unit1	{side = 1; vehicle = "B_soldier_TL_F"; rank = "SERGEANT";};
					class Unit2	{side = 1; vehicle = "B_soldier_LAT_F"; rank = "CORPORAL";};
					class Unit3	{side = 1; vehicle = "B_soldier_AR_F"; rank = "CORPORAL";};
					class Unit4	{side = 1; vehicle = "B_soldier_GL_F"; rank = "PRIVATE";};
					class Unit5	{side = 1; vehicle = "B_soldier_M_F"; rank = "PRIVATE";};
					class Unit6 {side = 1; vehicle = "B_soldier_F"; rank = "PRIVATE";};
					class Unit7 {side = 1; vehicle = "B_medic_F"; rank = "PRIVATE";};
				};
				// cost: ?.?
				class Mission_group_BN_InfWeaponSquad
				{
					side = 1;
					faction = "BLU_F";
					class Unit0	{side = 1; vehicle = "B_soldier_SL_F"; rank = "SERGEANT";};
					class Unit1	{side = 1; vehicle = "B_soldier_M_F"; rank = "SERGEANT";};
					class Unit2	{side = 1; vehicle = "B_soldier_GL_F"; rank = "CORPORAL";};
					class Unit3	{side = 1; vehicle = "B_soldier_AR_F"; rank = "PRIVATE";};
					class Unit4	{side = 1; vehicle = "B_soldier_LAT_F"; rank = "PRIVATE";};
					class Unit5	{side = 1; vehicle = "B_soldier_A_F"; rank = "PRIVATE";};
					class Unit6 {side = 1; vehicle = "B_soldier_F"; rank = "PRIVATE";};
					class Unit7 {side = 1; vehicle = "B_medic_F"; rank = "PRIVATE";};
				};
				// cost: 6.5
				class Mission_group_BN_InfAssaultSquad
				{
					side = 1;
					faction = "BLU_F";
					class Unit0	{side = 1; vehicle = "B_soldier_SL_F"; rank = "SERGEANT";};
					class Unit1	{side = 1; vehicle = "B_HeavyGunner_F"; rank = "CORPORAL";};
					class Unit2	{side = 1; vehicle = "B_Sharpshooter_F"; rank = "CORPORAL";};
					class Unit3	{side = 1; vehicle = "B_soldier_AAR_F"; rank = "PRIVATE";};
					class Unit4	{side = 1; vehicle = "B_soldier_AR_F"; rank = "PRIVATE";};
					class Unit5	{side = 1; vehicle = "B_soldier_M_F"; rank = "PRIVATE";};
					class Unit6 {side = 1; vehicle = "B_soldier_LAT2_F"; rank = "PRIVATE";};
					class Unit7 {side = 1; vehicle = "B_medic_F"; rank = "PRIVATE";};
				};
				/*
				// cost: ?.?
				class Mission_group_BN_InfTeam
				{
					side = 1;
					faction = "BLU_F";
					class Unit0 {side = 1; vehicle = "B_soldier_TL_F"; rank = "SERGEANT";};
					class Unit1 {side = 1; vehicle = "B_soldier_AR_F"; rank = "CORPORAL";};
					class Unit2 {side = 1; vehicle = "B_soldier_GL_F"; rank = "PRIVATE";};
					class Unit3 {side = 1; vehicle = "B_soldier_F"; rank = "PRIVATE";};
				};
				// cost: 6.2
				class Mission_group_BN_InfTeamAt
				{
					name = $STR_A3_CfgGroups_West_BLU_F_Infantry_BUS_InfTeam_AT0;
					side = 1;
					faction = "BLU_F";
					class Unit0	{side = 1; vehicle = "B_soldier_TL_F"; rank = "SERGEANT";};
					class Unit1	{side = 1; vehicle = "B_soldier_F"; rank = "CORPORAL";};
					class Unit2	{side = 1; vehicle = "B_soldier_LAT_F"; rank = "PRIVATE";};
					class Unit3	{side = 1; vehicle = "B_soldier_LAT2_F"; rank = "PRIVATE";};
				};
				*/
				// cost: 2.5
				class Mission_group_BN_InfTeamMg
				{
					side = 1;
					faction = "BLU_F";
					class Unit0	{side = 1; vehicle = "B_soldier_TL_F"; rank = "SERGEANT";};
					class Unit1	{side = 1; vehicle = "B_HeavyGunner_F"; rank = "CORPORAL";};
					class Unit2	{side = 1; vehicle = "B_soldier_AR_F"; rank = "PRIVATE";};
					class Unit3	{side = 1; vehicle = "B_soldier_AAR_F"; rank = "PRIVATE";};
				}; 
				// cost: 2.2
				class Mission_group_BN_InfTeamMark
				{
					side = 1;
					faction = "BLU_F";
					class Unit0	{side = 1; vehicle = "B_soldier_TL_F"; rank = "SERGEANT";};
					class Unit1	{side = 1; vehicle = "B_Sharpshooter_F"; rank = "CORPORAL";};
					class Unit2	{side = 1; vehicle = "B_soldier_M_F"; rank = "PRIVATE";};
					class Unit3	{side = 1; vehicle = "B_soldier_M_F"; rank = "PRIVATE";};
				};                          
			};
			class Motorized
			{
				// cost: 9.7
				class Mission_group_BN_MrapHmg
				{
					side = 1;
					faction = "BLU_F";
					class Unit0	{side = 1; vehicle = "B_MRAP_01_hmg_F"; rank = "PRIVATE";};
				};
				// cost: 8.7
				class Mission_group_BN_MrapGmg
				{
					side = 1;
					faction = "BLU_F";
					class Unit0	{side = 1; vehicle = "B_MRAP_01_gmg_F"; rank = "PRIVATE";};
				};
			};
			class Mechanized
			{
				// cost: 16.5
				class Mission_group_BN_WheeledAfv
				{
					side = 1;
					faction = "BLU_F";
					class Unit0	{side = 1; vehicle = "B_AFV_Wheeled_01_cannon_F"; rank = "PRIVATE";};
				};
				// cost: 17.8
				class Mission_group_BN_WheeledApc
				{
					side = 1;
					faction = "BLU_F";
					class Unit0	{side = 1; vehicle = "B_APC_Wheeled_01_cannon_F"; rank = "PRIVATE";};
				};
			};
		};
		/*
		class Guerilla
		{
			class Infantry
			{
                // cost: 4.7
				class GS05_IRG_InfSquad
				{
					side = 1;
					faction = "BLU_G_F";
					class Unit0	{side = 1; vehicle = "B_G_soldier_SL_F"; rank = "SERGEANT";};
					class Unit1	{side = 1; vehicle = "B_G_medic_F"; rank = "CORPORAL";};
					class Unit2	{side = 1; vehicle = "B_G_Soldier_GL_F"; rank = "CORPORAL";};
					class Unit3	{side = 1; vehicle = "B_G_Soldier_AR_F"; rank = "PRIVATE";};
					class Unit4	{side = 1; vehicle = "B_G_Soldier_LAT_F"; rank = "PRIVATE";};
					class Unit5	{side = 1; vehicle = "B_G_Soldier_M_F"; rank = "PRIVATE";};
					class Unit6	{side = 1; vehicle = "B_G_Soldier_F"; rank = "PRIVATE";};
					class Unit7	{side = 1; vehicle = "B_G_Soldier_F"; rank = "PRIVATE";};
				};
                // cost: 3.3
				class GS05_IRG_InfTeam
				{
					side = 1;
					faction = "BLU_G_F";
					class Unit0	{side = 1; vehicle = "B_G_Soldier_TL_F"; rank = "CORPORAL";};
					class Unit1	{side = 1; vehicle = "B_G_Soldier_AR_F"; rank = "PRIVATE";};
					class Unit2	{side = 1; vehicle = "B_G_Soldier_LAT2_F"; rank = "PRIVATE";};
					class Unit3	{side = 1; vehicle = "B_G_Soldier_F"; rank = "PRIVATE";};
				};
                // cost: 2.5
				class GS05_IRG_InfTeam_MG
				{
					side = 1;
					faction = "BLU_G_F";
					class Unit0	{side = 1; vehicle = "B_G_Soldier_TL_F"; rank = "CORPORAL";};
					class Unit1	{side = 1; vehicle = "B_G_Soldier_AR_F"; rank = "PRIVATE";};
					class Unit2	{side = 1; vehicle = "B_G_Soldier_AR_F"; rank = "PRIVATE";};
					class Unit3	{side = 1; vehicle = "B_G_Soldier_A_F"; rank = "PRIVATE";};
				};
			};
		};
		*/
	};
	class East
	{
		side = 0;
		class OPF_F
		{
			class Infantry
			{
				// cost: 6.7
				class Mission_group_InfRiffleSquad
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_soldier_SL_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_soldier_TL_F"; rank = "SERGEANT";};
					class Unit2	{side = 0; vehicle = "O_soldier_AR_F"; rank = "CORPORAL";};
					class Unit3	{side = 0; vehicle = "O_soldier_LAT_F"; rank = "CORPORAL";};
					class Unit4	{side = 0; vehicle = "O_soldier_F"; rank = "PRIVATE";};
					class Unit5	{side = 0; vehicle = "O_soldier_M_F"; rank = "PRIVATE";};
					class Unit6	{side = 0; vehicle = "O_soldier_A_F"; rank = "PRIVATE";};
					class Unit7	{side = 0; vehicle = "O_medic_F"; rank = "PRIVATE";};
				};
				// cost: 6.6
				class Mission_group_OC_InfWeaponSquad
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_soldier_SL_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_soldier_M_F"; rank = "SERGEANT";};
					class Unit2	{side = 0; vehicle = "O_soldier_GL_F"; rank = "CORPORAL";};
					class Unit3	{side = 0; vehicle = "O_Soldier_HAT_F"; rank = "CORPORAL";};
					class Unit4	{side = 0; vehicle = "O_soldier_A_F"; rank = "PRIVATE";};
					class Unit5	{side = 0; vehicle = "O_soldier_AR_F"; rank = "PRIVATE";};
					class Unit6	{side = 0; vehicle = "O_Soldier_AHAT_F"; rank = "PRIVATE";};
					class Unit7	{side = 0; vehicle = "O_medic_F"; rank = "PRIVATE";};
				
				};
				// cost: 6.5
				class Mission_group_OC_InfAssaultSquad
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_soldier_SL_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_soldier_TL_F"; rank = "SERGEANT";};
					class Unit2	{side = 0; vehicle = "O_HeavyGunner_F"; rank = "CORPORAL";};
					class Unit3	{side = 0; vehicle = "O_Sharpshooter_F"; rank = "CORPORAL";};
					class Unit4	{side = 0; vehicle = "O_soldier_AR_F"; rank = "PRIVATE";};
					class Unit5	{side = 0; vehicle = "O_soldier_M_F"; rank = "PRIVATE";};
					class Unit6	{side = 0; vehicle = "O_soldier_LAT_F"; rank = "PRIVATE";};
					class Unit7	{side = 0; vehicle = "O_medic_F"; rank = "PRIVATE";};
				};
				// cost: 5.8
				class Mission_group_OC_InfTeamAt
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_soldier_TL_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_Soldier_HAT_F"; rank = "CORPORAL";};
					class Unit2	{side = 0; vehicle = "O_soldier_LAT_F"; rank = "PRIVATE";};
					class Unit3	{side = 0; vehicle = "O_Soldier_AHAT_F"; rank = "PRIVATE";};
				};
				// cost: 4.7
				class Mission_group_OC_InfTeam
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_soldier_TL_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_soldier_AR_F"; rank = "CORPORAL";};
					class Unit2	{side = 0; vehicle = "O_soldier_GL_F"; rank = "PRIVATE";};
					class Unit3	{side = 0; vehicle = "O_soldier_LAT_F"; rank = "PRIVATE";};
				};
				// cost: 2.5
				class Mission_group_OC_InfTeamMg
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_soldier_TL_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_HeavyGunner_F"; rank = "CORPORAL";};
					class Unit2	{side = 0; vehicle = "O_soldier_AR_F"; rank = "PRIVATE";};
					class Unit3	{side = 0; vehicle = "O_Soldier_AAR_F"; rank = "PRIVATE";};
				};
				// cost: 2.2
				class Mission_group_OC_InfTeamMark
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_soldier_TL_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_Sharpshooter_F"; rank = "CORPORAL";};
					class Unit2	{side = 0; vehicle = "O_soldier_M_F"; rank = "PRIVATE";};
					class Unit3	{side = 0; vehicle = "O_soldier_M_F"; rank = "PRIVATE";};
				};
				// cost: 7.1
				class Mission_group_OC_MotInfRiffleSquad
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_Truck_03_covered_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_soldier_TL_F"; rank = "CORPORAL";};
					class Unit2	{side = 0; vehicle = "O_soldier_AR_F"; rank = "CORPORAL";};
					class Unit3	{side = 0; vehicle = "O_soldier_LAT_F"; rank = "CORPORAL";};
					class Unit4	{side = 0; vehicle = "O_soldier_F"; rank = "PRIVATE";};
					class Unit5	{side = 0; vehicle = "O_soldier_M_F"; rank = "PRIVATE";};
					class Unit6	{side = 0; vehicle = "O_soldier_A_F"; rank = "PRIVATE";};
					class Unit7	{side = 0; vehicle = "O_medic_F"; rank = "PRIVATE";};
				};
				// cost: 7.0
				class Mission_group_OC_MotInfWeaponSquad
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_Truck_03_covered_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_soldier_M_F"; rank = "CORPORAL";};
					class Unit2	{side = 0; vehicle = "O_soldier_GL_F"; rank = "CORPORAL";};
					class Unit3	{side = 0; vehicle = "O_Soldier_HAT_F"; rank = "CORPORAL";};
					class Unit4	{side = 0; vehicle = "O_soldier_A_F"; rank = "PRIVATE";};
					class Unit5	{side = 0; vehicle = "O_soldier_AR_F"; rank = "PRIVATE";};
					class Unit6	{side = 0; vehicle = "O_Soldier_AHAT_F"; rank = "PRIVATE";};
					class Unit7	{side = 0; vehicle = "O_medic_F"; rank = "PRIVATE";};
				};
				// cost: 6.9
				class Mission_group_OC_MotInfAssaultSquad
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_Truck_03_covered_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_soldier_TL_F"; rank = "CORPORAL";};
					class Unit2	{side = 0; vehicle = "O_HeavyGunner_F"; rank = "CORPORAL";};
					class Unit3	{side = 0; vehicle = "O_Sharpshooter_F"; rank = "CORPORAL";};
					class Unit4	{side = 0; vehicle = "O_soldier_AR_F"; rank = "PRIVATE";};
					class Unit5	{side = 0; vehicle = "O_soldier_M_F"; rank = "PRIVATE";};
					class Unit6	{side = 0; vehicle = "O_soldier_LAT_F"; rank = "PRIVATE";};
					class Unit7	{side = 0; vehicle = "O_medic_F"; rank = "PRIVATE";};
				};
				// cost: 8.1
				class Mission_group_OC_MofInfViper
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_LSV_02_armed_viper_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_V_Soldier_JTAC_hex_F"; rank = "CORPORAL";};
					class Unit2	{side = 0; vehicle = "O_V_Soldier_hex_F"; rank = "PRIVATE";};
					class Unit3	{side = 0; vehicle = "O_V_Soldier_M_hex_F"; rank = "PRIVATE";};
					class Unit4	{side = 0; vehicle = "O_V_Soldier_Exp_hex_F"; rank = "PRIVATE";};
					class Unit5	{side = 0; vehicle = "O_V_Soldier_LAT_hex_F"; rank = "PRIVATE";};
					class Unit6	{side = 0; vehicle = "O_V_Soldier_Medic_hex_F"; rank = "PRIVATE";};
				};
			};
			class Motorized
			{
				// cost: 8.7
				class Mission_group_OC_mrapGmg
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_MRAP_02_gmg_F"; rank = "SERGEANT";};
				};
				// cost: 9.8
				class Mission_group_OC_mrapHmg
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_MRAP_02_hmg_F"; rank = "SERGEANT";};
				};
				// cost: 5.7
				class Mission_group_OC_ugvArmed
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_UGV_01_rcws_F"; rank = "PRIVATE";};
				};
			};
			class Mechanized
			{

				// cost: 20.4
				class Mission_group_OC_MechInfWheeledApcWeapon
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_APC_Wheeled_02_rcws_v2_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_soldier_M_F"; rank = "SERGEANT";};
					class Unit2	{side = 0; vehicle = "O_soldier_GL_F"; rank = "CORPORAL";};
					class Unit3	{side = 0; vehicle = "O_Soldier_HAT_F"; rank = "CORPORAL";};
					class Unit4	{side = 0; vehicle = "O_soldier_A_F"; rank = "PRIVATE";};
					class Unit5	{side = 0; vehicle = "O_soldier_AR_F"; rank = "PRIVATE";};
					class Unit6	{side = 0; vehicle = "O_Soldier_AHAT_F"; rank = "PRIVATE";};
					class Unit7	{side = 0; vehicle = "O_medic_F"; rank = "PRIVATE";};
				};
				// cost: 20.3
				class Mission_group_OC_MechInfWheeledApcAssault
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_APC_Wheeled_02_rcws_v2_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_soldier_TL_F"; rank = "SERGEANT";};
					class Unit2	{side = 0; vehicle = "O_HeavyGunner_F"; rank = "CORPORAL";};
					class Unit3	{side = 0; vehicle = "O_Sharpshooter_F"; rank = "CORPORAL";};
					class Unit4	{side = 0; vehicle = "O_soldier_AR_F"; rank = "PRIVATE";};
					class Unit5	{side = 0; vehicle = "O_soldier_M_F"; rank = "PRIVATE";};
					class Unit6	{side = 0; vehicle = "O_soldier_LAT_F"; rank = "PRIVATE";};
					class Unit7	{side = 0; vehicle = "O_medic_F"; rank = "PRIVATE";};
				};
				// cost: 22.9
				class Mission_group_OC_MechInfTrackedApcAt
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_APC_Tracked_02_cannon_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_Soldier_HAT_F"; rank = "CORPORAL";};
					class Unit2	{side = 0; vehicle = "O_Soldier_LAT_F"; rank = "PRIVATE";};
					class Unit3	{side = 0; vehicle = "O_Soldier_F"; rank = "PRIVATE";};
					class Unit4	{side = 0; vehicle = "O_Soldier_GL_F"; rank = "PRIVATE";};
				};
				// cost: 19.2
				class Mission_group_OC_MechInfTrackedApcMg
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_APC_Tracked_02_cannon_F"; rank = "SERGEANT";};
					class Unit1	{side = 0; vehicle = "O_HeavyGunner_F"; rank = "CORPORAL";};
					class Unit2	{side = 0; vehicle = "O_Soldier_AR_F"; rank = "PRIVATE";};
					class Unit3	{side = 0; vehicle = "O_Soldier_AR_F"; rank = "PRIVATE";};
					class Unit4	{side = 0; vehicle = "O_Soldier_AAR_F"; rank = "PRIVATE";};
				};
			};
			class Armored
			{
				// cost: 18.3
				class Mission_group_OC_MBTv1
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_MBT_02_cannon_F"; rank = "SERGEANT";};
				};
				// cost: 26.1
				class Mission_group_OC_MBTv2
				{
					side = 0;
					faction = "OPF_F";
					class Unit0	{side = 0; vehicle = "O_MBT_04_cannon_F"; rank = "SERGEANT";};
				};
			};	
		};
	};
};
