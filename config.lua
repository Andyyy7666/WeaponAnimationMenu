------------------------------------------------------------------------
------------------------------------------------------------------------
--																	  --
--     For support join my discord: https://discord.gg/Z9Mxu72zZ6     --
--																	  --
------------------------------------------------------------------------
------------------------------------------------------------------------

Config = {}

-- Button = 0 |  Command = 1
Config.OpenMenu = 0

-- Button to open menu (if chosen in Config.OpenMenu) https://docs.fivem.net/game-references/controls/
Config.MenuButton = 51

-- This is the command that will open the menu (If chosen at Config.OpenMenu)
Config.Command = "as"

-- This is the width of the menu when open
-- Default = 80
Config.MenuWidth = 80

-- Default = 0 |  Player Name = 1  |  Custom = 2
Config.MenuTitle = 0

--This is the custom title you can set for the menu (If chosen at Config.MenuTitle)
Config.MenuTitleCustom = "Weapon Animations"

-- Aim animation every player has by default when joining the server.
-- Default = 0 | Gangster = 1 | Hillbilly = 2
Config.StartingAimAnimation = 1

-- Drawing animation every player has by default when joining the server.
-- Default = 0 | Belt holster = 1 | Leg holster = 2 | Draw from back = 3 | Draw from front = 4 | Draw front agressive = 5
Config.StartingDrawAnimation = 3

-- Weapons for drawing animations
Config.Weapons = {
	"WEAPON_PISTOL",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_SNSPISTOL",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_FLAREGUN",
	"WEAPON_STUNGUN",
	"WEAPON_REVOLVER",
}