function GM:PostDrawOpaqueRenderables()
if(LocalPlayer():GetNWBool("Battling") ~= true) then return end

local ply = LocalPlayer():GetNWEntity("Target")
	cam.Start3D2D(LocalPlayer():GetPos(),(targ:GetPos()-LocalPlayer():GetPos()):Angle(),1)
		surface.SetDrawColor( 0,255,0 )
		surface.DrawRect( 0, 0, 8, 32 )
	cam.End3D2D()
end


