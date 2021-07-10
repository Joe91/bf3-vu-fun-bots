class('FunBotServer')

require('__shared/Debug')
require('__shared/Config')
require('__shared/Constants/BotColors')
require('__shared/Constants/BotNames')
require('__shared/Constants/BotKits')
require('__shared/Constants/BotWeapons')
require('__shared/Constants/WeaponSets')
require('__shared/Constants/WeaponTypes')
require('__shared/Constants/BotAttackModes')
require('__shared/Constants/BotMoveSpeeds')
require('__shared/Constants/SpawnModes')
require('__shared/Constants/SpawnMethods')
require('__shared/Constants/TeamSwitchModes')
require ('__shared/Utils/Logger')
require('Model/Globals')
require('UI/UI')
require('Constants/Permissions')
require('Constants/BotEnums')

local m_Logger = Logger("FunBotServer", Debug.Server.INFO)

require('__shared/Utilities')

local m_NodeEditor = require('NodeEditor')
local m_WeaponModification = require('WeaponModification')
local m_Language = require('__shared/Language')
local m_SettingsManager = require('SettingsManager')
local m_BotManager = require('BotManager')
local m_BotSpawner = require('BotSpawner')
local m_WeaponList = require('__shared/WeaponList')
local m_ChatCommands = require('Commands/Chat')
local m_Console = require('Commands/Console')
local m_RCONCommands = require('Commands/RCON')
-- local m_FunBotUIServer = require('UIServer')
local m_GameDirector = require('GameDirector')
PermissionManager = require('PermissionManager')


function FunBotServer:__init()
	self.m_PlayerKilledDelay = 0
	Events:Subscribe('Engine:Init', self, self.OnEngineInit)
	Events:Subscribe('Extension:Loaded', self, self.OnExtensionLoaded)
end

function FunBotServer:OnEngineInit()
	require('UpdateCheck')
end

function FunBotServer:OnExtensionLoaded()
	m_Language:loadLanguage(Config.Language)
	m_SettingsManager:OnExtensionLoaded()
	self:RegisterEvents()
	self:RegisterHooks()
	self:RegisterCustomEvents()
	self:RegisterCallbacks()
	self:ScambleBotNames() -- use random names at least once per start
	self:OnModReloaded()
end

function FunBotServer:RegisterEvents()
	Events:Subscribe('Extension:Unloading', self, self.OnExtensionUnloading)

	Events:Subscribe('Partition:Loaded', self, self.OnPartitionLoaded)
	Events:Subscribe('Engine:Update', self, self.OnEngineUpdate)
	Events:Subscribe('UpdateManager:Update', self, self.OnUpdateManagerUpdate)

	Events:Subscribe('Level:Loaded', self, self.OnLevelLoaded)
	Events:Subscribe('Level:Destroy', self, self.OnLevelDestroy)
	Events:Subscribe('Server:RoundOver', self, self.OnRoundOver)
	Events:Subscribe('Server:RoundReset', self, self.OnRoundReset)

	Events:Subscribe('Player:Joining', self, self.OnPlayerJoining)
	Events:Subscribe('Player:TeamChange', self, self.OnTeamChange)
	Events:Subscribe('Player:KitPickup', self, self.OnKitPickup)
	Events:Subscribe('Player:Respawn', self, self.OnPlayerRespawn)
	Events:Subscribe('Player:Killed', self, self.OnPlayerKilled)
	Events:Subscribe('Player:Chat', self, self.OnPlayerChat)
	Events:Subscribe('Player:Left', self, self.OnPlayerLeft)
	Events:Subscribe('Player:Destroyed', self, self.OnPlayerDestroyed)

	Events:Subscribe('CapturePoint:Lost', self, self.OnCapturePointLost)
	Events:Subscribe('CapturePoint:Captured', self, self.OnCapturePointCaptured)
	Events:Subscribe('Player:EnteredCapturePoint', self, self.OnPlayerEnteredCapturePoint)
	Events:Subscribe('MCOM:Armed', self, self.OnMcomArmed)
	Events:Subscribe('MCOM:Disarmed', self, self.OnMcomDisarmed)
	Events:Subscribe('MCOM:Destroyed', self, self.OnMcomDestroyed)
	Events:Subscribe('RUSH:ZoneDisabled', self, self.OnRushZoneDisabled)
	Events:Subscribe('Vehicle:SpawnDone', self, self.OnVehicleSpawnDone)
	Events:Subscribe('Vehicle:Enter', self, self.OnVehicleEnter)

	--Events:Subscribe('Soldier:HealthAction', m_BotManager, m_BotManager.OnSoldierHealthAction)	-- use this for more options on revive. Not needed yet
	--Events:Subscribe('GunSway:Update', m_BotManager, m_BotManager.OnGunSway)
	--Events:Subscribe('GunSway:UpdateRecoil', m_BotManager, m_BotManager.OnGunSway)
