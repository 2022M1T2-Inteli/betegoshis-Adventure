extends KinematicBody2D
class_name NavePlayer
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
	move_and_slide(entrada_vetor)

func tomar_dano(dano):
	vida -= dano
	if vida <= 0:
		Global.Jogo_tiroCoin = true
		get_tree().change_scene("res://Cidade.tscn")
		get_tree().paused = true 
		Global.pontuacaoNave = 0

func _on_Player_area_entered(area):
	if area.is_in_group("inimigos"):
		area.tomar_dano(1)
		tomar_dano(1)

func shoot_laser():
	emit_signal("spawn_laser", local_tiro.global_position)


func _process(_delta):
	if vida == 2:
		get_parent().get_node("Vidas/Vida3").visible = false
	if vida == 1:
		get_parent().get_node("Vidas/Vida2").visible = false
	if vida <= 0:
		get_parent().get_node("Vidas/Vida1").visible = false
