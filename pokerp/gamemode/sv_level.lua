local plymeta = FindMetaTable( "Player" )

function plymeta:SetLevel(amount)
    MySQLite.query([[UPDATE pokerp_player SET level = ]] .. amount .. [[ WHERE uid = ]] .. self:SteamID64())
end

function plymeta:AddLevel(Level)
    self:SetMoney(self:GetNWInt("level") + Level)
end