end

function FunBotServer:RegisterHooks()
	Hooks:Install('Soldier:Damage', 100, self, self.OnSoldierDamage)
end

function FunBotServer:RegisterCustomEvents()
	NetEvents:Subscribe('Bot:ShootAtPlayer', self, self.OnShootAt)
	NetEvents:Subscribe('Bot:RevivePlayer', self, self.OnRevivePlayer)
	NetEvents:Subscribe('Bot:ShootAtBot', self, self.OnBotShootAtBot)
	NetEvents:Subscribe('Client:DamagePlayer', self, self.OnDamagePlayer) --only triggered on false damage
	Events:Subscribe('Server:DamagePlayer', self, self.OnServerDamagePlayer) --only triggered on false damage
	Events:Subscribe('Bot:RespawnBot', self, self.OnRespawnBot)
	NetEvents:Subscribe('Client:RequestSettings', self, self.OnRequestClientSettings)
	NetEvents:Subscribe('ConsoleCommands:SetConfig', self, self.OnConsoleCommandSetConfig)
	NetEvents:Subscribe('ConsoleCommands:SaveAll', self, self.OnConsoleCommandSaveAll)
	NetEvents:Subscribe('ConsoleCommands:Restore', self, self.OnConsoleCommandRestore)
	m_NodeEditor:RegisterCustomEvents()
end

