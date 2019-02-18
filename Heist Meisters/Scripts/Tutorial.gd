extends Node2D

var text

func _ready():
	add_to_group("interface")
	text = get_json()
	update_pointer_position(0)
	$TutorialGUI/Popup.show()

func get_json():
	var file = File.new()
	file.open(Global.tutorial_messages, file.READ)
	var content = file.get_as_text()
	file.close()
	return parse_json(content)


func update_pointer_position(number):
	var pointer = $ObjectivePointer
	if $ObjectiveMarkers.get_child(number) != null:
		var marker = $ObjectiveMarkers.get_child(0) # pega a primeira criança de ObjectiveMarkers
		$Tween.interpolate_property(pointer, "position", pointer.position, marker.position,
				0.5, Tween.TRANS_SINE,Tween.EASE_IN_OUT)
		$Tween.start()
		$ObjectiveMarkers.remove_child(marker) #Remova a criança mais atual.
		$AudioStreamPlayer.play()
		$TutorialGUI/Popup/Label.text = text[str(number)]

func _on_ObjectiveMove_body_entered(body):
	update_pointer_position(1)

func _on_ObjectiveDoor_body_entered(body):
	update_pointer_position(2)

func _on_ObjectiveNightvision_body_entered(body):
	update_pointer_position(3)
	darkvision_mode()

func _on_BriefCase_body_entered(body):
	update_pointer_position(4)

func nightvision_mode():
	$TutorialGUI/Popup.hide()

func darkvision_mode():
	$TutorialGUI/Popup.show()
	