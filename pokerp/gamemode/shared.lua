GM.Name = "PokeRP"
GM.Author = "me lol"
GM.Email = "dont have to knows"
GM.Website = "shhhhh"

PokeRP = {}
poketbl = {
    {name = "Charizard", health = "56", movesets = {"move_firefang"}, model = "models/yunpolmodels/pokemon/gen 1/charmander.mdl" },
    {name = "Bulbasaur", health = "45", movesets = {"move_megadrain"}, model = "models/yunpolmodels/pokemon/gen 1/bulbasaur.mdl" },
    {name = "Pikachu", health = "50", movesets = {"move_thunderbolt"}, model = "models/yunpolmodels/pokemon/gen 1/pikachu_male.mdl"}
}

DeriveGamemode( "sandbox" )
function GM:Initialize()
	
end

TEAM_TRAINERS,TEAM_POKEMON = 1,2

team.SetUp(1,"Trainers", Color(0,0,255))
team.SetUp(2,"Pokemon", Color(255,0,0))