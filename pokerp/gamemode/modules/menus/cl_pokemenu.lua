function PokeRP.PokeMenu()
	if(IsValid(PokeRP.PokeFrame)) then return end
	PokeRP.PokeFrame = vgui.Create("DFrame")
end


--[[
To Make Custom F4 Menus Override This Function
function PokeRP.CustomizePokeFrame
	-- ur shit
end


function PRM_MApi.Derma(DPanel,Parent,Size,Pos,TextIfAny)
]]--
function PokeRP.CustomizePokeFrame()
	PRP_MApi.Derma("DButton",PokeRP.PokeFrame,PRP_MApi.2DVector(50,50),PRP_MApi.2DVector(50,50),"Hey",nil,function() print("ha") end)
end