AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

include( "mysql.lua" )
include( "sv_data.lua" )
include( "sv_money.lua" )
include( "sv_level.lua" )
util.AddNetworkString("SetPoke")
util.AddNetworkString("SetTeam")
net.Receive("SetTeam",function(len,ply)
    local teamnum = net.ReadInt(32)
    if(teamnum == 1) then
        ply:SetTeam(teamnum)
        ply:SetNWInt("Pokemon",0)
        ply:Spawn()
    end
end)

net.Receive("SetPoke",function(len,ply)
    local pokenum = net.ReadInt(32)
    if(not (pokenum > #poketbl or pokenum < 1)) then
        ply:SetTeam(2)
        ply:SetNWInt("Pokemon",pokenum)
        ply:Spawn() 
        ply:SendLua('Derma_Message( "You Are Now A "..poketbl['..pokenum..'].name, "Congrats", "OK" )')
    end
end)

function GM:PlayerLoadout(ply)
    local pokenum = ply:GetNWInt("Pokemon")
    if(pokenum > 0 and ply:Team() == 2) then
        ply:SetHealth(poketbl[pokenum].health)
        ply:SetMaxHealth(poketbl[pokenum].health)  
        for i=1,#poketbl[pokenum].movesets do
            ply:Give(poketbl[pokenum].movesets[i]) 
        end
    end
end

function GM:PlayerCanHearPlayersVoice( listener, talker )
	if listener:GetPos():Distance( talker:GetPos() ) > 500 then return false,true end
end

function GM:PlayerInitialSpawn( ply )
	ply:SetTeam(1)
	ply:RecoverPlayerData()
end

function GM:ShowSpare2(ply)
    ply:SendLua("PokeRP.OpenMenu()")
end

function GM:PlayerSetModel( ply )
    if(ply:Team() == 2) then
	    ply:SetModel( poketbl[ply:GetNWInt("Pokemon")].model )
	end
end


 MySQLite.initialize()