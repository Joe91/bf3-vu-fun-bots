class('WeaponList')

require('__shared/WeaponClass')
require('__shared/Config')
require('__shared/Constants/WeaponTypes')
require('__shared/WeaponLists/CustomWeaponsAssault')
require('__shared/WeaponLists/CustomWeaponsEngineer')
require('__shared/WeaponLists/CustomWeaponsRecon')
require('__shared/WeaponLists/CustomWeaponsSupport')

local m_Logger = Logger("WeaponList", Debug.Shared.MODIFICATIONS)

-- create globals
AllWeapons = {}
KnifeWeapons = {}
PistoWeapons = {}

AssaultPrimary = {}
AssaultPistol = {}
AssaultKnife = {}
AssaultGadget1 = {}
AssaultGadget2 = {}
AssaultGrenade = {}
EngineerPrimary = {}
EngineerPistol = {}
EngineerKnife = {}
EngineerGadget1 = {}
EngineerGadget2 = {}
EngineerGrenade = {}
SupportPrimary = {}
SupportPistol = {}
SupportKnife = {}
SupportGadget1 = {}
SupportGadget2 = {}
SupportGrenade = {}
ReconPrimary = {}
ReconPistol = {}
ReconKnife = {}
ReconGadget1 = {}
ReconGadget2 = {}
ReconGrenade = {}

