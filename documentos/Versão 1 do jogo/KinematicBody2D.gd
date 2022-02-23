extends KinematicBody2D

func _ready(): #saber coisa
	print(position.x)
	print(position.y)

export (int) var speed = 300 #define velocidade
const SPEED = 1 #nada muito importante
var velocity = Vector2() #define o vetor

func get_input():
	velocity = Vector2() #coloca o vetor na velocidade
	if Input.is_action_pressed("keyD"): #"se aperdar 'D'"
		velocity.x += SPEED #anda pra direita
		$AnimationPlayer.play("correndinho pra direita") #animação de correr pra direita 
	elif Input.is_action_pressed("keyA"): #"se apertar'A'"
		velocity.x -= SPEED #anda pra esquerda
		$AnimationPlayer.play("correndinho pra esquerda") #animação de correr pra esqueda
	elif Input.is_action_pressed("keyS"): #"se apertar 'S'"
		velocity.y += SPEED #anda pra baixo
		$AnimationPlayer.play("correndinho pra baixo") #animação de correr pra baixo
	elif Input.is_action_pressed("keyW"): #"se apertar 'W'"
		velocity.y -= SPEED #anda pra cima
		$AnimationPlayer.play("correndinho pra cima") #animação de correr pra cima
	else: #se apertar nada
		$AnimationPlayer.play("paradinhozinho") #fica paradinhozinho
	velocity = velocity.normalized() * speed #aprimora o vetor para que ele possa andar na mesma velocidade em todas as direções
	print(position) #saber a posiçaõ do maninho


func _physics_process(_delta): #define os processos físicos do game
	get_input() 
	velocity = move_and_slide(velocity) #comando principal para interagir com o jogo
	
func _on_Cassino_TP_body_entered(body): #teleporta PARA o cassino
	#animação 
	self.position.x = 4638
	self.position.y = 676


func _on_Cassino_TP2_body_entered(body): #sai DO cassino
	self.position.x = 2390
	self.position.y = 2965


func _on_TP_Sala_de_Aula_body_entered(body): #sai da sala de aula
	self.position.x = 1376
	self.position.y = -111



func _on_Faculdade_TP_body_entered(body): # vai pra faculdade
	self.position.x = (-1348)
	self.position.y = 519




func _on_Direita_pressed():
	velocity = Vector2() #coloca o vetor na velocidade
	velocity.x += SPEED
	$AnimationPlayer.play("correndinho pra direita")
	velocity = velocity.normalized() * speed #aprimora o vetor para que ele possa andar na mesma velocidade em todas as direções


func _on_Baixo_pressed():
	velocity = Vector2() #coloca o vetor na velocidade
	velocity.y += SPEED
	$AnimationPlayer.play("correndinho pra baixo")
	velocity = velocity.normalized() * speed #aprimora o vetor para que ele possa andar na mesma velocidade em todas as direções



func _on_Cima_pressed():
	velocity = Vector2() #coloca o vetor na velocidade
	velocity.y -= SPEED
	$AnimationPlayer.play("correndinho pra cima")
	velocity = velocity.normalized() * speed #aprimora o vetor para que ele possa andar na mesma velocidade em todas as direções

func _on_Esquerda_toggled(button_pressed):
	velocity = Vector2() #coloca o vetor na velocidade
	velocity.x -= SPEED #anda pra esquerda
	$AnimationPlayer.play("correndinho pra esquerda") #animação de correr pra esqueda
	velocity = velocity.normalized() * speed #aprimora o vetor para que ele possa andar na mesma velocidade em todas as direções
