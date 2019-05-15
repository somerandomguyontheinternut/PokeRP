util.AddNetworkString("PokeRP_SetPoke")


net.Receive("PokeRP_SetPoke",function(len,ply)
	local poke = net.ReadInt(32)
	if(poke == -1) then
		ply:SetTeam(1)
		ply:SetNWInt("PokeRP_Pokemon",poke)
		ply:Respawn()
	end
	if(poke <= #PokeRP.Pokemons) then
		ply:SetNWInt("PokeRP_Pokemon",poke)
		ply:SetTeam(2)
		ply:Respawn()
	end
end)