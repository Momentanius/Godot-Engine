extends "res://Scripts/Character.gd"

var motion = Vector2()
var torchHidden = true

func _process(delta):
	update_motion(delta)
	move_and_slide(motion)

#É chamado se o jogador apertar um botão
func _input(event):
	if Input.is_action_just_pressed("ui_select"):
		light_torch()



func light_torch():
	if $Torch.enabled:
		$Torch.enabled = false
	else:
		$Torch.enabled = true
	

func update_motion(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed('ui_up') and not Input.is_action_pressed('ui_down'):
		motion.y = clamp((motion.y - SPEED), -MAX_SPEED, 0)
	elif Input.is_action_pressed('ui_down') and not Input.is_action_pressed('ui_up'):
		motion.y = clamp((motion.y + SPEED), 0, MAX_SPEED)
	else:
		motion.y = lerp(motion.y, 0, FRICTION)
	
	if Input.is_action_pressed('ui_right') and not Input.is_action_pressed('ui_left'):
		motion.x = SPEED
	elif Input.is_action_pressed('ui_left') and not Input.is_action_pressed('ui_right'):
		motion.x = -SPEED
	else:
		motion.x = lerp(motion.x, 0, FRICTION)