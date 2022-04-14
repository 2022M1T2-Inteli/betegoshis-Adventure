extends Area2D
class_name TaxiPlayer 

var velocidade = 300

var vetor_entrada = Vector2.ZERO 

var vida = 3

func _physics_process(delta):
	vetor_entrada.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	vetor_entrada.normalized()
	
	global_position += vetor_entrada * velocidade * delta 
	
func tomar_dano(dano):
	vida -= dano
	if vida <= 0:
		get_tree().change_scene("res://Cidade.tscn")
		get_tree().paused = true 
		
	
func _on_Player_area_entered(area):
	if area.is_in_group("obstaculos"):
		area.tomar_dano(1)
		

func _process(_delta):
	if vida == 2:
		get_parent().get_parent().get_node("Vidas/Vida3").visible = false
	if vida == 1:
		get_parent().get_parent().get_node("Vidas/Vida2").visible = false
	if vida <= 0:
		get_parent().get_parent().get_node("Vidas/Vida1").visible = false