function WeaponList:__init()
	self._weapons = {}
	local s_Weapon = nil

	---------------------------
	-- shotguns
	s_Weapon = Weapon('DAO-12_Flechette', '', {'Weapons/DAO-12/U_DAO-12_Flechette', 'Kobra', 'ExtendedMag'}, WeaponTypes.Shotgun, 'Weapons/DAO-12/U_DAO-12')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('DAO-12_Frag', '', {'Weapons/DAO-12/U_DAO-12_Frag', 'Kobra', 'ExtendedMag'}, WeaponTypes.Shotgun, 'Weapons/DAO-12/U_DAO-12')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('DAO-12_Slug', '', {'Weapons/DAO-12/U_DAO-12_Slug', 'Kobra', 'TargetPointer'}, WeaponTypes.Shotgun, 'Weapons/DAO-12/U_DAO-12')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Jackhammer_Flechette', 'XP1', {'Weapons/XP1_Jackhammer/U_Jackhammer_Flechette', 'Kobra', 'ExtendedMag', 'Weapons/XP1_Jackhammer/U_JACKHAMMER_CAMO_1'}, WeaponTypes.Shotgun, 'Weapons/XP1_Jackhammer/U_Jackhammer')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Jackhammer_Frag', 'XP1', {'Weapons/XP1_Jackhammer/U_Jackhammer_Frag', 'Kobra', 'ExtendedMag', 'Weapons/XP1_Jackhammer/U_JACKHAMMER_CAMO_2'}, WeaponTypes.Shotgun, 'Weapons/XP1_Jackhammer/U_Jackhammer')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Jackhammer_Slug', 'XP1', {'Weapons/XP1_Jackhammer/U_Jackhammer_Slug', 'Kobra', 'TargetPointer', 'Weapons/XP1_Jackhammer/U_JACKHAMMER_CAMO_1'}, WeaponTypes.Shotgun, 'Weapons/XP1_Jackhammer/U_Jackhammer')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Saiga20_Flechette', '', {'Weapons/SAIGA20K/U_Saiga_20k_Flechette', 'Kobra', 'ExtendedMag'}, WeaponTypes.Shotgun, 'Weapons/SAIGA20K/U_SAIGA_20K')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Saiga20_Frag', '', {'Weapons/SAIGA20K/U_Saiga_20k_Frag', 'Kobra', 'ExtendedMag'}, WeaponTypes.Shotgun, 'Weapons/SAIGA20K/U_SAIGA_20K')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Saiga20_Slug', '', {'Weapons/SAIGA20K/U_Saiga_20k_Slug', 'Kobra', 'ExtendedMag'}, WeaponTypes.Shotgun, 'Weapons/SAIGA20K/U_SAIGA_20K')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SPAS12_Flechette', 'XP2', {'Weapons/XP2_SPAS12/U_SPAS12_Flechette', 'Kobra', 'ExtendedMag'}, WeaponTypes.Shotgun, 'Weapons/XP2_SPAS12/U_SPAS12')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SPAS12_Frag', 'XP2', {'Weapons/XP2_SPAS12/U_SPAS12_Frag', 'Kobra', 'ExtendedMag'}, WeaponTypes.Shotgun, 'Weapons/XP2_SPAS12/U_SPAS12')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SPAS12_Slug', 'XP2', {'Weapons/XP2_SPAS12/U_SPAS12_Slug', 'Kobra', 'ExtendedMag'}, WeaponTypes.Shotgun, 'Weapons/XP2_SPAS12/U_SPAS12')--TODO: Get Damage-Values and Speed of other ammo
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('USAS-12_Flechette', '', {'Weapons/USAS-12/U_USAS-12_Flechette', 'ExtendedMag', 'Kobra'}, WeaponTypes.Shotgun, 'Weapons/USAS-12/U_USAS-12')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('USAS-12_Frag', '', {'Weapons/USAS-12/U_USAS-12_Frag', 'ExtendedMag', 'Kobra'}, WeaponTypes.Shotgun, 'Weapons/USAS-12/U_USAS-12')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('USAS-12_Slug', '', {'Weapons/USAS-12/U_USAS-12_Slug', 'ExtendedMag', 'Kobra'}, WeaponTypes.Shotgun, 'Weapons/USAS-12/U_USAS-12')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M1014_Flechette', '', {'Weapons/M1014/U_M1014_Flechette', 'ExtendedMag', 'RX01'}, WeaponTypes.Shotgun, 'Weapons/M1014/U_M1014')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M1014_Frag', '', {'Weapons/M1014/U_M1014_Frag', 'ExtendedMag', 'RX01'}, WeaponTypes.Shotgun, 'Weapons/M1014/U_M1014')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M1014_Slug', '', {'Weapons/M1014/U_M1014_Slug', 'ExtendedMag', 'RX01'}, WeaponTypes.Shotgun, 'Weapons/M1014/U_M1014')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('870M_Flechette', '', {'Weapons/Remington870/U_870_Flechette', 'ExtendedMag', 'RX01'}, WeaponTypes.Shotgun, 'Weapons/Remington870/U_870')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('870M_Frag', '', {'Weapons/Remington870/U_870_Frag', 'ExtendedMag', 'RX01'}, WeaponTypes.Shotgun, 'Weapons/Remington870/U_870')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('870M_Slug', '', {'Weapons/Remington870/U_870_Slug', 'ExtendedMag', 'RX01'}, WeaponTypes.Shotgun, 'Weapons/Remington870/U_870')
	table.insert(self._weapons, s_Weapon)

	---------------------------
	--assault
	s_Weapon = Weapon('AEK971_Kobra', '', {'Kobra', 'Weapons/Common/NoSecondaryRail', 'Flashsuppressor'}, WeaponTypes.Assault, 'Weapons/AEK971/U_AEK971')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('AEK971_RX01', '', {'RX01', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Assault, 'Weapons/AEK971/U_AEK971')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('AN94_Kobra', '', {'Kobra', 'Foregrip', 'Flashsuppressor'}, WeaponTypes.Assault, 'Weapons/AN94/U_AN94')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('AN94_RX01', '', {'RX01', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Assault, 'Weapons/AN94/U_AN94')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('AK74M_Kobra', '', {'Kobra', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Assault, 'Weapons/AK74M/U_AK74M')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('AK74M_RX01', '', {'RX_01', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Assault, 'Weapons/AK74M/U_AK74M')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SteyrAug_RX01', 'XP2', {'RX01', 'Foregrip', 'Heavy_Barrel'},WeaponTypes.Assault, 'Weapons/XP2_SteyrAug/U_SteyrAug')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SteyrAug_Kobra', 'XP2', {'Kobra', 'Foregrip', 'Heavy_Barrel'},WeaponTypes.Assault, 'Weapons/XP2_SteyrAug/U_SteyrAug')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('F2000_RX01', '', {'RX01', 'Foregrip', 'Heavy_Barrel', 'Weapons/F2000/U_F2000_Camo_NWU'},WeaponTypes.Assault, 'Weapons/F2000/U_F2000')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('F2000_Kobra', '', {'Kobra', 'Foregrip', 'Heavy_Barrel', 'Weapons/F2000/U_F2000_Camo_PARTIZAN'},WeaponTypes.Assault, 'Weapons/F2000/U_F2000')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('FAMAS_RX01', 'XP1', {'RX01', 'Foregrip', 'HeavyBarrel'}, WeaponTypes.Assault, 'Weapons/XP1_FAMAS/U_FAMAS')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('FAMAS_Kobra', 'XP1', {'Kobra', 'Foregrip', 'HeavyBarrel'}, WeaponTypes.Assault, 'Weapons/XP1_FAMAS/U_FAMAS')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('G3A3_RX01', '', {'RX01', 'Target_Pointer', 'Foregrip'}, WeaponTypes.Assault, 'Weapons/G3A3/U_G3A3')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('G3A3_Kobra', '', {'Kobra', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Assault, 'Weapons/G3A3/U_G3A3')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('KH2002_Kobra', '', {'Kobra', 'Foregrip', 'Heavy_Barrel'}, WeaponTypes.Assault, 'Weapons/KH2002/U_KH2002')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('KH2002_RX01', '', {'RX01', 'Foregrip', 'Heavy_Barrel'}, WeaponTypes.Assault, 'Weapons/KH2002/U_KH2002')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('L85A2_RX01', 'XP1', {'RX01', 'HeavyBarrel', 'ForeGrip', 'Weapons/XP1_L85A2/U_L85A2_CAMO_1'},WeaponTypes.Assault, 'Weapons/XP1_L85A2/U_L85A2')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('L85A2_Kobra', 'XP1', {'Kobra', 'HeavyBarrel', 'ForeGrip', 'Weapons/XP1_L85A2/U_L85A2_CAMO_2'},WeaponTypes.Assault, 'Weapons/XP1_L85A2/U_L85A2')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M16A4_RX01', '', {'RX01', 'HeavyBarrel', 'Weapons/Common/NoSecondaryRail'}, WeaponTypes.Assault, 'Weapons/M16A4/U_M16A4')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M16A4_Kobra', '', {'Kobra', 'HeavyBarrel', 'Weapons/Common/NoSecondaryRail'}, WeaponTypes.Assault, 'Weapons/M16A4/U_M16A4')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M16-Burst_RX01', '', {'Weapons/M16A4/U_M16A4_RX01', 'Weapons/M16A4/U_M16A4_HeavyBarrel', 'Weapons/M16A4/U_M16A4_Foregrip'}, WeaponTypes.Assault, 'Weapons/M16A4/U_M16_Burst')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M16-Burst_Kobra', '', {'Weapons/M16A4/U_M16A4_Kobra', 'Weapons/M16A4/U_M16A4_HeavyBarrel', 'Weapons/M16A4/U_M16A4_Foregrip'}, WeaponTypes.Assault, 'Weapons/M16A4/U_M16_Burst')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M416_RX01', '', {'RX01', 'HeavyBarrel', 'Foregrip', 'Weapons/M416/U_M416_CAMO_1'},WeaponTypes.Assault, 'Weapons/M416/U_M416')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M416_Kobra', '', {'Kobra', 'HeavyBarrel', 'Foregrip', 'Weapons/M416/U_M416_CAMO_2'},WeaponTypes.Assault, 'Weapons/M416/U_M416')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SCAR-L_EOTech', 'XP2', {'EOTech', 'Foregrip', 'HeavyBarrel'},WeaponTypes.Assault, 'Weapons/XP2_SCAR-L/U_SCAR-L')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('SCAR-L_Kobra', 'XP2', {'Kobra', 'Foregrip', 'HeavyBarrel'},WeaponTypes.Assault, 'Weapons/XP2_SCAR-L/U_SCAR-L')
	table.insert(self._weapons, s_Weapon)


	---------------------------
	-- PDW --------------------
	s_Weapon = Weapon('ASVal_Kobra', '', {'Kobra', 'ExtendedMag', 'NoSecondaryAccessory'}, WeaponTypes.PDW, 'Weapons/ASVal/U_ASVal')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('ASVal_RX01', '', {'RX01', 'ExtendedMag', 'NoSecondaryAccessory'}, WeaponTypes.PDW, 'Weapons/ASVal/U_ASVal')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('MP7_RX01', '', {'RX01', 'ExtendedMag', 'Targetpointer'}, WeaponTypes.PDW, 'Weapons/MP7/U_MP7')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('MP7_Kobra', '', {'Kobra', 'ExtendedMag', 'Targetpointer'}, WeaponTypes.PDW, 'Weapons/MP7/U_MP7')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('P90_RX01', '', {'RX01', 'Targetpointer', 'Flashsuppressor'}, WeaponTypes.PDW, 'Weapons/P90/U_P90')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('P90_Kobra', '', {'Kobra', 'Targetpointer', 'Flashsuppressor'}, WeaponTypes.PDW, 'Weapons/P90/U_P90')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('PP-19_Kobra', 'XP1', {'Kobra', 'FlashSuppressor', 'Targetpointer', 'Weapons/XP1_PP-19/U_PP-19_CAMO_2'}, WeaponTypes.PDW, 'Weapons/XP1_PP-19/U_PP-19')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('PP-19_RX01', 'XP1', {'RX01', 'FlashSuppressor', 'Targetpointer', 'Weapons/XP1_PP-19/U_PP-19_CAMO_1'}, WeaponTypes.PDW, 'Weapons/XP1_PP-19/U_PP-19')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('PP2000_Kobra', '', {'Kobra', 'Flashsuppressor', 'Targetpointer'}, WeaponTypes.PDW, 'Weapons/PP2000/U_PP2000')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('PP2000_RX01', '', {'RX01', 'Flashsuppressor', 'Targetpointer'}, WeaponTypes.PDW, 'Weapons/PP2000/U_PP2000')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('UMP45_RX01', '', {'RX01', 'Flashsuppressor', 'Targetpointer', 'Weapons/UMP45/U_UMP45_CAMO_1'}, WeaponTypes.PDW, 'Weapons/UMP45/U_UMP45')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('UMP45_Kobra', '', {'Kobra', 'Flashsuppressor', 'Targetpointer', 'Weapons/UMP45/U_UMP45_CAMO_2'}, WeaponTypes.PDW, 'Weapons/UMP45/U_UMP45')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('MP5K_RX01', 'XP2', {'RX01', 'Flashsuppressor', 'ExtendedMags'}, WeaponTypes.PDW, 'Weapons/XP2_MP5K/U_MP5K')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('MP5K_Kobra', 'XP2', {'Kobra', 'Flashsuppressor', 'ExtendedMags'}, WeaponTypes.PDW, 'Weapons/XP2_MP5K/U_MP5K')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('MagpulPDR_Kobra', '', {'Kobra', 'Flashsuppressor', 'Targetpointer'}, WeaponTypes.PDW, 'Weapons/MagpulPDR/U_MagpulPDR')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('MagpulPDR_RX01', '', {'RX01', 'Flashsuppressor', 'Targetpointer'}, WeaponTypes.PDW, 'Weapons/MagpulPDR/U_MagpulPDR')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Crossbow_Kobra', '', {}, WeaponTypes.PDW, 'Weapons/XP4_Crossbow_Prototype/U_Crossbow_Scoped_Cobra')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Crossbow_RifleScope', '', {}, WeaponTypes.PDW, 'Weapons/XP4_Crossbow_Prototype/U_Crossbow_Scoped_RifleScope')
	table.insert(self._weapons, s_Weapon)

	---------------------------
	--Carbines
	s_Weapon = Weapon('A91_Kobra', '', {'Kobra', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Carabine, 'Weapons/A91/U_A91')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('A91_RX01', '', {'RX01', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Carabine, 'Weapons/A91/U_A91')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('ACR_RX01', 'XP2', {'RX01', 'HeavyBarrel', 'Foregrip', 'Weapons/XP2_ACR/U_ACR_CAMO_1'}, WeaponTypes.Carabine, 'Weapons/XP2_ACR/U_ACR')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('ACR_Kobra', 'XP2', {'Kobra', 'HeavyBarrel', 'Foregrip', 'Weapons/XP2_ACR/U_ACR_CAMO_2'}, WeaponTypes.Carabine, 'Weapons/XP2_ACR/U_ACR')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('AKS74u_Kobra', '', {'Kobra', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Carabine, 'Weapons/AKS74u/U_AKS74u')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('AKS74u_RX01', '', {'RX01', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Carabine, 'Weapons/AKS74u/U_AKS74u')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('G36C_RX01', '', {'RX01', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Carabine, 'Weapons/G36C/U_G36C')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('G36C_Kobra', '', {'Kobra', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Carabine, 'Weapons/G36C/U_G36C')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('HK53_RX01', 'XP1', {'RX01', 'HeavyBarrel', 'Foregrip', 'Weapons/XP1_HK53/U_HK53_CAMO_1'}, WeaponTypes.Carabine, 'Weapons/XP1_HK53/U_HK53')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('HK53_Kobra', 'XP1', {'Kobra', 'HeavyBarrel', 'Foregrip', 'Weapons/XP1_HK53/U_HK53_CAMO_2'}, WeaponTypes.Carabine, 'Weapons/XP1_HK53/U_HK53')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M4A1_RX01', '', {'RX01', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Carabine, 'Weapons/M4A1/U_M4A1')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M4A1_Kobra', '', {'Kobra', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Carabine, 'Weapons/M4A1/U_M4A1')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M4_RX01', '', {'RX01', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Carabine, 'Weapons/M4A1/U_M4')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M4_Kobra', '', {'Kobra', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Carabine, 'Weapons/M4A1/U_M4')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('MTAR_RX01', 'XP2', {'RX01', 'HeavyBarrel', 'Foregrip', 'Weapons/XP2_MTAR/U_MTAR_CAMO_1'}, WeaponTypes.Carabine, 'Weapons/XP2_MTAR/U_MTAR')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('MTAR_Kobra', 'XP2', {'Kobra', 'HeavyBarrel', 'Foregrip', 'Weapons/XP2_MTAR/U_MTAR_CAMO_2'}, WeaponTypes.Carabine, 'Weapons/XP2_MTAR/U_MTAR')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('QBZ-95B_Kobra', 'XP1', {'Kobra', 'HeavyBarrel', 'TargetPointer'}, WeaponTypes.Carabine, 'Weapons/XP1_QBZ-95B/U_QBZ-95B')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('QBZ-95B_RX01', 'XP1', {'RX01', 'HeavyBarrel', 'TargetPointer'}, WeaponTypes.Carabine, 'Weapons/XP1_QBZ-95B/U_QBZ-95B')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SCAR-H_EOTech', '', {'EOTech', 'HeavyBarrel','Foregrip', 'Weapons/SCAR-H/U_SCAR-H_CAMO_DSRTTIGER'}, WeaponTypes.Carabine, 'Weapons/SCAR-H/U_SCAR-H')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('SCAR-H_Kobra', '', {'Kobra', 'HeavyBarrel','Foregrip', 'Weapons/SCAR-H/U_SCAR-H_CAMO_BERKUT'}, WeaponTypes.Carabine, 'Weapons/SCAR-H/U_SCAR-H')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SG553LB_Kobra', '', {'Kobra', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Carabine, 'Weapons/SG553LB/U_SG553LB')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('SG553LB_RX01', '', {'RX01', 'HeavyBarrel', 'Foregrip'}, WeaponTypes.Carabine, 'Weapons/SG553LB/U_SG553LB')
	table.insert(self._weapons, s_Weapon)

	---------------------------
	--LMG
	s_Weapon = Weapon('L86_RX01', 'XP2', {'RX01', 'HeavyBarrel', 'Foregrip'},WeaponTypes.LMG, 'Weapons/XP2_L86/U_L86')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('L86_Kobra', 'XP2', {'Kobra', 'HeavyBarrel', 'Foregrip'},WeaponTypes.LMG, 'Weapons/XP2_L86/U_L86')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('LSAT_RX01', 'XP2', {'RX01', 'HeavyBarrel', 'Foregrip', 'Weapons/XP2_LSAT/U_LSAT_CAMO_1'},WeaponTypes.LMG, 'Weapons/XP2_LSAT/U_LSAT')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('LSAT_Kobra', 'XP2', {'Kobra', 'HeavyBarrel', 'Foregrip', 'Weapons/XP2_LSAT/U_LSAT_CAMO_2'},WeaponTypes.LMG, 'Weapons/XP2_LSAT/U_LSAT')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M249_RX01', '', {'RX01', 'ExtendedMag', 'Foregrip'},WeaponTypes.LMG, 'Weapons/M249/U_M249')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M249_Kobra', '', {'Kobra', 'ExtendedMag', 'Foregrip'},WeaponTypes.LMG, 'Weapons/M249/U_M249')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M27IAR_RX01', '', {'RX01', 'HeavyBarrel', 'Foregrip'},WeaponTypes.LMG, 'Weapons/M27IAR/U_M27IAR')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M27IAR_Kobra', '', {'Kobra', 'HeavyBarrel', 'Foregrip'},WeaponTypes.LMG, 'Weapons/M27IAR/U_M27IAR')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M60_EOTech', '', {'EOTech', 'Foregrip', 'TargetPointer'}, WeaponTypes.LMG, 'Weapons/M60/U_M60')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M60_Kobra', '', {'Kobra', 'Foregrip', 'TargetPointer'}, WeaponTypes.LMG, 'Weapons/M60/U_M60')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('MG36_RX01', 'XP1', {'RX01', 'Foregrip', 'HeavyBarrel'}, WeaponTypes.LMG, 'Weapons/XP1_MG36/U_MG36')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('MG36_Kobra', 'XP1', {'Kobra', 'Foregrip', 'HeavyBarrel'}, WeaponTypes.LMG, 'Weapons/XP1_MG36/U_MG36')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Pecheneg_Kobra', '', {'Kobra', 'Foregrip', 'ExtendedMag', 'Weapons/Pecheneg/U_Peceheneg_Camo_KAMYSH'},WeaponTypes.LMG, 'Weapons/Pecheneg/U_Pecheneg')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('Pecheneg_RX01', '', {'RX01', 'Foregrip', 'ExtendedMag', 'Weapons/Pecheneg/U_Peceheneg_Camo_ATACS'},WeaponTypes.LMG, 'Weapons/Pecheneg/U_Pecheneg')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('QBB-95_Kobra', 'XP1', {'Kobra', 'Foregrip', 'HeavyBarrel', 'Weapons/XP1_QBB-95/U_QBB-95_CAMO_2'},WeaponTypes.LMG, 'Weapons/XP1_QBB-95/U_QBB-95')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('QBB-95_RX01', 'XP1', {'RX01', 'Foregrip', 'HeavyBarrel', 'Weapons/XP1_QBB-95/U_QBB-95_CAMO_1'},WeaponTypes.LMG, 'Weapons/XP1_QBB-95/U_QBB-95')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Type88_Kobra', '', {'Kobra', 'ExtendedMag', 'Foregrip'},WeaponTypes.LMG, 'Weapons/Type88/U_Type88')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('Type88_RX01', '', {'RX01', 'ExtendedMag', 'Foregrip'},WeaponTypes.LMG, 'Weapons/Type88/U_Type88')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('RPK_Kobra', '', {'Kobra', 'HeavyBarrel', 'Foregrip'},WeaponTypes.LMG, 'Weapons/RPK/U_RPK-74M')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('RPK_RXO1', '', {'RXO1', 'HeavyBarrel', 'Foregrip'},WeaponTypes.LMG, 'Weapons/RPK/U_RPK-74M')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M240_RX01', '', {'RX01', 'ExtendedMag', 'Foregrip', 'Weapons/M240/U_M240_CAMO_1'}, WeaponTypes.LMG, 'Weapons/M240/U_M240')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M240_Kobra', '', {'Kobra', 'ExtendedMag', 'Foregrip', 'Weapons/M240/U_M240_CAMO_2'}, WeaponTypes.LMG, 'Weapons/M240/U_M240')
	table.insert(self._weapons, s_Weapon)

	---------------------------
	-- Sniper
	s_Weapon = Weapon('JNG90_Kobra', 'XP2', {'Kobra', 'StraightPull', 'Target_Pointer', 'Weapons/XP2_JNG90/U_JNG90_CAMO_2'}, WeaponTypes.Sniper, 'Weapons/XP2_JNG90/U_JNG90')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('JNG90_PSO-1', 'XP2', {'PSO-1', 'StraightPull', 'Target_Pointer', 'Weapons/XP2_JNG90/U_JNG90_CAMO_2'}, WeaponTypes.Sniper, 'Weapons/XP2_JNG90/U_JNG90')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('JNG90_RifleScope', 'XP2', {'Rifle_Scope', 'StraightPull', 'Target_Pointer', 'Weapons/XP2_JNG90/U_JNG90_CAMO_1'}, WeaponTypes.Sniper, 'Weapons/XP2_JNG90/U_JNG90')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('L96_EOTech', 'XP1', {'EOTech', 'StraightPull', 'Target_Pointer', 'Weapons/XP1_L96/U_L96_CAMO_ABU'}, WeaponTypes.Sniper, 'Weapons/XP1_L96/U_L96')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('L96_Acog', 'XP1', {'Acog', 'StraightPull', 'Target_Pointer', 'Weapons/XP1_L96/U_L96_CAMO_ABU'}, WeaponTypes.Sniper, 'Weapons/XP1_L96/U_L96')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('L96_RifleScope', 'XP1', {'Rifle_Scope', 'StraightPull', 'Target_Pointer', 'Weapons/XP1_L96/U_L96_CAMO_DIGIFLORA'}, WeaponTypes.Sniper, 'Weapons/XP1_L96/U_L96')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M98B_EOTech', '', {'EOTech', 'StraightPull', 'Target_Pointer'}, WeaponTypes.Sniper, 'Weapons/Model98B/U_M98B')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M98B_Acog', '', {'Acog', 'StraightPull', 'Target_Pointer'}, WeaponTypes.Sniper, 'Weapons/Model98B/U_M98B')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M98B_RifleScope', '', {'Rifle_Scope', 'StraightPull', 'Target_Pointer'}, WeaponTypes.Sniper, 'Weapons/Model98B/U_M98B')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M40A5_EOTech', '', {'EOTech', 'StraightPull', 'Target_Pointer'}, WeaponTypes.Sniper, 'Weapons/M40A5/U_M40A5')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M40A5_Acog', '', {'Acog', 'StraightPull', 'Target_Pointer'}, WeaponTypes.Sniper, 'Weapons/M40A5/U_M40A5')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M40A5_RifleScope', '', {'Rifle_Scope', 'StraightPull', 'Target_Pointer'}, WeaponTypes.Sniper, 'Weapons/M40A5/U_M40A5')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('SV98_Kobra', '', {'Kobra', 'StraightPull', 'Target_Pointer'}, WeaponTypes.Sniper, 'Weapons/SV98/U_SV98')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('SV98_PSO-1', '', {'PSO-1', 'StraightPull', 'Target_Pointer'}, WeaponTypes.Sniper, 'Weapons/SV98/U_SV98')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('SV98_RifleScope', '', {'Rifle_Scope', 'StraightPull', 'Target_Pointer'}, WeaponTypes.Sniper, 'Weapons/SV98/U_SV98')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M39EBR_EOTech', '', {'EOTech', 'Target_pointer', 'Flashsuppressor', 'Weapons/M39EBR/U_M39EBR_CAMO_1'}, WeaponTypes.Sniper, 'Weapons/M39EBR/U_M39EBR')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M39EBR_Acog', '', {'Acog', 'Target_pointer', 'Flashsuppressor', 'Weapons/M39EBR/U_M39EBR_CAMO_1'}, WeaponTypes.Sniper, 'Weapons/M39EBR/U_M39EBR')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('M39EBR_RifleScope', '', {'Rifle_Scope', 'Target_pointer', 'Flashsuppressor', 'Weapons/M39EBR/U_M39EBR_CAMO_2'}, WeaponTypes.Sniper, 'Weapons/M39EBR/U_M39EBR')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('HK417_EOTech', 'XP2', {'EOTech', 'Target_pointer', 'HeavyBarrel'}, WeaponTypes.Sniper, 'Weapons/XP2_HK417/U_HK417')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('HK417_Acog', 'XP2', {'Acog', 'Target_pointer', 'HeavyBarrel'}, WeaponTypes.Sniper, 'Weapons/XP2_HK417/U_HK417')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('HK417_RifleScope', 'XP2', {'Rifle_Scope', 'Target_pointer', 'HeavyBarrel'}, WeaponTypes.Sniper, 'Weapons/XP2_HK417/U_HK417')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('MK11_EOTech', '', {'EOTech', 'Target_pointer', 'Flashsuppressor'}, WeaponTypes.Sniper, 'Weapons/MK11/U_MK11')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('MK11_Acog', '', {'Acog', 'Target_pointer', 'Flashsuppressor'}, WeaponTypes.Sniper, 'Weapons/MK11/U_MK11')
	table.insert(self._weapons, s_Weapon)
	
	s_Weapon = Weapon('MK11_RifleScope', '', {'Rifle_Scope', 'Target_pointer', 'Flashsuppressor'}, WeaponTypes.Sniper, 'Weapons/MK11/U_MK11')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SKS_Kobra', '', {'Kobra', 'Target_pointer', 'HeavyBarrel', 'Weapons/SKS/U_SKS_CAMO_2'}, WeaponTypes.Sniper, 'Weapons/SKS/U_SKS')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SKS_PSO-1', '', {'PSO-1', 'Target_pointer', 'HeavyBarrel', 'Weapons/SKS/U_SKS_CAMO_2'}, WeaponTypes.Sniper, 'Weapons/SKS/U_SKS')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SKS_RifleScope', '', {'Rifle_Scope', 'Target_pointer', 'HeavyBarrel', 'Weapons/SKS/U_SKS_CAMO_1'}, WeaponTypes.Sniper, 'Weapons/SKS/U_SKS')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SVD_Kobra', '', {'Kobra', 'Target_pointer', 'Flashsuppressor'}, WeaponTypes.Sniper, 'Weapons/SVD/U_SVD')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SVD_PSO-1', '', {'PSO-1', 'Target_pointer', 'Flashsuppressor'}, WeaponTypes.Sniper, 'Weapons/SVD/U_SVD')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('SVD_RifleScope', '', {'Rifle_Scope', 'Target_pointer', 'Flashsuppressor'}, WeaponTypes.Sniper, 'Weapons/SVD/U_SVD')
	table.insert(self._weapons, s_Weapon)


	---------------------------
	-- pistols
	s_Weapon = Weapon('Glock17', '', {}, WeaponTypes.Pistol, 'Weapons/Glock17/U_Glock17')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Glock17_Silenced', '', {}, WeaponTypes.Pistol, 'Weapons/Glock17/U_Glock17_Silenced')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Glock18', '', {}, WeaponTypes.Pistol, 'Weapons/Glock18/U_Glock18')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Glock18_Silenced', '', {}, WeaponTypes.Pistol, 'Weapons/Glock18/U_Glock18_Silenced')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M1911_Lit', '', {}, WeaponTypes.Pistol, 'Weapons/M1911/U_M1911_Lit')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M1911_Silenced', '', {},WeaponTypes.Pistol, 'Weapons/M1911/U_M1911_Silenced')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M1911_Tactical', '', {}, WeaponTypes.Pistol, 'Weapons/M1911/U_M1911_Tactical')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M9', '', {}, WeaponTypes.Pistol, 'Weapons/M9/U_M9')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M9_Silenced', '', {},WeaponTypes.Pistol, 'Weapons/M9/U_M9_Silenced')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M9_Tactical', '', {}, WeaponTypes.Pistol, 'Weapons/M9/U_M9_TacticalLight')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M93R', '', {}, WeaponTypes.Pistol, 'Weapons/M93R/U_M93R')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('MP412Rex', '', {}, WeaponTypes.Pistol, 'Weapons/MP412Rex/U_MP412Rex')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Taurus44', '', {}, WeaponTypes.Pistol, 'Weapons/Taurus44/U_Taurus44')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Taurus44_Scoped', '', {}, WeaponTypes.Pistol, 'Weapons/Taurus44/U_Taurus44_Scoped')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('MP443', '', {}, WeaponTypes.Pistol, 'Weapons/MP443/U_MP443')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('MP443_Tactical', '', {}, WeaponTypes.Pistol, 'Weapons/MP443/U_MP443_TacticalLight')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('MP443_Silenced', '', {}, WeaponTypes.Pistol, 'Weapons/MP443/U_MP443_Silenced')
	table.insert(self._weapons, s_Weapon)

	-- knifes
	s_Weapon = Weapon('Razor', '', {}, WeaponTypes.Knife, 'Weapons/XP2_Knife_RazorBlade/U_Knife_Razor')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Knife', '', {}, WeaponTypes.Knife)
	table.insert(self._weapons, s_Weapon)

	---------------------------
	-- Sidearms
	s_Weapon = Weapon('SMAW', '', {}, WeaponTypes.Rocket) -- only rockets supported for engineers right now
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('RPG7', '', {}, WeaponTypes.Rocket) -- only rockets supported for engineers right now
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Repairtool', '', {}, WeaponTypes.Torch, 'Weapons/Gadgets/Repairtool/U_Repairtool')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Defib', '', {}, WeaponTypes.Defibrillator, 'Weapons/Gadgets/Defibrillator/U_Defib')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Medkit', '', {}, WeaponTypes.Medkit, 'Weapons/Gadgets/Medicbag/U_Medkit')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Ammobag', '', {}, WeaponTypes.Ammobag, 'Weapons/Gadgets/Ammobag/U_Ammobag')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Claymore', '', {}, WeaponTypes.Claymore, 'Weapons/Gadgets/Claymore/U_Claymore')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('C4', '', {}, WeaponTypes.C4, 'Weapons/Gadgets/C4/U_C4')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Tug', '', {}, WeaponTypes.Tugs, 'Weapons/Gadgets/T-UGS/U_UGS')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('Beacon', '', {}, WeaponTypes.Beacon, 'Weapons/Gadgets/RadioBeacon/U_RadioBeacon')
	table.insert(self._weapons, s_Weapon)

	s_Weapon = Weapon('M67', '', {}, WeaponTypes.Grenade)
	table.insert(self._weapons, s_Weapon)

	self:updateWeaponList()
