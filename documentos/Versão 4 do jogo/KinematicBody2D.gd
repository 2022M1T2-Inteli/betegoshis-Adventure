extends KinematicBody2D

var  velocidade = Vector2.ZERO #velocidade se torna um vetor
const RAPIDEZ = 100 #constante de rapidez
const VELOCIDADE_MAX = 200 #constante para a velocidade maxima atingida
const ACELERACAO = 500 #aceleração até a velocidade máxima
const ATRITO = 40 #para o boneco devagar
func _physics_process(_delta): #função de física
	
	var resultante = Vector2.ZERO #cria a resultante da decomposição de vetores
	resultante.x = Input.get_action_strength("keyD") - Input.get_action_strength("keyA") #decompõe o vetor nas abscissas
	resultante.y = Input.get_action_strength("keyS") - Input.get_action_strength("keyW") #decompõe o vetor nas ordenadas
	resultante = resultante.normalized() # ajuda a calcular o vetor resultante
	
	if resultante != Vector2.ZERO: #se aperta algum botão (vetores das abscissas e ordenadas são diferentes de nulos
		velocidade = velocidade.move_toward(resultante * VELOCIDADE_MAX, ACELERACAO) #aumenta o módulo do vetor na direção decomposta
	else:#se parar de apertar
		velocidade = velocidade.move_toward(Vector2.ZERO, ATRITO) #diminui o módulo dos vetores 
		
	move_and_slide (resultante) #aplica a classe de movimento no vetor principal (resultante)
	move_and_slide (velocidade) #aplica a classe de movimento no vetor velocidade
	if Input.is_action_pressed("keyD"): #se apertar "D"
		$AnimationPlayer.play("correndinho pra direita") #anima pra correr pra direita
	elif Input.is_action_pressed("keyA"): #se apertar "A"
		$AnimationPlayer.play("correndinho pra esquerda") #anima pra correr pra esquerda
	elif Input.is_action_pressed("keyW"): #se apertar "W"
		$AnimationPlayer.play("correndinho pra cima") #anima pra correr pra cima
	elif Input.is_action_pressed("keyS"): #se apertar "S"
		$AnimationPlayer.play("correndinho pra baixo") #anima pra correr pra baixo
	else: #se apertar nada
		$AnimationPlayer.play("paradinhozinho") #anima o parado

func _on_Cassino_TP_body_entered(_body): #teleporta PARA o cassino
	get_tree().change_scene("res://Cassino.tscn")
#	self.position.x = 4638
#	self.position.y = 676


func _on_Cassino_TP2_body_entered(_body): #sai DO cassino
	self.position.x = 2390
	self.position.y = 2965


func _on_TP_Sala_de_Aula_body_entered(_body): #sai da sala de aula
	self.position.x = 1390
	self.position.y = -830



func _on_Faculdade_TP_body_entered(_body): # vai pra faculdade
	self.position.x = (-1348)
	self.position.y = 519
	


var irDireita = false
var irCima = false
var irBaixo = false
var irEsquerda = false

func _on_Direita_button_up():
	irDireita = false

func _on_Direita_button_down():
	irDireita = true

func _on_Baixo_button_down():
	irBaixo = true

func _on_Baixo_button_up():
	irBaixo = false

func _on_Cima_button_down():
	irCima = true

func _on_Cima_button_up():
	irCima = false

func _on_Esquerda_button_down():
	irEsquerda = true

func _on_Esquerda_button_up():
	irEsquerda = false

var contadorBotaoConfig = 0

func _on_Config_pressed():
	contadorBotaoConfig += 1
	if contadorBotaoConfig%2 == 1:
		$Camera2D/Config/Sprite.visible = true
	if contadorBotaoConfig%2 == 0:
		$Camera2D/Config/Sprite.visible = false
