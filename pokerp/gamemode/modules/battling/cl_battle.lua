function GM:PostDrawOpaqueRenderables()
if(LocalPlayer():GetNWBool("PokeRP_Battling") ~= true) then return end

local ply = LocalPlayer():GetNWEntity("PokeRP_Target")
local ang = (pos:GetPos()-LocalPlayer():GetPos()):Angle()
ang.y = ang.y + 90
	cam.Start3D2D(LocalPlayer():GetPos(),ang,1)
		surface.SetDrawColor( 0,255,0 )
		surface.DrawRect( 0, 0, 8, 100 )
	cam.End3D2D()
end


