function GM:PlayerUse(ply,ent)
	if(IsValid(ply) && ply:IsPlayer()) then
		if(ent != nil && ent:IsPlayer()) then
			if(ply:GetNWBool("PokeRP_Battling") ~= true) then
				ply:SetNWBool("PokeRP_Requesting",true)
				ply:SetNWEntity("PokeRP_RequestTarget",ent)
				net.Start("PokeRP_Requesting")
				net.WriteEntity(ply)
				net.Send(ent)
			end
		end
	end
end

function GM:PlayerDeath( victim, inflictor, attacker )
	if(victim:GetNWBool("PokeRP_Battling") == true) then
		if(victim:GetNWEntity("PokeRP_Target") == attacker) then
			ply:SetNWBool("PokeRP_Battling",false)
			ply:SetNWEntity("PokeRP_Target",nil)
		end
	end
end

function GM:PlayerShouldTakeDamage( ply, attacker ) 
	if(ply:GetNWBool("PokeRP_Battling") == true) then
		return (ply:GetNWEntity("PokeRP_Target") == attacker)
	end
	return true
end

function GM:CanPlayerSuicide( ply )
	return (ply:GetNWBool("PokeRP_Battling") ~= true)
end