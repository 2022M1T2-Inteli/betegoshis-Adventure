extends KinematicBody2D

var aceleracao = 450

func _physics_process(delta):#faz barra subir e descer
	var velocidade = Vector2.ZERO
	if Input.is_action_pressed("ui_up") or irCimaPong == true:#se apertar para cima a posicao y muda sempre -1
		velocidade.y -= 1 # vai pra cima
	if Input.is_action_pressed("ui_down") or irBaixoPong == true:#se apertar para cima a posicao y muda sempre +1
		velocidade.y += 1 # vai pra baixo
	move_and_slide(velocidade * aceleracao)
	

var irCimaPong = false
var irBaixoPong = false

func _on_Cima_button_down(): # Apertar o botão pra ir pra cima
	irCimaPong = true # permite ir pra cima
func _on_Cima_button_up(): # Parar de apertar o botao de ir pra cima
	irCimaPong = false # retira a permissão

func _on_Baixo_button_down(): # APertar o botão pra ir pra baixo
	irBaixoPong = true # permite ir pra baixo
func _on_Baixo_button_up(): # parar de apertar o botao
	irBaixoPong = false # retira a permissão