end

function WeaponList:_isCustomWeapon(p_Class, p_Name)
	local s_CustomWeaponList = nil
	local s_IsCustomWeapon = false

	if p_Class == BotKits.Assault then
		s_CustomWeaponList = CustomWeaponsAssault
	elseif p_Class == BotKits.Engineer then
		s_CustomWeaponList = CustomWeaponsEngineer
	elseif p_Class == BotKits.Support then
		s_CustomWeaponList = CustomWeaponsSupport
	elseif p_Class == BotKits.Recon then
		s_CustomWeaponList = CustomWeaponsRecon
	end

	for _, l_CustomName in pairs(s_CustomWeaponList) do
		if l_CustomName == p_Name or string.find(p_Name, l_CustomName.."_") ~= nil then  -- use all fitting weapon-variants of this type
			s_IsCustomWeapon = true
			break
		end
	end

	return s_IsCustomWeapon
end

function WeaponList:_useWeaponType(p_Class, p_Type, p_Name)
	local s_UseThisWeapon = false
	local s_IsClassWeapon = false
	local s_WeaponSet = ""

	if p_Class == BotKits.Assault then
		s_WeaponSet = Config.AssaultWeaponSet

		if p_Type == WeaponTypes.Assault then
			s_IsClassWeapon = true
		end
	elseif p_Class == BotKits.Engineer then
		s_WeaponSet = Config.EngineerWeaponSet

		if p_Type == WeaponTypes.Carabine then
			s_IsClassWeapon = true
		end
	elseif p_Class == BotKits.Support then
		s_WeaponSet = Config.SupportWeaponSet

		if p_Type == WeaponTypes.LMG then
			s_IsClassWeapon = true
		end
	else --if p_Class == BotKits.Recon then
		s_WeaponSet = Config.ReconWeaponSet

		if p_Type == WeaponTypes.Sniper then
			s_IsClassWeapon = true
		end
	end

	-- check for custom-weapon
	if s_WeaponSet == WeaponSets.Custom then
		s_UseThisWeapon = self:_isCustomWeapon(p_Class, p_Name)
	else -- check for other p_Classes
		if p_Type == WeaponTypes.PDW then
			if s_WeaponSet == WeaponSets.PDW or
			s_WeaponSet == WeaponSets.Class_PDW or
			s_WeaponSet == WeaponSets.Class_PDW_Shotgun or
			s_WeaponSet == WeaponSets.PDW_Shotgun then
				s_UseThisWeapon = true
			end
		elseif p_Type == WeaponTypes.Shotgun then
			if s_WeaponSet == WeaponSets.Shotgun or
			s_WeaponSet == WeaponSets.Class_Shotgun or
			s_WeaponSet == WeaponSets.Class_PDW_Shotgun or
			s_WeaponSet == WeaponSets.PDW_Shotgun then
				s_UseThisWeapon = true
			end
		elseif p_Type == WeaponTypes.Assault or p_Type == WeaponTypes.Carabine or p_Type == WeaponTypes.LMG or p_Type == WeaponTypes.Sniper then
			if s_WeaponSet == WeaponSets.Class or
			s_WeaponSet == WeaponSets.Class_Shotgun or
			s_WeaponSet == WeaponSets.Class_PDW_Shotgun or
			s_WeaponSet == WeaponSets.Class_PDW then
				if s_IsClassWeapon then
					s_UseThisWeapon = true
				end
			end
		else
			-- for all other weapons - use p_Class-list
			s_UseThisWeapon = self:_isCustomWeapon(p_Class, p_Name)
		end
	end

	return s_UseThisWeapon
