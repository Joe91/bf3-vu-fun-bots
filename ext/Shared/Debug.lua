--
-- SOON DEPRECATED - A better debugging system is currently in development by @Firjens
--
Debug = {
	Globals = {
		UPDATE = true				-- Debug the Updater
	},
	Server = {
		INFO = false,				-- Global Informations
		BOT = false,				-- Debug Bot-Handling
		COMMAND = false,			-- Debug Chat- & RCON Commands
		DATABASE = false,			-- Debug Database-Operations
		GAMEDIRECTOR = false,		-- Debug the GameDirector
		VEHICLES = false,
		NODEEDITOR = false,			-- Debug the NodeEditor
		PATH = false,				-- Debug the PathSwitcher
		SETTINGS = false,			-- Debug the Settings-Migrator
		TRACE = false,				-- Debug the TraceManager
		UI = false,					-- Debug all UI things
		PERMISSIONS = false,		-- Debug all Permission things
		MODIFICATIONS = false,		-- Debug some Modifications
		RCON = false				-- Debug some RCON Commands
	},
	Client = {
		INFO = false,				-- Global Informations
		NODEEDITOR = true,			-- Debug the NodeEditor
		UI = false					-- Debug all UI things
	},
	Shared = {
		EBX = false,				-- Debug EBX-Utils
		LANGUAGE = false,			-- Debug Language
		NODECOLLECTION = false,		-- Debug NodeCollection
		DATABASE = false,			-- Debug Database-Operations
		MODIFICATIONS = false		-- Debug some Modifications
	},
	Logger = {
		ENABLED = true,
		PRINTALL = false
	}
}
