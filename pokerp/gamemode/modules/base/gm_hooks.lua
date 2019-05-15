function GM:PlayerLoadout(ply)
	if(ply:Team() == 1) then
		for i=1,#PokeRP.TrainerWeapons do
			ply:Give(PokeRP.TrainerWeapons[i])
		end
	else
		for i=1,#PokeRP.Pokemons[ply:GetNWInt("PokeRP_Pokemon")].movesets do
			ply:Give(PokeRP.Pokemons[ply:GetNWInt("PokeRP_Pokemon")].movesets[i])
		end
	end
end

function GM:PlayerSetModel(ply)
	if(ply:Team() != 2) then return end
	ply:SetModel(PokeRP.Pokemons[ply:GetNWInt("PokeRP_Pokemon")].model)
end

function GM:PlayerInitialSpawn(ply)
	ply:RecoverPlayerData()
end