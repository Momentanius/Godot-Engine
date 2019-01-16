extends Area2D

var can_click = false

func _on_Door_body_entered(body):
	if not body == Global.Player and not $AnimationPlayer.is_playing(): #Se um guarda entrou nessa área
		open_door()
	else:
		can_click = true
	

func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		open_door()

func _on_Door_body_exited(body):
	if body == Global.Player:
		can_click = false


func open_door():
	$AnimationPlayer.play("Open")