function FunBotServer:RegisterCallbacks()
	-- Use server-sided bulletdamage
	ResourceManager:RegisterInstanceLoadHandler(Guid('C4DCACFF-ED8F-BC87-F647-0BC8ACE0D9B4'), Guid('818334B3-CEA6-FC3F-B524-4A0FED28CA35'), self, self.OnServerSettingsCallback)
	ResourceManager:RegisterInstanceLoadHandler(Guid('C4DCACFF-ED8F-BC87-F647-0BC8ACE0D9B4'), Guid('B983148D-4B2B-1CDA-D8A0-407789610202'), self, self.OnSyncedGameSettingsCallback)

	-- Conquest
	ResourceManager:RegisterInstanceLoadHandler(Guid('0C342A8C-BCDE-11E0-8467-9159D6ACA94C'), Guid('0093213A-2BA5-4B27-979C-8C0B6DBE38CE'), self, self.OnAutoTeamEntityDataCallback)
	ResourceManager:RegisterInstanceLoadHandler(Guid('0C342A8C-BCDE-11E0-8467-9159D6ACA94C'), Guid('4CD461D1-A9D5-4A1B-A88D-D72AF01FB82D'), self, self.OnHumanPlayerEntityDataCallback)
	-- Domination
	ResourceManager:RegisterInstanceLoadHandler(Guid('9E2ED50A-C01C-49BA-B3BE-9940BD4C5A08'), Guid('D9F43E4E-CDB1-4BE5-8C28-80CC6F860090'), self, self.OnAutoTeamEntityDataCallback)
	ResourceManager:RegisterInstanceLoadHandler(Guid('9E2ED50A-C01C-49BA-B3BE-9940BD4C5A08'), Guid('D90027CC-5A84-4BEB-8622-497E3DAEFA37'), self, self.OnHumanPlayerEntityDataCallback)
	-- Rush
	ResourceManager:RegisterInstanceLoadHandler(Guid('56364B35-5D80-4874-9D74-CCF829D579D9'), Guid('015C301E-D440-4A25-9F2A-5AA59F6CDDCD'), self, self.OnAutoTeamEntityDataCallback)
	ResourceManager:RegisterInstanceLoadHandler(Guid('56364B35-5D80-4874-9D74-CCF829D579D9'), Guid('896A2B3B-DC2B-46C6-A288-1A4149C2790C'), self, self.OnHumanPlayerEntityDataCallback)
	-- Full CTF Prototype
	ResourceManager:RegisterInstanceLoadHandler(Guid('DF2A507F-0CB2-4430-B854-26589870B52C'), Guid('C2A37490-3663-4633-B9AD-7FB04B898A34'), self, self.OnAutoTeamEntityDataCallback)
	ResourceManager:RegisterInstanceLoadHandler(Guid('DF2A507F-0CB2-4430-B854-26589870B52C'), Guid('0DB61706-1F91-43F4-8898-13DA716E3E9E'), self, self.OnHumanPlayerEntityDataCallback)
	-- Full GunMaster
	ResourceManager:RegisterInstanceLoadHandler(Guid('F71EE45B-1BB0-4442-A46D-5B079A722230'), Guid('9C396851-78ED-49B9-8F24-FC6A8E2AF7A9'), self, self.OnAutoTeamEntityDataCallback)
	ResourceManager:RegisterInstanceLoadHandler(Guid('F71EE45B-1BB0-4442-A46D-5B079A722230'), Guid('4F65C8D9-EE5F-4CAB-BC97-A4DB3D7B528A'), self, self.OnHumanPlayerEntityDataCallback)
	-- Full GunMaster XP4
	ResourceManager:RegisterInstanceLoadHandler(Guid('F58C83A7-C753-4360-A9C0-4E44C79836F8'), Guid('58019F0F-3CDA-48EA-BAAE-A776D4395BCF'), self, self.OnAutoTeamEntityDataCallback)
	ResourceManager:RegisterInstanceLoadHandler(Guid('F58C83A7-C753-4360-A9C0-4E44C79836F8'), Guid('BF4E6675-DC22-4156-A978-C504C6A0B342'), self, self.OnHumanPlayerEntityDataCallback)
	-- Full SquadDeathmatch
	ResourceManager:RegisterInstanceLoadHandler(Guid('A2074F27-7D1F-11E0-B283-C22E2A7B7393'), Guid('5C01FD39-C10C-4D4B-ABDB-724B1EA54815'), self, self.OnAutoTeamEntityDataCallback)
	ResourceManager:RegisterInstanceLoadHandler(Guid('A2074F27-7D1F-11E0-B283-C22E2A7B7393'), Guid('99CFF247-8F58-489E-BB66-1FAEC6FDA8A9'), self, self.OnHumanPlayerEntityDataCallback)
	-- Full SquadDeathmatch NoVehicles
	ResourceManager:RegisterInstanceLoadHandler(Guid('1341E76F-293C-4091-AF99-05DFA3B73CF3'), Guid('C94EC3CF-FCCB-462C-83E1-8CA70A3A525A'), self, self.OnAutoTeamEntityDataCallback)
	ResourceManager:RegisterInstanceLoadHandler(Guid('1341E76F-293C-4091-AF99-05DFA3B73CF3'), Guid('43C71D6D-9972-4A8C-BD74-677972E49F4E'), self, self.OnHumanPlayerEntityDataCallback)
	-- Full SquadDeathmatch XP4
	ResourceManager:RegisterInstanceLoadHandler(Guid('7B941CFA-9955-461B-8390-0789AD9AA1A5'), Guid('FA2B2A7D-25C0-4B9B-BF2E-AF363F853F68'), self, self.OnAutoTeamEntityDataCallback)
	ResourceManager:RegisterInstanceLoadHandler(Guid('7B941CFA-9955-461B-8390-0789AD9AA1A5'), Guid('FF4D8BD7-7D79-499D-AA2B-18865FB01200'), self, self.OnHumanPlayerEntityDataCallback)
	-- Full TeamDeathmatch
	ResourceManager:RegisterInstanceLoadHandler(Guid('FAD987C1-7D2A-11E0-B283-C22E2A7B7393'), Guid('6E2D7A9F-67A8-4827-B261-0025C6559F7B'), self, self.OnAutoTeamEntityDataCallback)
	ResourceManager:RegisterInstanceLoadHandler(Guid('FAD987C1-7D2A-11E0-B283-C22E2A7B7393'), Guid('742EAB4B-FFCB-4201-ADAC-1D4BC20E6831'), self, self.OnHumanPlayerEntityDataCallback)
	-- Full TeamDeathmatch XP4
	ResourceManager:RegisterInstanceLoadHandler(Guid('676C0FD7-EA75-4F5D-8764-BB076F6F3E11'), Guid('CC76229D-95EE-4B52-822B-BE222EED803B'), self, self.OnAutoTeamEntityDataCallback)
	ResourceManager:RegisterInstanceLoadHandler(Guid('676C0FD7-EA75-4F5D-8764-BB076F6F3E11'), Guid('4B797B64-6CDC-41F3-963D-DE22517EC4B5'), self, self.OnHumanPlayerEntityDataCallback)
	-- Coop
	-- ResourceManager:RegisterInstanceLoadHandler(Guid('945CAF0E-B0F2-11DF-91B7-DD34EE95ED77'), Guid('77B694D1-046A-4A33-A5F2-4C667DB51D27'), self, self.OnHumanPlayerEntityDataCallback)
	-- SP
	-- ResourceManager:RegisterInstanceLoadHandler(Guid('9C2FFA19-B419-11DF-A7E7-B3A3B68B4D14'), Guid('7B7F0014-13B6-4387-AE94-1E61548AB6D3'), self, self.OnHumanPlayerEntityDataCallback)
	-- FrontEnd
	-- ResourceManager:RegisterInstanceLoadHandler(Guid('6EA4B5DA-DE3A-4808-A85C-FCA07B2AFB04'), Guid('8BD2E753-9B37-426A-8AA8-1685C8E2744D'), self, self.OnHumanPlayerEntityDataCallback)
	-- TutorialMP Sandbox
	-- ResourceManager:RegisterInstanceLoadHandler(Guid('CC083805-FAC2-4940-9D8E-45C232C005E3'), Guid('592D94FC-68F7-413E-8B61-0ACEC4FD7D0D'), self, self.OnHumanPlayerEntityDataCallback)
	-- TutorialMP
	-- ResourceManager:RegisterInstanceLoadHandler(Guid('8517D561-0AED-4C58-A634-5D069A8E1BA2'), Guid('502DA681-116F-494C-AFBD-DC02522A14B4'), self, self.OnHumanPlayerEntityDataCallback)
	-- TutorialMP ShootHouse
	-- ResourceManager:RegisterInstanceLoadHandler(Guid('53C55F5E-C5CF-4B60-A455-445739D99501'), Guid('F4B49F70-BE94-4792-95E6-09A5F3F932F4'), self, self.OnHumanPlayerEntityDataCallback)
