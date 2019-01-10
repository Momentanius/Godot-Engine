extends Sprite

var taken = false

func _on_Area2D_body_entered(body):
	if not taken:
		taken = true
		Global.GameState.coin_up(10)
		$AnimationPlayer.play("die")
		$AudioStreamPlayer.play()

func die():
	queue_free()