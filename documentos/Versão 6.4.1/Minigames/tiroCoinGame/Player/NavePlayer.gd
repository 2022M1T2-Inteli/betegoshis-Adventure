extends KinematicBody2D
class_name NavePlayer
signal spawn_laser(location)

onready var local_tiro = $Local_tiro

var aceleracao = 1

var velocidade = Vector2.ZERO

var vida = 3

func _physics_process(delta):
	if Input.is_action_pressed("move_up") or irNorte == true:
		velocidade.y -= 1
	if Input.is_action_pressed("move_right") or irLeste == true:
		velocidade.x += 1
	if Input.is_action_pressed("move_down") or irSul == true:
		velocidade.y += 1
	if Input.is_action_pressed("move_left") or irOeste == true:
		velocidade.x -= 1
	if irNordeste == true:
		velocidade.x += 1
		velocidade.y -= 1
	if irNoroeste == true:
		velocidade.x -= 1
		velocidade.y -= 1
	if irSuldeste == true:
		velocidade.x += 1
		velocidade.y += 1
	if irSuldoeste == true:
		velocidade.x -= 1
		velocidade.y += 1
	
	global_position += velocidade * aceleracao  * delta
#	move_and_slide(velocidade * aceleracao)
	
	if Input.is_action_just_pressed("shoot"):
		shoot_laser()

func tomar_dano(dano):
	vida -= dano
	if vida <= 0:
		Global.Jogo_tiroCoin = true
		get_tree().change_scene("res://Cidade.tscn")
		Global.pontuacaoNave = 0
		
		Global.dinheiro -= 10
		Global.Gastos_arcade.append(-10)

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

var irNorte = false
var irLeste = false
var irSul = false
var irOeste = false
var irNordeste = false
var irSuldeste = false
var irSuldoeste = false
var irNoroeste = false

func _on_Esquerda_button_down():
	irOeste = true
func _on_Esquerda_button_up():
	irOeste = false

func _on_Direita_button_down():
	irLeste = true
func _on_Direita_button_up():
	irLeste = false

func _on_Baixo_button_down():
	irSul = true
func _on_Baixo_button_up():
	irSul = false

func _on_Cima_button_down():
	irNorte = true
func _on_Cima_button_up():
	irNorte = false

func _on_BaixoEsquerda_button_down():
	irSuldoeste = true
func _on_BaixoEsquerda_button_up():
	irSuldoeste = false

func _on_BaixoDireita_button_down():
	irSuldeste = true
func _on_BaixoDireita_button_up():
	irSuldeste = false

func _on_CimaDireita_button_down():
	irNordeste = true
func _on_CimaDireita_button_up():
	irNordeste = false

func _on_CimaEsquerda_button_down():
	irNoroeste = true
func _on_CimaEsquerda_button_up():
	irNoroeste = false