end

-- =============================================
-- Events
-- =============================================

function FunBotServer:OnExtensionUnloading()
	m_BotManager:DestroyAll(nil, nil, true)
end

function FunBotServer:OnPartitionLoaded(p_Partition)
	m_WeaponModification:OnPartitionLoaded(p_Partition)
end

function FunBotServer:OnEngineUpdate(p_DeltaTime, p_SimulationDeltaTime)
	m_GameDirector:OnEngineUpdate(p_DeltaTime)
	m_NodeEditor:OnEngineUpdate(p_DeltaTime)
end

function FunBotServer:OnUpdateManagerUpdate(p_DeltaTime, p_UpdatePass)
	m_BotManager:OnUpdateManagerUpdate(p_DeltaTime, p_UpdatePass)
	m_BotSpawner:OnUpdateManagerUpdate(p_DeltaTime, p_UpdatePass)
end

-- =============================================
	-- Level Events
-- =============================================

function FunBotServer:OnLevelLoaded(p_LevelName, p_GameMode, p_Round, p_RoundsPerMap)
	local s_GameMode = ServerUtils:GetCustomGameModeName()

	if s_GameMode == nil then
		s_GameMode = p_GameMode
	end

	-- randomize used names
	if Config.UseRandomNames then
		self:ScambleBotNames()
	end

	m_WeaponModification:ModifyAllWeapons(Config.BotAimWorsening, Config.BotSniperAimWorsening, Config.BotSupportAimWorsening)
	m_WeaponList:onLevelLoaded()

	m_Logger:Write('OnLevelLoaded: ' .. p_LevelName .. ' ' .. s_GameMode)

	self:SetRespawnDelay()
	Globals.IgnoreBotNames = {}
	self:DetectSpecialMods()
	self:RegisterInputRestrictionEventCallbacks()
	self:SetGameMode(s_GameMode)
	self:SetMaxBotsPerTeam(p_GameMode)

	m_NodeEditor:OnLevelLoaded(p_LevelName, s_GameMode)
	m_GameDirector:OnLevelLoaded()
	m_BotSpawner:OnLevelLoaded(p_Round)
	NetEvents:BroadcastUnreliableLocal('WriteClientSettings', Config, true)
