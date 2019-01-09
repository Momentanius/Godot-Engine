extends Node2D

#Quando iniciar o jogo através do GameState.gd, seta o Gamestate de Global como este cara.
export var starting_lives = 3
export var coin_target = 4 #how many coins for an extra live
var lives
var coins = 0

func _ready():
	Global.GameState = self
	lives = starting_lives
	update_GUI()
	

func update_GUI():
	Global.GUI.update_GUI(coins, lives)

func hurt():
	lives -= 1
	if lives < 0:
		end_game()
	Global.Player.hurt()
	Global.GUI.playAnimation("Hurt")
	update_GUI()
	
func coin_up():
	coins+=1
	Global.GUI.playAnimation("CoinPulse")
	update_GUI()
	var multiple_of_coin_target = (coins % coin_target) == 0
	if multiple_of_coin_target:
		Global.GUI.playAnimation("LifePulse")
		life_up()

func life_up():
	lives+=1
	update_GUI()

func end_game():
	Global.DeathSFX.play()
	get_tree().change_scene("res://GameOver.tscn")
	