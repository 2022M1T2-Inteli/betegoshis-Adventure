extends Area2D

signal obstaculo_died

export (int) var speed = 300

var hp = 1

func _physics_process(delta):
	global_position.y += speed * delta
	
func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()
		emit_signal("obstaculo_died")

func _on_Obstaculo_area_entered(area):
	if area is Player:
		area.take_damage(1)
