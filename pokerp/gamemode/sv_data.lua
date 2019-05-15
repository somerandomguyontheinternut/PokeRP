function GM:DatabaseInitialized()
    MySQLite.query([[
                CREATE TABLE IF NOT EXISTS pokerp_player(
                    uid BIGINT NOT NULL PRIMARY KEY,
                    rpname VARCHAR(45),
                    level INTEGER NOT NULL,
                    wallet INTEGER NOT NULL
                );
            ]])
end

local plymeta = FindMetaTable( "Player" )

function plymeta:RecoverPlayerData()
    PokeRP.retrievePlayerData(self,function(data) 
    if(not data) then
        local query = [[REPLACE INTO pokerp_player
VALUES (%s, %s, %s, %s);]]
        MySQLite.query(query:format(self:SteamID64(),MySQLite.SQLStr(self:GetName()),1,1000))
        self:SetNWInt("level",1)
        self:SetNWInt("money",1000)
        return;
    end
    self:SetNWInt("level",data[1].level)
    self:SetNWInt("money",data[1].wallet)


    end,function() print("err") end)
end

function PokeRP.offlinePlayerData(steamid64, callback, failed)
    
    local query = [[
    SELECT rpname, wallet, level FROM pokerp_player WHERE uid = %s
    ]]

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