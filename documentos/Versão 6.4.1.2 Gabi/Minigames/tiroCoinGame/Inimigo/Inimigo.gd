extends Area2D

signal inimigo_morre

export (int) var velocidade = 200

var vida = 1

func _physics_process(delta):
	global_position.y += velocidade * delta
	
func tomar_dano(dano):
	vida -= dano
	if vida <= 0:
		queue_free()
		emit_signal("inimigo_morre")
		
func _on_Inimigo_area_entered(area):
	if area is NavePlayer:
		area.tomar_dano(1)
