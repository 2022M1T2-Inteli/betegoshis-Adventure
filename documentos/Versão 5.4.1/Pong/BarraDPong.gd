extends KinematicBody2D

var aceleracao = 800
var bola

func _ready():
	bola = get_parent().find_node("Bola")

func _physics_process(delta):
	move_and_slide(Vector2(0,get_BarraD_direction()) * aceleracao)

func get_BarraD_direction():
	if abs(bola.position.y - position.y) > 50:
		if bola.position.y > position.y: 
			return 1
		else:
			 return -1
	else:
		 return 0


