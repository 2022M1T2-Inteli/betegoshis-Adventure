extends KinematicBody2D

export (int) var speed = 300 #define velocidade
const SPEED = 1 #nada muito importante
var velocity = Vector2() #define o vetor

func get_input():
	velocity = Vector2() #coloca o vetor na velocidade
	if Input.is_action_pressed("keyD") or irDireita == true: #"se aperdar 'D'"
		velocity.x += SPEED #anda pra direita
		$AnimationPlayer.play("correndinho pra direita") #animação de correr pra direita 
	elif Input.is_action_pressed("keyA") or irEsquerda == true: #"se apertar'A'"
		velocity.x -= SPEED #anda pra esquerda
		$AnimationPlayer.play("correndinho pra esquerda") #animação de correr pra esqueda
	elif Input.is_action_pressed("keyS") or irBaixo == true: #"se apertar 'S'"
		velocity.y += SPEED #anda pra baixo
		$AnimationPlayer.play("correndinho pra baixo") #animação de correr pra baixo
	elif Input.is_action_pressed("keyW") or irCima == true: #"se apertar 'W'"
		velocity.y -= SPEED #anda pra cima
		$AnimationPlayer.play("correndinho pra cima") #animação de correr pra cima
	else: #se apertar nada
		$AnimationPlayer.play("paradinhozinho") #fica paradinhozinho
	velocity = velocity.normalized() * speed #aprimora o vetor para que ele possa andar na mesma velocidade em todas as direções
#	print(position) #saber a posiçaõ do maninho



func _physics_process(_delta): #define os processos físicos do game
	get_input() 
	velocity = move_and_slide(velocity) #comando principal para interagir com o jogo
	

func _on_Cassino_TP_body_entered(_body): #teleporta PARA o cassino
	#animação 
	self.position.x = 4638
	self.position.y = 676


func _on_Cassino_TP2_body_entered(_body): #sai DO cassino
	self.position.x = 2390
	self.position.y = 2965


func _on_TP_Sala_de_Aula_body_entered(_body): #sai da sala de aula
	self.position.x = 1376
	self.position.y = -111



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
