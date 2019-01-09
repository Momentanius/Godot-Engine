extends AnimatedSprite

var taken = false


func _on_Area2D_body_entered(body):
	if not taken:
		taken = true
		Global.GameState.coin_up()
		$AnimationPlayer.play("Die")
		$AudioStreamPlayer.play()

func die():
	queue_free()
