function PokeRP.F4Menu()
	if(IsValid(PokeRP.F4Frame)) then return end
	PokeRP.F4Frame = vgui.Create("DFrame")
	PokeRP.CustomizeF4Frame()
end


--[[
To Make Custom F4 Menus Override This Function
function PokeRP.CustomizeF4Frame
	-- ur shit
end


function PRM_MApi.Derma(DPanel,Parent,Size,Pos,TextIfAny)
]]--
function PokeRP.CustomizeF4Frame()
	PokeRP.F4Frame:MakePopup()
	PokeRP.F4Frame:SetSize(500,500)
	PokeRP.F4Frame:Center()
	PRP_MApi.Derma("DButton",PokeRP.F4Frame,PRP_MApi.Vector2D(50,50),PRP_MApi.Vector2D(220,225),"Trainer",nil,function() net.Start("PokeRP_SetPoke") net.WriteInt(-1,32) net.SendToServer() PokeRP.F4Frame:Close() end)
	PRP_MApi.Derma("DButton",PokeRP.F4Frame,PRP_MApi.Vector2D(50,50),PRP_MApi.Vector2D(280,225),"Pokemon",nil,function() PokeRP.PokeMenu() PokeRP.F4Frame:Close() end)
end