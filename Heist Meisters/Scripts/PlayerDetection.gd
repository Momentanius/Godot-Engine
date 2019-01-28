extends "res://Scripts/Character.gd"

const FOV_TOLERANCE = 20
const RED = Color(1,.25,.25)
const WHITE = Color(1,1,1)
const MAX_DETECTION_RANGE = 250

onready var Player = Global.Player # make this level neutral

func _ready():
	add_to_group("npc")

func _process(delta):
	if Player_is_is_FOV_TOLERANCE() and Player_is_in_line_of_sight():
		$Torch.color = RED
		get_tree().call_group('SuspicionMeter', "player_seen")
	else: 
		$Torch.color = WHITE

func Player_is_is_FOV_TOLERANCE():
	var NPC_facing_direction = Vector2(1,0).rotated(global_rotation)
	var direction_to_player = (Player.position - global_position).normalized()
	
	if abs(direction_to_player.angle_to(NPC_facing_direction)) < deg2rad(FOV_TOLERANCE):
		return true
	else:
		return false

func Player_is_in_line_of_sight():
	var space = get_world_2d().direct_space_state
	var LOS_obstacle = space.intersect_ray(global_position, Player.global_position, [self], collision_mask)
	
	#qual a distância do jogador pra line of sight?
	var distance_player = Player.global_position.distance_to(global_position)
	var player_in_range = distance_player < MAX_DETECTION_RANGE
	
	if LOS_obstacle.collider == Player and player_in_range :
		return true
	else:
		return false
		

func nightvision_mode():
	$Torch.enabled = false
	
func darkvision_mode():
	$Torch.enabled = true