net.Receive("PokeRP_SetPoke",function(len,ply)
	local poke = net.ReadInt(32)
	if(poke <= #PokeRP.Pokemons)
		ply:SetNWInt("PokeRP_Pokemon",poke)
		ply:SetTeam(2)
		ply:Respawn()
	end
end