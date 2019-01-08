extends Node2D

#Quando iniciar o jogo através do GameState.gd, seta o Gamestate de Global como este cara.
export var starting_lives = 3
var lives

func _ready():
	Global.GameState = self
	lives = starting_lives
	update_GUI()
	

func update_GUI():
	Global.GUI.update_GUI(lives)

func hurt():
	lives -= 1
	if lives < 0:
		end_game()
	Global.Player.hurt()
	update_GUI()

func end_game():
	get_tree().change_scene("res://GameOver.tscn")