extends Area2D

signal obstaculo_morrer

export (int) var velocidade = 300

var vida = 1

func _physics_process(delta):
	global_position.y += velocidade * delta
	
func tomar_dano(dano):
	vida -= dano
	if vida <= 0:
		queue_free()
		emit_signal("obstaculo_morrer")

func _on_Obstaculo_area_entered(area):
	if area is TaxiPlayer:
		area.tomar_dano(1)
