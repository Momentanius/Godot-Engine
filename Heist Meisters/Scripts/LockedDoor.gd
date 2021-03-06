extends "res://Scripts/Door.gd"

var combination
var guess = []

func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click and not $AnimationPlayer.is_playing():
		$CanvasLayer/NumberPad.popup_centered()
		

func _on_Door_body_exited(body):
	if body == Global.Player:
		can_click = false
		$CanvasLayer/NumberPad.hide()
		$CanvasLayer/NumberPad.reset_lock()


func _on_NumberPad_combination_correct():
	open_door()


func _on_Computer_combination(combination_new, lock_group):
	combination = combination_new
	$CanvasLayer/NumberPad.combination = combination
	$Label.rect_rotation = -rotation_degrees
	$Label.text = lock_group


func _on_ExitDetection_body_entered(body):
	open()
