extends Node2D

signal pontuacao

const SPEED = 215

func _physics_process(delta):
	position.x += -SPEED * delta 
	if global_position.x <= -200:
		queue_free()

func _on_Wall_body_entered(body):
	if body is FlapPlayer:
		if body.has_method("morrer"):
			body.morrer()
	


func _on_AreaPontuacao_body_exited(body):
	Global.pontuacaoFlapCoin += 1
