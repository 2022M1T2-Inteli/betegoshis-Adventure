extends KinematicBody2D

var aceleracao = 450

func _physics_process(delta):#faz barra subir e descer
	var velocidade = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):#se apertar para cima a posicao y muda sempre -1
		velocidade.y -= 1
	if Input.is_action_pressed("ui_down"):#se apertar para cima a posicao y muda sempre +1
		velocidade.y += 1
	move_and_slide(velocidade * aceleracao)
	
	
