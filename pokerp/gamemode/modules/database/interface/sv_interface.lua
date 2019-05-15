local PlayerMeta = FindMetaTable("Player")


function PlayerMeta:SetMoney(amnt)
		MySQLite.query([[UPDATE pokerp_player SET money = ]] .. amnt .. [[ WHERE uid = ]] .. self:SteamID64())
		self:SetNWInt("PokeRP_Money",amnt)
end

function PlayerMeta:SetLevel(amnt)
		MySQLite.query([[UPDATE pokerp_player SET level = ]] .. amnt .. [[ WHERE uid = ]] .. self:SteamID64())
		self:SetNWInt("PokeRP_Level",amnt)
end