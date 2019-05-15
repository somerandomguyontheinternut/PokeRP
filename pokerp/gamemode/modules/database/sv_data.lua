--[[
Create a Table For The Player Information
]]--

function GM:DatabaseInitialized()
    MySQLite.query([[
                CREATE TABLE IF NOT EXISTS pokerp_player(
                    uid BIGINT NOT NULL PRIMARY KEY,
                    rpname VARCHAR(45),
                    level INTEGER NOT NULL,
                    money INTEGER NOT NULL
                );
            ]])
end





local plymeta = FindMetaTable( "Player" )
function plymeta:RecoverPlayerData()
    PokeRP.retrievePlayerData(self,function(data) 
		if(not data) then
			local query = [[REPLACE INTO pokerp_player VALUES (%s, %s, %s, %s);]]
			MySQLite.query(query:format(self:SteamID64(),MySQLite.SQLStr(self:GetName()),1,1000))
			self:SetNWInt("lPokeRP_Level",1)
			self:SetNWInt("PokeRP_Money",1000)
			return;
		end
    self:SetNWInt("PokeRP_Level",data[1].level)
    self:SetNWInt("PokeRP_Money",data[1].money)
    end,function(err) print(err) end)
end

function PokeRP.offlinePlayerData(steamid64, callback, failed)
    
    local query = [[SELECT rpname, money, level FROM pokerp_player WHERE uid = %s]]

    MySQLite.query(query:format(steamid64), callback)
end

function PokeRP.retrievePlayerData(ply, callback, failed, attempts, err)
    attempts = attempts or 0

    if attempts > 3 then return failed(err) end

    PokeRP.offlinePlayerData(ply:SteamID64(), callback, function(sqlErr)
        if not IsValid(ply) then return end

        PokeRP.retrievePlayerData(ply, callback, failed, attempts + 1, sqlErr)
    end)
end