-- This file is autogenerated out of the Settings/SettingsDefinition.lua file. 
-- For permanent changes, use this file and regenerate the Config.lua file. 

---@class Config
Config = {
    
	-- GENERAL 
	BotKit = BotKits.RANDOM_KIT,		-- The Kit of the Bots 
	BotColor = BotColors.RANDOM_COLOR,	-- The Color of the Bots 
	ZombiesDropAmmo = true,				-- Zombies drop randomly some ammo 
	RandomHealthOfZombies = true,		-- zombie-helth differs from bot to bot 
	RandomAttackSpeedOfZombies = true,	-- zombie-speed differs from bot to bot 
	RandomDamgeOfZombies = true,		-- zombie-damage differs from bot to bot 
	RandomJumpSpeedOfZombies = true,	-- zombie-high-jumps differs from bot to bot 
	ZombiesProne = true,				-- Zombies can prone when walking around 
	ZombiesCrouch = true,				-- Zombies can crouch when walking around 
	ZombiesWalk = true,					-- Zombies can walk when walking around 
	ZombiesSprint = true,				-- Zombies can sprint when walking around 

	-- DIFFICULTY 
	BotMaxHealth = 125.0,				-- Max health of bot at spawn(default 100.0) 
	BotMinHealth = 75.0,				-- Min health of bot at spawn (default 100.0) 
	BotHeadshotDamageMultiplier = 2.0,	-- Damage multiplier for shooting bots in the head 
	BotWorseningSkill = 0.50,			-- Variation of the skill of a single bot. The higher, the worse the bots can get compared to the original settings 
	DamageFactorKnife = 1.5,			-- Original Damage from bots gets multiplied by this 
	SpeedFactorAttack = 1.2,			-- Modifies the speed while attacking. 1 = normal 
	MinSpeedFactorAttack = 0.5,			-- Modifies the minimal speed while attacking. 1 = normal 
	MinHighJumpSpeed = 5.0,				-- Min Speed the bots jump with on high-jumps 
	MaxHighJumpSpeed = 12.0,			-- Max Speed the bots jump with on high-jumps 

	-- SPAWN 
	SpawnMode = SpawnModes.wave_spawn,	-- Mode the bots spawn with 
	InitNumberOfBots = 0,				-- Bots for spawnmode 
	NewBotsPerNewPlayer = 5,			-- Number to increase Bots by when new players join 
	FactorPlayerTeamCount = 0.2,		-- Reduce player team in balanced_teams or fixed_number mode 
	BotTeam = 2,						-- Default bot team (0 = neutral / auto, 1 = US, 2 = RU) TeamId.Team2 
	BotNewLoadoutOnSpawn = true,		-- Bots get a new kit and color, if they respawn 
	MaxAssaultBots = -1,				-- Maximum number of Bots with Assault Kit. -1 = no limit 
	MaxEngineerBots = -1,				-- Maximum number of Bots with Engineer Kit. -1 = no limit 
	MaxSupportBots = -1,				-- Maximum number of Bots with Support Kit. -1 = no limit 
	MaxReconBots = -1,					-- Maximum number of Bots with Recon Kit. -1 = no limit 
	AdditionalBotSpawnDelay = 0.1,		-- Additional time a bot waits to respawn 
	MaxBotsPerTeamDefault = 128,		-- Max number of bots in one team, if no other mode fits 

	-- WAVES 
	Waves = 20,                         -- Total amount of waves needed to win. 0 = infinite
	PlayerLives = 10,                   -- Amount of time players can die before losing
	FirstWaveCount = 30,				-- Zombies that spawn in the first wave 
	IncrementZombiesPerWave = 1,		-- Zombies that are added in each new wave 
	IncrementMaxHealthPerWave = 25,		-- Zombies get more health each wave 
	IncrementDamageFactorPerWave = 0.1,	-- Zombies deal more damage each wave 
	IncrementMaxSpeedPerWave = 0.05,	-- Zombies get more speed each wave 
	IncrementJumpSpeedPerWave = 3.0,	-- Zombies get more speed each wave 
	SubtractSpawnDistancePerWave = 1,  -- Decreases the spawn distance each wave. This can help sell the effect of a continuous wave on higher zombie counts
	ZombiesAliveForNextWave = 25,		-- New wave is triggered when this number of zombies is reached 
	TimeBetweenWaves = 7.0,				-- Time in seconds between two waves 
	KillRemainingZombiesAfterWave = false,	-- Remaining Bots Get Killed before a new wave starts 

	-- BEHAVIOUR 
	FovForShooting = 270,				-- Degrees of FOV of Bot 
	FovVerticleForShooting = 270,		-- Degrees of FOV of Bot in vertical direction 
	MaxShootDistance = 125,				-- Meters before bots (not sniper) will start shooting at players 
	MaxDistanceShootBack = 150,			-- Meters until bots (not sniper) shoot back if hit 
	BotAttackMode = BotAttackModes.RandomNotSet,	-- Mode the Bots attack with. Random, Crouch or Stand 
	ShootBackIfHit = true,				-- Bot shoots back if hit 
	BotsAttackPlayers = true,			-- Bots attack Players from other team 
	BotCanKillHimself = false,			-- Bot takes fall damage or explosion-damage from own frags 
	TeleportIfStuck = true,				-- Bot teleport to their target if they are stuck 
	SnipersAttackChoppers = false,		-- Bots with sniper-rifels attack choppers 

	-- WEAPONS 
	UseRandomWeapon = false,			-- Use a random weapon out of the Weapon Set 
	Knife = "Knife",					-- Knife of Bots, if random-weapon == false 

	-- TRACE 
	DebugTracePaths = false,			-- Shows the trace line and search area from Commo Rose selection 
	WaypointRange = 50,					-- Set how far away waypoints are visible (meters) 
	DrawWaypointLines = true,			-- Draw waypoint connection lines 
	LineRange = 25,						-- Set how far away waypoint lines are visible (meters) 
	DrawWaypointIDs = true,				-- Draw the IDs of the waypoints 
	TextRange = 7,						-- Set how far away waypoint text is visible (meters) 
	DrawSpawnPoints = false,			-- Draw the Points where players can spawn 
	SpawnPointRange = 100,				-- Set how far away spawn points are visible (meters) 
	TraceDelta = 0.3,					-- Update interval of trace 
	NodesPerCycle = 400,				-- Set how many nodes get drawn per cycle. Affects performance 

	-- ADVANCED 
	DistanceForDirectAttack = 8,		-- Distance bots can hear you at 
	MeleeAttackCoolDown = 1.5,			-- The time a bot waits before attacking with melee again 
	JumpWhileShooting = true,			-- Bots jump over obstacles while shooting if needed 
	JumpWhileMoving = true,				-- Bots jump while moving. If false, only on obstacles! 
	OverWriteBotSpeedMode = BotMoveSpeeds.NoMovement,	-- 0 = no overwrite. 1 = prone, 2 = crouch, 3 = walk, 4 = run 
	SpeedFactor = 1.0,					-- Reduces the movement speed. 1 = normal, 0 = standing 
	UseRandomNames = false,				-- Changes names of the bots on every new round. Experimental right now... 
	MoveSidewards = true,				-- Bots move sidewards 
	MaxStraigtCycle = 10.0,				-- Max time bots move straight, before sidewards-movement (in sec) 
	MaxSideCycle = 5.0,					-- Max time bots move sidewards, before straight-movement (in sec) 
	MinMoveCycle = 0.3,					-- Min time bots move sidewards or straight before switching (in sec) 

	-- EXPERT 
	BotMinTimeAttackOnePlayer = 1.0,	-- The minimum time a bot attacks one player for 
	BotAttackDuration = 20,				-- The minimum time a zombie-bot tries to attack a player - recommended minimum 15, 
	MaximunYawPerSec = 450,				-- In Degrees. Rotation Movement per second 
	TargetDistanceWayPoint = 0.8,		-- The distance the bots have to reach to continue with the next Waypoint 
	KeepOneSlotForPlayers = true,		-- Always keep one slot for free new Players to join 
	DistanceToSpawnBots = 30,			-- Distance to spawn Bots away from players 
	HeightDistanceToSpawn = 2.8,		-- Distance vertically, Bots should spawn away, if closer than distance 
	DistanceToSpawnReduction = 5,		-- Reduce distance if not possible 
	MaxTrysToSpawnAtDistance = 3,		-- Try this often to spawn a bot away from players 
	AttackWayBots = true,				-- Bots on paths attack player 
	RespawnWayBots = true,				-- Bots on paths respawn if killed 
	SpawnMethod = SpawnMethod.SpawnSoldierAt,	-- Method the bots spawn with. Careful, not supported on most of the maps!! 

	-- OTHER 
	DisableUserInterface = false,		-- If true, the complete UI will be disabled (not available in the UI) 
	AllowCommForAll = false,			-- If true, all Players can access the Comm-Screen 
	DisableChatCommands = false,		-- If true, no chat commands can be used 
	DisableRCONCommands = false,		-- If true, no RCON commands can be used 
	IgnorePermissions = false,			-- If true, all permissions are ignored --> everyone can do everything 
	Language = nil,						-- de_DE as sample (default is English, when language file does not exist) 
} 
