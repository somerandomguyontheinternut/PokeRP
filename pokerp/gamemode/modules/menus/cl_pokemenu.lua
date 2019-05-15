function PokeRP.F4Menu()
	if(IsValid(PokeRP.F4Frame)) then return end
	PokeRP.F4Frame = vgui.Create("DFrame")
end


--[[
To Make Custom F4 Menus Override This Function
function PokeRP.CustomizeFrame
	-- ur shit
end


function PRM_MApi.Derma(DPanel,Parent,Size,Pos,TextIfAny)
]]--
function PokeRP.CustomizeFrame()
	PRP_MApi.Derma("DButton",PokeRP.F4Frame,PRP_MApi.2DVector(50,50),PRP_MApi.2DVector(50,50),"Hey",nil,function() print("ha") end)
end