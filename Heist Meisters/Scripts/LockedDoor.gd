extends "res://Scripts/Door.gd"

func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click and not $AnimationPlayer.is_playing():
		$CanvasLayer/NumberPad.popup_centered()
		

func _on_Door_body_exited(body):
	if body == Global.Player:
		can_click = false
		$CanvasLayer/NumberPad.hide()
