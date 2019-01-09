extends AnimatedSprite

func _ready():
	pass


func _on_Area2D_body_entered(body):
	Global.GameState.coin_up()
	$AnimationPlayer.play("Die")

func die():
	queue_free()
