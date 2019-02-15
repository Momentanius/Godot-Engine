extends Node2D

func _ready():
	update_pointer_position()

func update_pointer_position():
	var pointer = $ObjectivePointer
	if $ObjectiveMarkers.get_child(0) != null:
		var marker = $ObjectiveMarkers.get_child(0) # pega a primeira criança de ObjectiveMarkers
		$Tween.interpolate_property(pointer, "position", pointer.position, marker.position,
				0.5, Tween.TRANS_SINE,Tween.EASE_IN_OUT)
		$Tween.start()
		$ObjectiveMarkers.remove_child(marker) #Remova a criança mais atual.
		$AudioStreamPlayer.play()

func _on_ObjectiveMove_body_entered(body):
	update_pointer_position()


func _on_ObjectiveDoor_body_entered(body):
	update_pointer_position()


func _on_ObjectiveNightvision_body_entered(body):
	update_pointer_position()
	

func _on_BriefCase_body_entered(body):
	update_pointer_position()