end

function WeaponList:updateWeaponList()
	AllWeapons = {}
	KnifeWeapons = {}
	PistoWeapons = {}

	AssaultPrimary = {}
	AssaultPistol = {}
	AssaultKnife = {}
	AssaultGadget1 = {}
	AssaultGadget2 = {}
	AssaultGrenade = {}
	EngineerPrimary = {}
	EngineerPistol = {}
	EngineerKnife = {}
	EngineerGadget1 = {}
	EngineerGadget2 = {}
	EngineerGrenade = {}
	SupportPrimary = {}
	SupportPistol = {}
	SupportKnife = {}
	SupportGadget1 = {}
	SupportGadget2 = {}
	SupportGrenade = {}
	ReconPrimary = {}
	ReconPistol = {}
	ReconKnife = {}
	ReconGadget1 = {}
	ReconGadget2 = {}
	ReconGrenade = {}

	for i = 1, #self._weapons do
		local s_Wep = self._weapons[i]
		table.insert(AllWeapons, s_Wep.name)

		if (s_Wep.type == WeaponTypes.Knife) then
			table.insert(KnifeWeapons, s_Wep.name)
		elseif (s_Wep.type == WeaponTypes.Pistol) then
			table.insert(PistoWeapons, s_Wep.name)
		end

		if self:_useWeaponType(BotKits.Assault, s_Wep.type, s_Wep.name) then
			if (s_Wep.type == WeaponTypes.Knife) then
				table.insert(AssaultKnife, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Pistol) then
				table.insert(AssaultPistol, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Grenade) then
				table.insert(AssaultGrenade, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Medkit) then
				table.insert(AssaultGadget1, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Defibrillator) then
				table.insert(AssaultGadget2, s_Wep.name)
			else
				table.insert(AssaultPrimary, s_Wep.name)
			end
		end

		if self:_useWeaponType(BotKits.Engineer, s_Wep.type, s_Wep.name) then
			if (s_Wep.type == WeaponTypes.Knife) then
				table.insert(EngineerKnife, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Pistol) then
				table.insert(EngineerPistol, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Grenade) then
				table.insert(EngineerGrenade, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Torch) then
				table.insert(EngineerGadget1, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Rocket) then
				table.insert(EngineerGadget2, s_Wep.name)
			else
				table.insert(EngineerPrimary, s_Wep.name)
			end
		end

		if self:_useWeaponType(BotKits.Support, s_Wep.type, s_Wep.name) then
			if (s_Wep.type == WeaponTypes.Knife) then
				table.insert(SupportKnife, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Pistol) then
				table.insert(SupportPistol, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Grenade) then
				table.insert(SupportGrenade, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Ammobag) then
				table.insert(SupportGadget1, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Claymore) or (s_Wep.type == WeaponTypes.C4) then
				table.insert(SupportGadget2, s_Wep.name)
			else
				table.insert(SupportPrimary, s_Wep.name)
			end
		end

		if self:_useWeaponType(BotKits.Recon, s_Wep.type, s_Wep.name) then
			if (s_Wep.type == WeaponTypes.Knife) then
				table.insert(ReconKnife, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Pistol) then
				table.insert(ReconPistol, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Grenade) then
				table.insert(ReconGrenade, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Tugs) then
				table.insert(ReconGadget1, s_Wep.name)
			elseif (s_Wep.type == WeaponTypes.Beacon) then
				table.insert(ReconGadget2, s_Wep.name)
			else
				table.insert(ReconPrimary, s_Wep.name)
			end
		end
	end
end

function WeaponList:getWeapon(p_Name)
	local s_RetWeapon = nil
	local s_AllPossibleWeapons = {}
	if p_Name == nil then
		m_Logger:Warning('Invalid Parameter')
		return nil
	end
	for _, l_Weapon in pairs(self._weapons) do
		if string.find(l_Weapon.name, p_Name.."_") ~= nil then -- check for weapon-variant
			table.insert(s_AllPossibleWeapons, l_Weapon)
		end 
		if l_Weapon.name == p_Name then
			s_RetWeapon = l_Weapon
			break
		end
	end

	if s_RetWeapon ~= nil then
		return s_RetWeapon
	elseif #s_AllPossibleWeapons > 0 then
		return s_AllPossibleWeapons[MathUtils:GetRandomInt(1, #s_AllPossibleWeapons)]
	else
		m_Logger:Warning('Weapon not found: '..tostring(p_Name))
		return nil
	end
end

function WeaponList:onLevelLoaded()
	for _, l_Weapon in pairs(self._weapons) do
		if l_Weapon.needvalues then
			l_Weapon:learnStatsValues()
		end
	end
end

if g_WeaponList == nil then
	g_WeaponList = WeaponList()
end

return g_WeaponList
