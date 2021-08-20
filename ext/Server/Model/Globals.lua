Globals = {
	WayPoints = {},
	ActiveTraceIndexes = 0,
	YawPerFrame = 0.0,

	IsTdm = false,
	IsSdm = false,
	IsScavenger = false,
	IsRush = false,
	IsSquadRush = false,
	IsGm = false,
	IsConquest = false,
	IsDomination = false,
	IsAssault = false,
	NrOfTeams = 0,
	MaxPlayers = 0,
	GameMode = "",
	MaxBotsPerTeam = 0,
	RespawnDelay = 0,
	IsInputAllowed = false,
	IsInputRestrictionDisabled = false,
	RemoveKitVisuals = false,
	IgnoreBotNames = {},

	RespawnWayBots = false, --used for the runtime respawn
	AttackWayBots = false, --used for the runtime attack
	SpawnMode = SpawnModes.manual --used for the runtime spawnmode
}
