extends CanvasLayer

func _on_TryAgain_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
	pass # replace with function body


func _on_Quit_pressed():
	get_tree().quit()
	pass # replace with function body
