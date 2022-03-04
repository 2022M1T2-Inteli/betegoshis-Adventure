extends KinematicBody2D

func _ready(): #iniciar a cena já ativa os comandos abaixo
	$"Tela de Carregamento 1/AnimationPlayer".play("tela de carregamento") #anima a a tela de carregamento
	yield(get_tree().create_timer(2.6), "timeout") #espera 2.6 segundos
	$"Tela de Carregamento 1".visible = false #desaparece ela
	self.position.x = -2627 #teleporta pro quarto
	self.position.y =  2258 ##

# Processos de movimentação e animação do personagem l3~l104

#Definições iniciais
export (int) var speed = 300 #define velocidade
const SPEED = 1 #nada muito importante
var velocity = Vector2() #define o vetor

#função principal
func get_input():
	velocity = Vector2() #coloca o vetor na velocidade
	if Input.is_action_pressed("keyD") and Input.is_action_pressed("keyW") or irCimaDireita == true: #se apertar "D" e "W" simultaneamente
		velocity.x += SPEED #anda pra diagonal cima-direita
		velocity.y -= SPEED #                              #
		$AnimationPlayer.play("correndinho pra direita") # anima pra direita
	elif Input.is_action_pressed("keyD") and Input.is_action_pressed("keyS") or irBaixoDireita == true: #se apertar "D" e "S" simultanemamente
		velocity.x += SPEED #anda pra diagonal baixo-direita
		velocity.y += SPEED #                                #
		$AnimationPlayer.play("correndinho pra direita")
	elif Input.is_action_pressed("keyA") and Input.is_action_pressed("keyW") or irCimaEsquerda == true: #se apertar "A" e "W" simultanemamente
		velocity.x -= SPEED #anda pra diagonal cima-esquerda
		velocity.y -= SPEED #                                #
		$AnimationPlayer.play("correndinho pra esquerda")
	elif Input.is_action_pressed("keyA") and Input.is_action_pressed("keyS") or irBaixoEsquerda == true: #se apertar "A" e "S" simultanemamente
		velocity.x -= SPEED #anda pra diagonal baixo-esquerda
		velocity.y += SPEED #                                #
		$AnimationPlayer.play("correndinho pra esquerda")
	elif Input.is_action_pressed("keyD") or irDireita == true: #"se aperdar 'D'"
		velocity.x += SPEED #anda pra direita
		velocity.y == 0
		$AnimationPlayer.play("correndinho pra direita") #animação de correr pra direita 
	elif Input.is_action_pressed("keyA") or irEsquerda == true: #"se apertar'A'"
		velocity.x -= SPEED #anda pra esquerda
		velocity.y == 0
		$AnimationPlayer.play("correndinho pra esquerda") #animação de correr pra esqueda
	elif Input.is_action_pressed("keyS") or irBaixo == true: #"se apertar 'S'"
		velocity.x == 0
		velocity.y += SPEED #anda pra baixo
		$AnimationPlayer.play("correndinho pra baixo") #animação de correr pra baixo
	elif Input.is_action_pressed("keyW") or irCima == true: #"se apertar 'W'"
		velocity.y -= SPEED #anda pra cima
		velocity.x == 0
		$AnimationPlayer.play("correndinho pra cima") #animação de correr pra cima
	else: #se apertar nada
		$AnimationPlayer.play("paradinhozinho") #fica paradinhozinho
	velocity = velocity.normalized() * speed #aprimora o vetor para que ele possa andar na mesma velocidade em todas as direções
#	print(position) #saber a posiçaõ do maninho

#processos físicos
func _physics_process(_delta): #define os processos físicos do game
	get_input() 
	velocity = move_and_slide(velocity) #comando principal para interagir com o jogo

#movimentação com os botões da tela
# Lógica para os botões 
var irDireita = false
var irCima = false
var irBaixo = false
var irEsquerda = false
var irCimaDireita = false
var irCimaEsquerda = false
var irBaixoEsquerda = false
var irBaixoDireita = false
#Apenas tocando nos botões
func _on_Direita_mouse_entered(): #botão Direita apertado
	irDireita = true # faz andar pra direita
	$Camera2D/Controles/Direita.modulate.a = 12
func _on_Direita_mouse_exited(): #botão Direita solto
	irDireita = false # para o movimento pra direita
	$Camera2D/Controles/Direita.modulate.a = 0.75
#Botão pra baixo
func _on_Baixo_mouse_entered(): #botão Baixo apertado
	irBaixo = true #faz andar pra baixo
	$Camera2D/Controles/Baixo.modulate.a = 12
