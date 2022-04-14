extends KinematicBody2D

var aceleracao = 500
var bola

func _ready():
	bola = get_parent().find_node("Bola")

func _process(delta):
	move_and_slide(Vector2(0,get_BarraD_direction()) * aceleracao)

func get_BarraD_direction():
	if abs(bola.position.y - position.y) > 50:
		if bola.position.y > position.y: 
			return 1
		else:
			 return -1
	else:
		 return 0
