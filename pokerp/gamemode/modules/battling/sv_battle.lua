function GM:Use(ply)
	if(IsValid(ply) && ply:IsPlayer()) then
		local EyeTr = ply:GetEyeTraceNoCursor()
		if(EyeTr.Entity != nil && EyeTr.Entity:IsPlayer()) then
			if(ply:GetNWBool("Battling") ~= true) then
				ply:SetNWBool("Battling",true)
				ply:SetNWEntity("Target",EyeTr.Entity)
				ply:SendLua([[
				ply:SetNWBool("Battling",true)
				ply:SetNWEntity("Target",EyeTr.Entity)
				]])
			end
		end
	end
end

function GM:PlayerDeath( victim, inflictor, attacker )
	if(victim:GetNWBool("Battling") == true) then
		if(victim:GetNWEntity("Target") == attacker) then
			ply:SetNWBool("Battling",false)
			ply:SetNWEntity("Target",nil)
			ply:SendLua([[
			ply:SetNWBool("Battling",false)
			ply:SetNWEntity("Target",nil)
			]])
		end
	end
end

function GM:PlayerShouldTakeDamage( ply, attacker ) 
	if(ply:GetNWBool("Battling") == true) then
		return (ply:GetNWEntity("Target") == attacker)
	end
	return true
end

function GM:CanPlayerSuicide( ply )
	return (ply:GetNWBool("Battling") ~= true)
end