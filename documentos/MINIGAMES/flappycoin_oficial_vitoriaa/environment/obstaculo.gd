extends Node2D

signal score

const velocidade = 215

func _physics_process(delta):
	position.x += -velocidade * delta 
	if global_position.x <= -200:
		queue_free()

func _on_Wall_body_entered(body):
	if body is Player:
		if body.has_method("die"):
			body.die()
	
func _on_ScoreArea_body_exited(body):
	if body is Player:
		emit_signal("score")
