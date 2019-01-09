extends Node2D

var timeout = false

func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()

func fire():
	if not timeout:
		#carrega uma criança de trovão, bom pra balas
		$Sprite/RayCast2D.add_child(load(Global.Lightning).instance())
		$Sprite/Timer.start()
		timeout = true

func _on_Timer_timeout():
	timeout = false
