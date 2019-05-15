include( "shared.lua" )


function PokeRP.PokePick()
    if(IsValid(PokeMenu)) then return end 
    local PokeMenu = vgui.Create("DFrame")
    PokeMenu:MakePopup()
    PokeMenu:SetSize(500,500)
    PokeMenu:Center()
    PokeMenu:ShowCloseButton( false )
    local DScrollPanel = vgui.Create( "DScrollPanel", PokeMenu )
    DScrollPanel:Dock( FILL )
    local layout = vgui.Create( "DListLayout" )
    layout:SetSize( 500, 480 )
    layout:SetPos(0,100)
    layout:SetPaintBackground( true )
    layout:SetBackgroundColor( Color( 0, 100, 100 ) )
    
    --Buttons
    for i=1,#poketbl do
        local bPokemon = vgui.Create("DButton",PokeMenu)
        bPokemon:SetText(poketbl[i].name.."\n".."HP: ".. poketbl[i].health)
        bPokemon:SetSize(500,175)
        local icon = vgui.Create( "DModelPanel", bPokemon)
        icon:SetSize( 200, 175 )
        icon:SetModel( poketbl[i].model )
        bPokemon.DoClick = function()
            PokeMenu:Close()
            net.Start("SetPoke")
            net.WriteInt(i,32)
            net.SendToServer()
        end
        layout:Add(bPokemon)
    end
    DScrollPanel:Add(layout)
end

function PokeRP.OpenMenu()
    if(IsValid(Menu)) then return end 
    Menu = vgui.Create("DFrame")
    Menu:MakePopup()
    Menu:SetSize(500,500)
    Menu:Center()
    --Buttons
    bPokemon = vgui.Create("DButton",Menu)
    bPokemon:SetPos(150,260)
    bPokemon:SetSize(200,50)
    bPokemon:SetText("Pokemon")
    bPokemon.DoClick = function()
        PokeRP.PokePick()
        Menu:Close()
    end
    bTrainer = vgui.Create("DButton",Menu)
    bTrainer:SetPos(150,190)
    bTrainer:SetSize(200,50)
    bTrainer:SetText("Trainer")
    bTrainer.DoClick = function()
        net.Start("SetTeam")
        net.WriteInt(1,32)
        net.SendToServer()
        Menu:Close()
    end
end