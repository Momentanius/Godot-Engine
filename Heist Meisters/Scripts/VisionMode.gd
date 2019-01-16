extends CanvasModulate

const DARK = Color("0f1d53")
const NIGHTVISION = Color("2bc92b")

func _ready():
	add_to_group("interface")
	color = DARK
	

func nightvision_mode():
	inform_npcs("nightvision_mode")
	color = NIGHTVISION
	$AudioStreamPlayer.stream = load(Global.nightvision_on_sfx)
	play_sfx()


func darkvision_mode():
	inform_npcs("darkvision_mode")
	color = DARK
	$AudioStreamPlayer.stream = load(Global.nightvision_of_sfx)
	play_sfx()

func play_sfx():
	$AudioStreamPlayer.play()
	

func inform_npcs(visionMode):
	get_tree().call_group("npc", visionMode)