end

function FunBotServer:OnLevelDestroy()
	m_BotManager:OnLevelDestroy()
	m_BotSpawner:OnLevelDestroy()
	m_NodeEditor:OnLevelDestroy()
end

function FunBotServer:OnRoundOver(p_RoundTime, p_WinningTeam)
	m_GameDirector:OnRoundOver(p_RoundTime, p_WinningTeam)
end

function FunBotServer:OnRoundReset(p_RoundTime, p_WinningTeam)
	m_GameDirector:OnRoundReset(p_RoundTime, p_WinningTeam)
end

-- =============================================
	-- Player Events
-- =============================================

function FunBotServer:OnPlayerJoining(p_Name)
	m_BotSpawner:OnPlayerJoining(p_Name)
end

function FunBotServer:OnTeamChange(p_Player, p_TeamId, p_SquadId)
	m_BotSpawner:OnTeamChange(p_Player, p_TeamId, p_SquadId)
end

function FunBotServer:OnKitPickup(p_Player, p_NewCustomization)
	m_BotSpawner:OnKitPickup(p_Player, p_NewCustomization)
end

function FunBotServer:OnPlayerRespawn(p_Player)
	m_NodeEditor:OnPlayerRespawn(p_Player)
end

function FunBotServer:OnPlayerKilled(p_Player, p_Inflictor, p_Position, p_Weapon, p_IsRoadKill, p_IsHeadShot, p_WasVictimInReviveState, p_Info)
	m_NodeEditor:OnPlayerKilled(p_Player)
end

function FunBotServer:OnPlayerChat(p_Player, p_RecipientMask, p_Message)
	local s_MessageParts = string.lower(p_Message):split(' ')
	m_ChatCommands:Execute(s_MessageParts, p_Player)
end

function FunBotServer:OnPlayerLeft(p_Player)
	m_BotManager:OnPlayerLeft(p_Player)
	m_NodeEditor:OnPlayerLeft(p_Player)
end

function FunBotServer:OnPlayerDestroyed(p_Player)
	m_NodeEditor:OnPlayerDestroyed(p_Player)
end

-- =============================================
	-- CapturePoint Events
-- =============================================

function FunBotServer:OnCapturePointLost(p_CapturePoint)
	m_GameDirector:OnCapturePointLost(p_CapturePoint)
end

function FunBotServer:OnCapturePointCaptured(p_CapturePoint)
	m_GameDirector:OnCapturePointCaptured(p_CapturePoint)
end

function FunBotServer:OnPlayerEnteredCapturePoint(p_Player, p_CapturePoint)
	m_GameDirector:OnPlayerEnteredCapturePoint(p_Player, p_CapturePoint)
end

-- =============================================
	-- Vehicle Events
-- =============================================

function FunBotServer:OnVehicleSpawnDone(p_VehicleEntiy)
	m_GameDirector:OnVehicleSpawnDone(p_VehicleEntiy)
