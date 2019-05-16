net.Receive("PokeRP_Requesting",function()
local ent = net.ReadEntity()
PokeRP.BattleMenu(ent)
end)