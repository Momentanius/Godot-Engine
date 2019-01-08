extends Node2D

#Quando iniciar o jogo através do GameState.gd, seta o Gamestate de Global como este cara.
func _ready():
	Global.GameState = self
	
	
func end_game():
	get_tree().change_scene("res://GameOver.tscn")