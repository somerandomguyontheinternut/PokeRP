local plymeta = FindMetaTable( "Player" )



function plymeta:SetMoney(amount)
    MySQLite.query([[UPDATE pokerp_player SET wallet = ]] .. amount .. [[ WHERE uid = ]] .. self:SteamID64())
end

function plymeta:AddMoney(Money)
    self:SetMoney(self:GetNWInt("money") + Money)
end