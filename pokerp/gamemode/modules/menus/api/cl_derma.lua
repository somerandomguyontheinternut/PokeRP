PRP_MApi = {}

function PRP_MApi.Vector2D(val1,val2)
	local rtrn = {
	x = val1,
	y = val2
	}
	return rtrn
end

function PRP_MApi.Derma(DPanel,Parent,Size,Pos,TextIfAny,PaintFunc,DoClick)
	local Panel
	if(Parent == nil) then Panel = vgui.Create(DPanel)
	else Panel = vgui.Create(DPanel,Parent) end
	if(Size != nil) then Panel:SetSize(Size.x,Size.y) end
	if(Pos != nil) then Panel:SetPos(Pos.x,Pos.y) end
	if(TextIfAny != nil) then Panel:SetText(TextIfAny) end
	if(PaintFunc != nil) then Panel.Paint = PaintFunc end
	if(DoClick != nil) then Panel.DoClick = DoClick end
	return Panel
end