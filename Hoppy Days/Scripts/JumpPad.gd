extends Area2D

func _on_JumpPad_body_entered(body):
	$AnimatedSprite.play("activated")
	$Timer.start()
	$AudioStreamPlayer.play()
	Global.Player.boost()

func _on_Timer_timeout():
	$AnimatedSprite.play("idle")