end

function FunBotServer:OnVehicleEnter(p_VehicleEntiy, p_Player)
	m_GameDirector:OnVehicleEnter(p_VehicleEntiy, p_Player)
end

-- =============================================
	-- Rush Events
-- =============================================

function FunBotServer:OnMcomArmed(p_Player)
	m_GameDirector:OnMcomArmed(p_Player)
end

function FunBotServer:OnMcomDisarmed(p_Player)
	m_GameDirector:OnMcomDisarmed(p_Player)
end

function FunBotServer:OnMcomDestroyed(p_Player)
	m_GameDirector:OnMcomDestroyed(p_Player)
end

function FunBotServer:OnRushZoneDisabled(p_EntityId)
	m_GameDirector:OnRushZoneDisabled(p_EntityId)
end

-- =============================================
-- Hooks
-- =============================================

function FunBotServer:OnSoldierDamage(p_HookCtx, p_Soldier, p_Info, p_GiverInfo)
	m_BotManager:OnSoldierDamage(p_HookCtx, p_Soldier, p_Info, p_GiverInfo)
end

-- =============================================
-- Custom Events
-- =============================================

function FunBotServer:OnShootAt(p_Player, p_BotName, p_IgnoreYaw)
	m_BotManager:OnShootAt(p_Player, p_BotName, p_IgnoreYaw)
end

function FunBotServer:OnRevivePlayer(p_Player, p_BotName)
	m_BotManager:OnRevivePlayer(p_Player, p_BotName)
end

function FunBotServer:OnBotShootAtBot(p_Player, p_BotName1, p_BotName2)
	m_BotManager:OnBotShootAtBot(p_Player, p_BotName1, p_BotName2)
end

function FunBotServer:OnDamagePlayer(p_Player, p_ShooterName, p_MeleeAttack, p_IsHeadShot)
	m_BotManager:OnDamagePlayer(p_Player, p_ShooterName, p_MeleeAttack, p_IsHeadShot)
end

function FunBotServer:OnServerDamagePlayer(p_PlayerName, p_ShooterName, p_MeleeAttack)
	m_BotManager:OnServerDamagePlayer(p_PlayerName, p_ShooterName, p_MeleeAttack)
end

function FunBotServer:OnRespawnBot(p_BotName)
	m_BotSpawner:OnRespawnBot(p_BotName)
end

function FunBotServer:OnRequestClientSettings(p_Player)
	NetEvents:SendToLocal('WriteClientSettings', p_Player, Config, true)
	m_Console:RegisterConsoleCommands(p_Player)
	m_BotManager:RegisterActivePlayer(p_Player)
end

function FunBotServer:OnConsoleCommandSetConfig(p_Player, p_Name, p_Value)
	m_Console:OnConsoleCommandSetConfig(p_Player, p_Name, p_Value)
end

function FunBotServer:OnConsoleCommandSaveAll(p_Player, p_Args)
	m_Console:OnConsoleCommandSaveAll(p_Player, p_Args)
end

function FunBotServer:OnConsoleCommandRestore(p_Player, p_Args)
	m_Console:OnConsoleCommandRestore(p_Player, p_Args)
end

-- =============================================
-- Register Callbacks
-- =============================================

function FunBotServer:OnServerSettingsCallback(p_Instance)
	p_Instance = ServerSettings(p_Instance)
	p_Instance:MakeWritable()

	if USE_REAL_DAMAGE then
		p_Instance.isRenderDamageEvents = true
	else
		p_Instance.isRenderDamageEvents = false
	end
end

function FunBotServer:OnSyncedGameSettingsCallback(p_Instance)
	p_Instance = SyncedGameSettings(p_Instance)
	p_Instance:MakeWritable()

	if USE_REAL_DAMAGE then
		p_Instance.allowClientSideDamageArbitration = false
	else
		p_Instance.allowClientSideDamageArbitration = true
	end
end

