GM.Name = "PokeRP"
GM.Author = "me lol"
GM.Email = "dont have to knows"
GM.Website = "shhhhh"

PokeRP = {}

DeriveGamemode( "sandbox" )
function GM:Initialize() print("yey just loaded") end

TEAM_TRAINERS,TEAM_POKEMON = 1,2

team.SetUp(1,"Trainers", Color(0,0,255))
team.SetUp(2,"Pokemon", Color(255,0,0))