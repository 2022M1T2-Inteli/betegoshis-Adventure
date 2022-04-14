extends KinematicBody2D


var aceleracao = 400
var velocidade = Vector2.ZERO

func _ready(): # fazer bola iniciar em posição aleatória
	randomize()
	velocidade.x = [-1,1][randi() % 2]
	velocidade.y = [-0.8,0.8][randi() % 2]

func _physics_process(delta): # faz com que a bola bata em algum lugar e seja rebatida
	var obj_de_coli = move_and_collide(velocidade * aceleracao * delta)
	if obj_de_coli:
		velocidade = velocidade.bounce(obj_de_coli.normal)
