extends "res://Scripts/Character.gd"

var motion = Vector2()
var torchHidden = true
var vision_change_on_cooldown = false

var disguised

enum vision_mode {DARK, NIGHTVISION}


func _ready():
	Global.Player = self
	vision_mode = DARK

func _process(delta):
	update_motion(delta)
	move_and_slide(motion)

func toggle_disguise():
	if disguised:
		reveal()
	else:
		disguise()

func reveal():
	$Sprite.texture = load(Global.player_sprite)
	$Light2D.texture = load(Global.player_sprite)
	$LightOccluder2D.occluder = load(Global.player_occluder)
	collision_layer = 1
	disguised = false
	
func disguise():
	$Sprite.texture = load(Global.box_sprite)
	$Light2D.texture = load(Global.box_sprite)
	$LightOccluder2D.occluder = load(Global.box_occluder)
	collision_layer = 16
	disguised = true

	


#É chamado se o jogador apertar um botão
#func _input(event):
#	if Input.is_action_just_pressed("ui_select"):
#		light_torch()
#
#
#func light_torch():
#	if $Torch.enabled:
#		$Torch.enabled = false
#	else:
#		$Torch.enabled = true
#

func _input(event):
	if Input.is_action_just_pressed("ui_vision_mode_change") and not vision_change_on_cooldown:
		vision_change_on_cooldown = true
		$VisionModeTimer.start()
		cycle_vision_mode()
	if Input.is_action_just_pressed("ui_toggle_disguise"):
		toggle_disguise()
		

func cycle_vision_mode():
	if vision_mode == DARK : #change vision mode
		get_tree().call_group("interface", "nightvision_mode")
		vision_mode = NIGHTVISION

	elif vision_mode == NIGHTVISION:
		get_tree().call_group("interface", "darkvision_mode")
		vision_mode = DARK
	pass

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

func _on_VisionModeTimer_timeout():
	vision_change_on_cooldown = false
