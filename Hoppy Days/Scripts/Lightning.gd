extends Area2D

const SPEED = 450
var x_pos = Vector2()

func _ready():
	x_pos = global_position.x
	pass

func _physics_process(delta):
	move_down_screen(delta)
	manage_collision()
	
	if not $VisibilityNotifier2D.is_on_screen(): 
		queue_free()

func move_down_screen(delta):
	global_position.y += SPEED * delta
	global_position.x = x_pos

func manage_collision():
	var collider = get_overlapping_bodies() #Retorna uma lista de coisas dentro da área
	for object in collider:
		if object == Global.Player:
			Global.GameState.hurt()
		queue_free()
