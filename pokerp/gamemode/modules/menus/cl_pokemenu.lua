function PokeRP.PokeMenu()
	if(IsValid(PokeRP.PokeFrame)) then return end
	PokeRP.PokeFrame = vgui.Create("DFrame")
	PokeRP.CustomizePokeFrame()
end


--[[
To Make Custom F4 Menus Override This Function
function PokeRP.CustomizePokeFrame
	-- ur shit
end


function PRP_MApi.Derma(DPanel,Parent,Size,Pos,TextIfAny,PaintFunc,DoClick)
]]--
function PokeRP.CustomizePokeFrame()
	PokeRP.PokeFrame:MakePopup()
	PokeRP.PokeFrame:SetSize(500,500)
	PokeRP.PokeFrame:Center()
	local LayOut = PRP_MApi.Derma("DListLayout",PokeRP.PokeFrame,PRP_MApi.Vector2D(500,480),PRP_MApi.Vector2D(0,20))
	for i=1,#PokeRP.Pokemons do
		local btn = PRP_MApi.Derma("DButton",nil,PRP_MApi.Vector2D(500,175),nil,nil,nil,function() net.Start("PokeRP_SetPoke") net.WriteInt(i,32) net.SendToServer() end)
		local mdl = PRP_MApi.Derma("DModelPanel",btn,PRP_MApi.Vector2D(200,175))
		mdl:SetModel(PokeRP.Pokemons[i].model)
	end
end