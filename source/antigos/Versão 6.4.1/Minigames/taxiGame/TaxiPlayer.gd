extends Area2D
class_name TaxiPlayer 

var aceleracao = 300

var vida = 3

func _physics_process(delta):
	var velocidade = Vector2.ZERO
	if Input.is_action_pressed("move_right") or irDireita == true:
		velocidade.x += 1
	if Input.is_action_pressed("move_left") or irEsquerda == true:
		velocidade.x -= 1
	
	global_position += velocidade * aceleracao * delta 

func tomar_dano(dano):
	vida -= dano
	if vida <= 0:
		get_tree().change_scene("res://Cidade.tscn")
		Global.Jogo_taxi = true
		
		Global.dinheiro -= 10
		Global.Gastos_arcade.append (-10)
	
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

var irDireita = false
var irEsquerda = false
func _on_irDireita_button_down():
	irDireita = true
func _on_irDireita_button_up():
	irDireita = false

func _on_irEsquerda_button_down():
	irEsquerda = true
func _on_irEsquerda_button_up():
	irEsquerda = false
