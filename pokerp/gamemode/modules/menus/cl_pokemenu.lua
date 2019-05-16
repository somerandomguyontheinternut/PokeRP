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
	local ScrollBar =  PRP_MApi.Derma("DScrollPanel",PokeRP.PokeFrame)
	local LayOut = PRP_MApi.Derma("DListLayout",nil,PRP_MApi.Vector2D(500,480),PRP_MApi.Vector2D(0,20))
	ScrollBar:Add(LayOut)
	for i=1,#PokeRP.Pokemons do
	local str = PokeRP.Pokemons[i].name .. "\n HP:" .. PokeRP.Pokemons[i].health .. "\n Movesets"
	
	local add = 0
	for i=1,#PokeRP.Pokemons[i].movesets do
		if(add >= 2) then
			str = str .. PokeRP.Pokemons[i].movesets[i].."\n"
			add = 0
		else
			str = str .. PokeRP.Pokemons[i].movesets[i]
		end
		add = add + 1
	end
	
		local btn = PRP_MApi.Derma("DButton",nil,PRP_MApi.Vector2D(500,175),nil,str,nil,function() net.Start("PokeRP_SetPoke") net.WriteInt(i,32) net.SendToServer() PokeRP.PokeFrame:Close() end)
		local mdl = PRP_MApi.Derma("DModelPanel",btn,PRP_MApi.Vector2D(200,175))
		mdl:SetModel(PokeRP.Pokemons[i].model)
		LayOut:Add(btn)
	end
end