func _on_Baixo_mouse_exited(): #botão Baixo solto
	irBaixo = false # para o movimento pra baixo
	$Camera2D/Controles/Baixo.modulate.a = 0.75
#Botão pra cima
func _on_Cima_mouse_entered(): #botão Cima apertado
	irCima = true #faz andar pra cima
	$Camera2D/Controles/Cima.modulate.a = 12
func _on_Cima_mouse_exited(): #botão Cima solto
	irCima = false # para o movimento pra cima
	$Camera2D/Controles/Cima.modulate.a = 0.75
#Botão pra esquerda
func _on_Esquerda_mouse_entered(): #botão Esquerda apertado
	irEsquerda = true #faz andar pra esquerda
	$Camera2D/Controles/Esquerda.modulate.a = 12
func _on_Esquerda_mouse_exited(): #botão Esquerda solto
	irEsquerda = false # para o movimento pra esquerda
	$Camera2D/Controles/Esquerda.modulate.a = 0.75
#Botão pra suldoeste
func _on_BaixoEsquerda_mouse_entered(): #botão BaixoEsquerda apertado
	irBaixoEsquerda = true #anda na diagonal suldoeste
	$Camera2D/Controles/BaixoEsquerda.modulate.a = 12
func _on_BaixoEsquerda_mouse_exited(): #botão BaixoEsquerda solto
	irBaixoEsquerda = false # para o movimento diagonal
	$Camera2D/Controles/BaixoEsquerda.modulate.a = 0.75
#Botão para suldeste
func _on_BaixoDireita_mouse_entered(): #botão BaixoDireita apertado
	irBaixoDireita = true #anda na diagonal suldeste
	$Camera2D/Controles/BaixoDireita.modulate.a = 12
func _on_BaixoDireita_mouse_exited(): #botão BaixoEsquerda solto
	irBaixoDireita = false # para o movimento diagonal
	$Camera2D/Controles/BaixoDireita.modulate.a = 0.75
#Botão pra noroeste
func _on_CimaEsquerda_mouse_entered(): #botão CimaEsquerda apertado 
	irCimaEsquerda = true #anda na diagonal noroeste 
	$Camera2D/Controles/CimaEsquerda.modulate.a = 12
func _on_CimaEsquerda_mouse_exited(): #botão CimaEsquerda solto
	irCimaEsquerda = false # para o movimento diagonla
	$Camera2D/Controles/CimaEsquerda.modulate.a = 0.75
#Botão pra nordeste
func _on_CimaDireita_mouse_entered(): #botão CimaDireita apertado
	irCimaDireita = true #anda na diagonal nordeste
	$Camera2D/Controles/CimaDireita.modulate.a = 12
func _on_CimaDireita_mouse_exited(): #botão Cima Direita solto
	irCimaDireita = false # para o movimento diagonla
	$Camera2D/Controles/CimaDireita.modulate.a = 0.75

#AbrirCelular
func _on_Config_pressed(): #apertar o botão de celular
	$Camera2D/Config/iPad.visible = true #aparece o IPAD
	$Camera2D/Controles.visible = false #desaparecem os controles pra evitar andar com o ipad aberto
func _on_CloseiPad_pressed(): #aperta o botao de fechar
	$Camera2D/Config/iPad.visible = false #desaparece o ipad
	$Camera2D/Controles.visible = true #voltam os controles


#Teleportes
func _on_Cassino_TP_body_entered(_body): #teleporta PARA o cassino
#	get_tree().change_scene("res://Cassino.tscn")
	self.position.x = 4638
	self.position.y = 676

func _on_Cassino_TP2_body_entered(_body): #sai DO cassino
	self.position.x = 2390
	self.position.y = 2965


func _on_TP_Sala_de_Aula_body_entered(_body): #sai da sala de aula
	self.position.x = 1390
	self.position.y = -830

func _on_Faculdade_TP_body_entered(_body): # vai pra faculdade
	self.position.x = -5403 
	self.position.y = 2411

func _on_Professorabotao_pressed():
	self.position.x = -6029 
	self.position.y = 1580


func _on_SairdeCasa_TP_body_entered(body): #area2D pro teleporte
	$Camera2D.visible = false 
	irCimaDireita = false
	irDireita = false
	self.position.x = -2618
	self.position.y = -977


func _on_TP_FACULDADE_pressed():
	$Camera2D.visible = true
	self.position.x = 1390
	self.position.y = -830
