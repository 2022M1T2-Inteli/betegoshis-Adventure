extends KinematicBody2D

signal spawn_laser(location)

onready var local_tiro = $Local_tiro

var velocidade = 450

var entrada_vetor = Vector2.ZERO

var vida = 3

func _physics_process(delta):
	entrada_vetor.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	entrada_vetor.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	global_position += entrada_vetor * velocidade * delta 
	
	if Input.is_action_just_pressed("shoot"):
		shoot_laser()
	
func tomar_dano(dano):
	vida -= dano
	if vida <= 0:
		queue_free()
		get_tree().paused = true 
		
func _on_Player_area_entered(area):
	if area.is_in_group("inimigos"):
		area.tomar_dano(1)
		
func shoot_laser():
	emit_signal("spawn_laser", local_tiro.global_position)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
