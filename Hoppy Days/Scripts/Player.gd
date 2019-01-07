extends KinematicBody2D

var motion = Vector2()
var SPEED = 750

#Toda vez que passar pra uma nova frame / faça alguma coisa (Physics Process)
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right") :
		motion.x = -SPEED
	else:
		motion.x = 0
	#Move and Slide | Move and Collide. Move and Slide é melhor para pisos, tetos, etc. 
	move_and_slide(motion)
	pass

func _ready():
	pass
