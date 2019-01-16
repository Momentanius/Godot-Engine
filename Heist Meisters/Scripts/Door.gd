extends Area2D

var can_click = false

# if not body == player faz a comparação de "o corpo entrando neste local é o jogador? Se não, carca"
func _on_Door_body_entered(body):
	if not body == Global.Player and not $AnimationPlayer.is_playing(): #Se um guarda entrou nessa área
		open_door()
		print(body.name)
	else:
		can_click = true
	

#Usado no lugar de _input por causa qeu se não ele poderia clicar emq ualquer lugar da tela
func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click and not $AnimationPlayer.is_playing():
		open_door()

func _on_Door_body_exited(body):
	if body == Global.Player:
		can_click = false


func open_door():
	$AnimationPlayer.play("Open")