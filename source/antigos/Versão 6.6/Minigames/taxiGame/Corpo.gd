extends KinematicBody2D

var velocidade = Vector2()

func _physics_process(_delta):
	move_and_slide(velocidade)
