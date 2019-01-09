extends KinematicBody2D

var motion = Vector2()
export var world_limit = 3000

const SPEED = 750
const GRAVITY = 2300
const UP = Vector2(0, -1)
const JUMP_SPEED = -850

func _ready():
	Global.Player = self

#Toda vez que passar pra uma nova frame / faça alguma coisa (Physics Process)
func _physics_process(delta):
	update_motion(delta)
	

func fall(delta):
	if is_on_floor() or is_on_ceiling():
		motion.y = 0
	else: 
		motion.y += GRAVITY * delta
	
	if position.y > world_limit:
		Global.GameState.end_game()

func hurt():
	print('isonhere')
	$AnimatedSprite.play('hurt')
	motion.y = -1200


func run():
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right") :
		motion.x = -SPEED
	else:
		motion.x = 0
	#Move and Slide | Move and Collide. Move and Slide é melhor para pisos, tetos, etc. 
	

func _process(delta):
	$AnimatedSprite.update_animation(motion)
	

func update_animation():
	$AnimatedSprite.update(motion)

func update_motion(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)

func jump():
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_SPEED
			Global.JumpSFX.play()