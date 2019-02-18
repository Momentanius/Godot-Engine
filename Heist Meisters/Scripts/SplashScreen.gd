extends CanvasLayer


func _on_Level_1_pressed(): #Play Game
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")


func _on_Button_pressed(): #Play Tutorial
	get_tree().change_scene("res://Scenes/Levels/Tutorial.tscn")


func _on_Button2_pressed(): #Quit
	get_tree().quit()
