extends Node

var Player
var navigation
var destinations


# Asset Links. Must be changed manually
var nightvision_on_sfx = "res://SFX/nightvision.wav"
var nightvision_of_sfx = "res://SFX/nightvision_off.wav"

var red_light = "res://GFX/Interface/PNG/dotRed.png"
var green_light = "res://GFX/Interface/PNG/dotGreen.png"

var box_sprite = "res://GFX/PNG/Tiles/tile_129.png"
var player_sprite = "res://GFX/PNG/Hitman 1/hitman1_stand.png"

var player_occluder = "res://Scenes/Characters/Character_occluder.tres"
var box_occluder = "res://Scenes/Characters/Box_occluder.tres"