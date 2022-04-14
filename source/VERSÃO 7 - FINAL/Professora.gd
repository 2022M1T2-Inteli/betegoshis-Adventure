extends KinematicBody2D

func _ready():
	$AnimationPlayer.play("ProfessoraParada")
	
#Definições iniciais
export (int) var speed = 100 #define velocidade
const SPEED = 1 #nada muito importante
var velocity = Vector2() #define o vetor

#função principal
func get_input():
	velocity = Vector2() #coloca o vetor na velocidade
	if Input.is_action_pressed("ui_right") or ProfIrDireita == true: #"se aperdar 'D'"
		velocity.x += SPEED #anda pra direita
		$AnimationPlayer.play("professoraAndaDireita") #animação de correr pra direita 
	elif Input.is_action_pressed("ui_left") or ProfIrEsquerda == true: #"se apertar'A'"
		velocity.x -= SPEED #anda pra esquerda
		$AnimationPlayer.play("professoraAndaEsquerda") #animação de correr pra esqueda
	elif Input.is_action_pressed("ui_down") or ProfIrBaixo == true: #"se apertar 'S'"
		velocity.y += SPEED #anda pra baixo
		$AnimationPlayer.play("professoraAndaBaixo") #animação de correr pra baixo
	elif Input.is_action_pressed("ui_up") or ProfIrCima == true: #"se apertar 'W'"
		velocity.y -= SPEED #anda pra cima
		$AnimationPlayer.play("professoraAndaCima") #animação de correr pra cima
	else: #se apertar nada
		$AnimationPlayer.play("ProfessoraParada") #fica paradinhozinho
	velocity = velocity.normalized() * speed #aprimora o vetor para que ele possa andar na mesma velocidade em todas as direções
#	print(position) #saber a posiçaõ do maninho

#processos físicos
func _physics_process(_delta): #define os processos físicos do game
	get_input() 
	velocity = move_and_slide(velocity) #comando principal para interagir com o jogo
	


#Definição de algumas variáveis
var ProfIrDireita = false
var ProfIrEsquerda = false
var ProfIrCima = false
var ProfIrBaixo = false

var contadorProfessoraAndamento = 0
func _on_InicioAula_body_entered(_body):
	contadorProfessoraAndamento += 1
	if contadorProfessoraAndamento == 1:
		yield(get_tree().create_timer(0.8), "timeout")
		ProfIrDireita = true
		yield(get_tree().create_timer(0.6), "timeout") 
		ProfIrDireita = false
		ProfIrCima = true
		yield(get_tree().create_timer(0.1), "timeout")
		ProfIrCima = false
		$AnimationPlayer.play("professoraParadaBaixo")
