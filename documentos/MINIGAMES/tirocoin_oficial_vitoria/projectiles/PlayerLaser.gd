extends Area2D

var velocidade = 1000 

func _physics_process(delta):
	global_position.y += -velocidade * delta
	
func _on_PlayerLaser_area_entered(area):
	if area.is_in_group("inimigos"):
		area.tomar_dano(1)
		queue_free()
