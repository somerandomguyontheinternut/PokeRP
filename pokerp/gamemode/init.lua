AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("modules/menus/cl_pokemenu.lua")
AddCSLuaFile("modules/menus/api/cl_derma.lua")



include("shared.lua")

include("config/sv_pokeconfig.lua")
include("config/sv_sqlconfig.lua")

include("modules/database/interface/sv_interface.lua")
include("modules/database/mysqlite.lua")
include("modules/database/sv_data.lua")
include("modules/base/gm_hooks.lua")

MySQLite.initialize()