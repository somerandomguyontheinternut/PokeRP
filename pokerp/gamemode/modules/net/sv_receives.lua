util.AddNetworkString("PokeRP_SetPoke")
util.AddNetworkString("PokeRP_Requesting")
util.AddNetworkString("PokeRP_AcceptBattle")

net.Receive("PokeRP_AcceptBattle",function(len,ply)
local plyer = net.ReadEntity()
local Accept = net.ReadInt(32)
	if(Accept == 1) then
		if(plyer:GetNWBool("PokeRP_Requesting") == true &&	plyer:GetNWEntity("PokeRP_RequestTarget") == ply) then
			plyer:SetNWBool("PokeRP_Battling",true)
			plyer:SetNWEntity("PokeRP_Target",ply)
			ply:SetNWBool("PokeRP_Battling",true)
			ply:SetNWEntity("PokeRP_Target",plyer)
	end
	ply:SetNWBool("PokeRP_Requesting",false)
	ply:SetNWEntity("PokeRP_RequestTarget",nil)
end)

net.Receive("PokeRP_SetPoke",function(len,ply)
	local poke = net.ReadInt(32)
	if(poke == -1) then
		ply:SetTeam(1)
		ply:SetNWInt("PokeRP_Pokemon",poke)
		ply:StripWeapons()
		ply:Spawn()
	end
	if(poke <= #PokeRP.Pokemons) then
		ply:SetNWInt("PokeRP_Pokemon",poke)
		ply:SetTeam(2)
		ply:StripWeapons()
		ply:Spawn()
	end
end)