function FunBotServer:OnAutoTeamEntityDataCallback(p_Instance)
	p_Instance = AutoTeamEntityData(p_Instance)
	p_Instance:MakeWritable()
	p_Instance.rotateTeamOnNewRound = false
	p_Instance.teamAssignMode = TeamAssignMode.TamOneTeam
	p_Instance.playerCountNeededToAutoBalance = 127
	p_Instance.teamDifferenceToAutoBalance = 127
	p_Instance.autoBalance = false
	p_Instance.forceIntoSquad = true
end

function FunBotServer:OnHumanPlayerEntityDataCallback(p_Instance)
	p_Instance = HumanPlayerEntityData(p_Instance)
	self.m_PlayerKilledDelay = p_Instance.playerKilledDelay
end

-- =============================================
-- Functions
-- =============================================

function FunBotServer:OnModReloaded()
	local s_FullLevelPath = SharedUtils:GetLevelName()

	if s_FullLevelPath == nil then
		return
	end

	s_FullLevelPath = s_FullLevelPath:split('/')
	local s_Level = s_FullLevelPath[#s_FullLevelPath]
	local s_GameMode = SharedUtils:GetCurrentGameMode()
	m_Logger:Write(s_Level .. '_' .. s_GameMode .. ' reloaded')

	if s_Level ~= nil and s_GameMode ~= nil then
		self:OnLevelLoaded(s_Level, s_GameMode)
	end
end

function FunBotServer:SetRespawnDelay()
	local s_RconResponseTable = RCON:SendCommand('vars.playerRespawnTime')
	local s_RespawnTimeModifier = tonumber(s_RconResponseTable[2]) / 100

	if self.m_PlayerKilledDelay > 0 and s_RespawnTimeModifier ~= nil then
		Globals.RespawnDelay = self.m_PlayerKilledDelay * s_RespawnTimeModifier
	else
		Globals.RespawnDelay = 10.0
	end
end

function FunBotServer:ScambleBotNames()
	for i = #BotNames, 2, -1 do
		local j = math.random(i)
		BotNames[i], BotNames[j] = BotNames[j], BotNames[i]
	end
end

function FunBotServer:DetectSpecialMods()
	local s_RconResponseTable = RCON:SendCommand('modlist.ListRunning')
	Globals.IsInputRestrictionDisabled = false
	Globals.RemoveKitVisuals = false

	for i = 2, #s_RconResponseTable do
		local s_ModName = s_RconResponseTable[i]

		if string.find(s_ModName:lower(), "preround") ~= nil then
			Globals.IsInputRestrictionDisabled = true
		end

		if string.find(s_ModName:lower(), "civilianizer") ~= nil then
			Globals.RemoveKitVisuals = true
		end
	end
end

function FunBotServer:RegisterInputRestrictionEventCallbacks()
	-- disable inputs on start of round
	Globals.IsInputAllowed = true

	if Globals.IsInputRestrictionDisabled then
		return
	end

	local s_EntityIterator = EntityManager:GetIterator("ServerInputRestrictionEntity")
	local s_Entity = s_EntityIterator:Next()

	while s_Entity do
		s_Entity = Entity(s_Entity)

		if s_Entity.data.instanceGuid == Guid('E8C37E6A-0C8B-4F97-ABDD-28715376BD2D') or -- cq / cq assault / tank- / air superiority
		s_Entity.data.instanceGuid == Guid('593710B7-EDC4-4EDB-BE20-323E7B0CE023') or -- tdm XP4
		s_Entity.data.instanceGuid == Guid('6F42FBE3-428A-463A-9014-AA0C6E09DA64') or -- tdm
		s_Entity.data.instanceGuid == Guid('9EDC59FB-5821-4A37-A739-FE867F251000') or -- rush / sq rush
		s_Entity.data.instanceGuid == Guid('BF4003AC-4B85-46DC-8975-E6682815204D') or -- domination / scavenger
		s_Entity.data.instanceGuid == Guid('A0158B87-FA34-4ED2-B752-EBFC1A34B081') or -- gunmaster XP4
		s_Entity.data.instanceGuid == Guid('AAF90FE3-D1CA-4CFE-84F3-66C6146AD96F') or -- gunmaster
		s_Entity.data.instanceGuid == Guid('753BD81F-07AC-4140-B05C-24210E1DF3FA') or -- sqdm XP4
		s_Entity.data.instanceGuid == Guid('CBFB0D7E-8561-4216-9AB2-99E14E9D18D0') or -- sqdm noVehicles
		s_Entity.data.instanceGuid == Guid('A40B08B7-D781-487A-8D0C-2E1B911C1949') then -- sqdm
		-- rip CTF
			s_Entity:RegisterEventCallback(function(p_Entity, p_Event)
				if p_Event.eventId == MathUtils:FNVHash("Activate") and Globals.IsInputAllowed then
					Globals.IsInputAllowed = false
				elseif p_Event.eventId == MathUtils:FNVHash("Deactivate") and not Globals.IsInputAllowed then
					Globals.IsInputAllowed = true
				end
			end)
		end

		s_Entity = s_EntityIterator:Next()
	end
end

function FunBotServer:SetMaxBotsPerTeam(p_GameMode)
	if p_GameMode == 'TeamDeathMatchC0' then
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamTdmc
	elseif p_GameMode == 'TeamDeathMatch0' then
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamTdm
	elseif p_GameMode == 'SquadDeathMatch0' then
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamSdm
	elseif p_GameMode == 'GunMaster0' then
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamGm
	elseif p_GameMode == 'Scavenger0' then
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamS
	elseif p_GameMode == 'ConquestLarge0' then
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamCl
	elseif p_GameMode == 'ConquestSmall0' or p_GameMode == 'BFLAG' then
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamCs
	elseif p_GameMode == 'ConquestAssaultLarge0' then
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamCal
	elseif p_GameMode == 'ConquestAssaultSmall0' or p_GameMode == 'ConquestAssaultSmall1' then
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamCas
	elseif p_GameMode == 'RushLarge0' then
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamRl
	elseif p_GameMode == 'Domination0' then
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamD
	elseif p_GameMode == 'CaptureTheFlag0' then
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamCtf
	else
		Globals.MaxBotsPerTeam = Config.MaxBotsPerTeamDefault
	end
end

function FunBotServer:SetGameMode(p_GameMode)
	Globals.NrOfTeams = 2
	if p_GameMode == 'TeamDeathMatchC0' or p_GameMode == 'TeamDeathMatch0' then
		Globals.IsTdm = true
	else
		Globals.IsTdm = false
	end

	if p_GameMode == 'SquadDeathMatch0' then
		Globals.NrOfTeams = 4
		Globals.IsSdm = true
	else
		Globals.IsSdm = false
	end

	if p_GameMode == 'GunMaster0' then
		Globals.IsGm = true
	else
		Globals.IsGm = false
	end

	if p_GameMode == 'Scavenger0' then
		Globals.IsScavenger = true
	else
		Globals.IsScavenger = false
	end

	if p_GameMode == 'ConquestLarge0' or
	p_GameMode == 'ConquestSmall0' or
	p_GameMode == 'ConquestAssaultLarge0' or
	p_GameMode == 'ConquestAssaultSmall0' or
	p_GameMode == 'ConquestAssaultSmall1' or
	p_GameMode == 'BFLAG'then
		Globals.IsConquest = true
	else
		Globals.IsConquest = false
	end

	if p_GameMode == 'ConquestAssaultLarge0' or
	p_GameMode == 'ConquestAssaultSmall0' or
	p_GameMode == 'ConquestAssaultSmall1' then
		Globals.IsAssault = true
	else
		Globals.IsAssault = false
	end

	if p_GameMode == 'Domination0' then
		Globals.IsDomination = true
	else
		Globals.IsDomination = false
	end

	if p_GameMode == 'RushLarge0' or 
	p_GameMode == 'SquadRush0' then
		Globals.IsRush = true
	else
		Globals.IsRush = false
	end

	if p_GameMode == 'SquadRush0' then
		Globals.IsSquadRush = true
	else
		Globals.IsSquadRush = false
	end
end

if g_FunBotServer == nil then
	g_FunBotServer = FunBotServer()
end

return g_FunBotServer
