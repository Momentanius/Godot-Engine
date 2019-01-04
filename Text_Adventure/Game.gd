extends Node2D

var introduction = "Era uma bela manhã quando Toje estava comendo pão com Shmia na floresta."
var character_name = "Narrador"

func _ready():
	$BackgroundCave/ChatBox/ChatText.text = introduction
	$BackgroundCave/ChatBox/CharacterName.text = character_name
	pass
