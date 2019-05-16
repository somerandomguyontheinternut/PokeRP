function PokeRP.BattleMenu(ent)
	if(IsValid(PokeRP.BattleFrame)) then return end
	PokeRP.BattleFrame = vgui.Create("DFrame")
	PokeRP.CustomizeBattleFrame(ent)
end


--[[
To Make Custom Battle Menus Override This Function
function PokeRP.CustomizeBattleFrame
	-- ur shit
end


function PRM_MApi.Derma(DPanel,Parent,Size,Pos,TextIfAny)
]]--
function PokeRP.CustomizeBattleFrame(ent)
	PokeRP.BattleFrame:MakePopup()
	PokeRP.BattleFrame:SetSize(500,500)
	PokeRP.BattleFrame:Center()
	PokeRP.BattleFrame:SetTitle(ent:Name().."Wants to Battle You, Do You Accept?")
	PRP_MApi.Derma("DButton",PokeRP.BattleFrame,PRP_MApi.Vector2D(50,50),PRP_MApi.Vector2D(220,225),"Yes",nil,function() net.Start("PokeRP_AcceptBattle") net.WriteEntity(ent) net.WriteInt(1,32) net.SendToServer() PokeRP.BattleFrame:Close() end)
	PRP_MApi.Derma("DButton",PokeRP.BattleFrame,PRP_MApi.Vector2D(50,50),PRP_MApi.Vector2D(280,225),"No",nil,function() net.Start("PokeRP_AcceptBattle") net.WriteEntity(ent) net.WriteInt(-1,32) net.SendToServer() PokeRP.BattleFrame:Close() end)
end