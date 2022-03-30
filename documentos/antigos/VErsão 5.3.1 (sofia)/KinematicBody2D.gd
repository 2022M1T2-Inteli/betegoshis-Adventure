extends KinematicBody2D

# Dinheiro
var pegarBoletoFaculdade = false 

func _ready(): # Acontece quando se inicia a cena
	$Camera2D/Dinheiro/DinheiroLabel.text = "BT$  " + str(Global.money)
	
	if Global.inicio_1 == false:
		# Limita a Câmera2D ao mapa da Casa da Vó:
		$Camera2D.limit_left = 3250
		$Camera2D.limit_right = 4380
		$Camera2D.limit_top = 109
		$Camera2D.limit_bottom = 1225
		Global.inicio_1 = true
	
	if Global.Pong_Game == true:
		#Teleporta pra frente do pong
		self.position.x = -857
		self.position.y = 2355
		#Limita a camera pro arcade
		$Camera2D.limit_top = 1530
		$Camera2D.limit_bottom = 2635
		$Camera2D.limit_left = -1530
		$Camera2D.limit_right = -170
		Global.Pong_Game = false
	
	if Global.flapCoin_Game == true:
		# Teleporta pra frente do flapCoin
		
		
		#Limita a camera pro arcade
		$Camera2D.limit_top = 1530
		$Camera2D.limit_bottom = 2635
		$Camera2D.limit_left = -1530
		$Camera2D.limit_right = -170
		Global.flapCoin_Game = false
	
# Processos de movimentação e animação do personagem l3~l104
var abrirPcEnter = false
#Definições iniciais
export (int) var speed = 300 # define velocidade
const SPEED = 1 #nada muito importante 
var velocity = Vector2() # define o vetor

#função principal
func get_input():
	velocity = Vector2() # coloca o vetor na velocidade
	if Input.is_action_pressed("keyD") and Input.is_action_pressed("keyW") or irCimaDireita == true: #se apertar "D" e "W" simultaneamente
		velocity.x += SPEED #anda pra diagonal cima-direita
		velocity.y -= SPEED #                              #
		$AnimationPlayer.play("correndinho pra direita") # anima pra direita
		Global.BarraEnergia -= 0.005
		
	elif Input.is_action_pressed("keyD") and Input.is_action_pressed("keyS") or irBaixoDireita == true: #se apertar "D" e "S" simultanemamente
		velocity.x += SPEED #anda pra diagonal baixo-direita
		velocity.y += SPEED #                                #
		$AnimationPlayer.play("correndinho pra direita")
		Global.BarraEnergia -= 0.005
		
	elif Input.is_action_pressed("keyA") and Input.is_action_pressed("keyW") or irCimaEsquerda == true: #se apertar "A" e "W" simultanemamente
		velocity.x -= SPEED #anda pra diagonal cima-esquerda
		velocity.y -= SPEED #                                #
		$AnimationPlayer.play("correndinho pra esquerda")
		Global.BarraEnergia -= 0.005
		
	elif Input.is_action_pressed("keyA") and Input.is_action_pressed("keyS") or irBaixoEsquerda == true: #se apertar "A" e "S" simultanemamente
		velocity.x -= SPEED #anda pra diagonal baixo-esquerda
		velocity.y += SPEED #                                #
		$AnimationPlayer.play("correndinho pra esquerda")
		Global.BarraEnergia -= 0.005
		
	elif Input.is_action_pressed("keyD") or irDireita == true: #"se aperdar 'D'"
		velocity.x += SPEED #anda pra direita
		$AnimationPlayer.play("correndinho pra direita") #animação de correr pra direita 
		Global.BarraEnergia -= 0.005
		
	elif Input.is_action_pressed("keyA") or irEsquerda == true: #"se apertar'A'"
		velocity.x -= SPEED #anda pra esquerda
		$AnimationPlayer.play("correndinho pra esquerda") #animação de correr pra esqueda
		Global.BarraEnergia -= 0.005
		
	elif Input.is_action_pressed("keyS") or irBaixo == true: #"se apertar 'S'"
		velocity.y += SPEED #anda pra baixo
		$AnimationPlayer.play("correndinho pra baixo") #animação de correr pra baixo
		Global.BarraEnergia -= 0.005
		
	elif Input.is_action_pressed("keyW") or irCima == true: #"se apertar 'W'"
		velocity.y -= SPEED #anda pra cima
		$AnimationPlayer.play("correndinho pra cima") #animação de correr pra cima
		Global.BarraEnergia -= 0.005
		
	else: #se apertar nada
		$AnimationPlayer.play("paradinhozinho") #fica paradinhozinho
	velocity = velocity.normalized() * speed #aprimora o vetor para que ele possa andar na mesma velocidade em todas as direções
#	print(position) #saber a posiçaõ do maninho
	if Input.is_action_just_pressed("ui_accept"):
		Global.hora += 2
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
var pararMovimento = false
var deixarTudoInvisivelagain = false

func _process(_delta):
	
	$Camera2D/Dinheiro/DinheiroLabel.text = "BT$  " + str(Global.money)
	
	# Coisa pra abrir o computador
	if Input.is_action_pressed("ui_accept"):
		abrirPcEnter = true
	if abrirPcEnter == true and abrirPcArea2D == true:
		$"Tela de Carregamento 1".visible = true
	
	
	# Parar o movimento de forma mais prática
	if pararMovimento == true:
		irDireita = false
		irCima = false
		irBaixo = false
		irEsquerda = false
		irCimaDireita = false
		irCimaEsquerda = false
		irBaixoEsquerda = false
		irBaixoDireita = false
		yield(get_tree().create_timer(0.1), "timeout")
		pararMovimento = false
	
	# Deixa tudo Invisível nas linhas de teleporte guiado pelos botões do celular
	if deixarTudoInvisivelagain == true: # quando essa variavel vira verdadeira
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Taxiimg/TaxiB.modulate.a = 0 # volta a cor da imagem do taxi
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Onibusimg/OnibusB.modulate.a = 0 # volta a cor da imagem do onibus
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Bikeimg/BikeB.modulate.a = 0 # volta a cor da imagem da bike
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/FaculdadeTP.modulate.a = 0 # desaparece o botao da faculdade
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/BancoTPad.modulate.a = 0 # desaparece o botao do banco
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/CasaTPad.modulate.a = 0 # desaparece o botao da casa
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/MercadinhoTPad.modulate.a = 0 # desaparece o botao do mercadinho
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/ArcadeTPad.modulate.a = 0 # desaparece o botao do arcade
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/LojinhaTPad.modulate.a = 0 # desaparece o botao da lojinha
		
		irTaxi = false
		irOnibus = false
		irBike = false
		# Atualização dos contadores de cada função de ordenação de botões
		contadorBikeButton = 0 # 
		contadorTaxiButton = 0 # 
		contadorOnibusButton = 0 # 
		yield(get_tree().create_timer(0.1), "timeout")
		deixarTudoInvisivelagain = false
	
	# Seleção da sprite do player
	if Global.select == 1:
		$Avatar.texture = Avatar_1
	if Global.select == 2:
		$Avatar.texture = Avatar_2
	if Global.select == 3:
		$Avatar.texture = Avatar_3
		
		
	$Camera2D/Celular/AbrirCelular/CelularPanel/barras/Barra_Energia.value = Global.BarraEnergia
	$Camera2D/Celular/AbrirCelular/CelularPanel/barras/Barra_Fome.value = Global.BarraFome
	$Camera2D/Celular/AbrirCelular/CelularPanel/barras/Barra_Felicidade.value = Global.BarraFelicidade
	Global.BarraEnergia -= float(Global.MenosEnergia)
	Global.BarraFome -= float(Global.MenosFome)
	Global.BarraFelicidade -= float(Global.MenosFelicidade)
	
var Avatar_1 = preload("res://Action RPG Resources/Player/Fox sheet.png")
var Avatar_2 = preload("res://Action RPG Resources/Player/Sapinho sheet.png")
var Avatar_3 = preload("res://Action RPG Resources/Player/Leaozinho sheet.png")




# Apenas tocando nos botões da tela
func _on_Direita_mouse_entered(): #botão Direita apertado
	irDireita = true # faz andar pra direita
func _on_Direita_mouse_exited(): #botão Direita solto
	irDireita = false # para o movimento pra direita
# Botão pra baixo
func _on_Baixo_mouse_entered(): #botão Baixo apertado
	irBaixo = true #faz andar pra baixo
func _on_Baixo_mouse_exited(): #botão Baixo solto
	irBaixo = false # para o movimento pra baixo
# Botão pra cima
func _on_Cima_mouse_entered(): #botão Cima apertado
	irCima = true #faz andar pra cima
func _on_Cima_mouse_exited(): #botão Cima solto
	irCima = false # para o movimento pra cima
# Botão pra esquerda
func _on_Esquerda_mouse_entered(): #botão Esquerda apertado
	irEsquerda = true #faz andar pra esquerda
func _on_Esquerda_mouse_exited(): #botão Esquerda solto
	irEsquerda = false # para o movimento pra esquerda
# Botão pra suldoeste
func _on_BaixoEsquerda_mouse_entered(): #botão BaixoEsquerda apertado
	irBaixoEsquerda = true #anda na diagonal suldoeste
func _on_BaixoEsquerda_mouse_exited(): #botão BaixoEsquerda solto
	irBaixoEsquerda = false # para o movimento diagonal
# Botão para suldeste
func _on_BaixoDireita_mouse_entered(): #botão BaixoDireita apertado
	irBaixoDireita = true #anda na diagonal suldeste
func _on_BaixoDireita_mouse_exited(): #botão BaixoEsquerda solto
	irBaixoDireita = false # para o movimento diagonal
# Botão pra noroeste
func _on_CimaEsquerda_mouse_entered(): #botão CimaEsquerda apertado 
	irCimaEsquerda = true #anda na diagonal noroeste 
func _on_CimaEsquerda_mouse_exited(): #botão CimaEsquerda solto
	irCimaEsquerda = false # para o movimento diagonla
# Botão pra nordeste
func _on_CimaDireita_mouse_entered(): #botão CimaDireita apertado
	irCimaDireita = true #anda na diagonal nordeste
func _on_CimaDireita_mouse_exited(): #botão Cima Direita solto
	irCimaDireita = false # para o movimento diagonla
##



#AbrirCelular
func _on_Config_pressed(): #apertar o botão de celular
	$Camera2D/Celular/AbrirCelular/CelularPanel.visible = true #aparece o celular
	$Camera2D/Controles/Controlesorg.visible = false #desaparecem os controles pra evitar andar com o celular aberto
	$Camera2D/Celular/AbrirCelular/Notificacao.visible = false

func _on_CloseiPad_pressed(): #aperta o botao de fechar
	$Camera2D/Celular/AbrirCelular/CelularPanel.visible = false #desaparece o celular
	$Camera2D/Controles/Controlesorg.visible = true #voltam os controles


#Teleportes

##Teleportes por Area2D

# Entrar na lojinha
func _on_Shop_TP_body_entered(body):
	# Teleporta
	self.position.x = 3978
	self.position.y = 74
	# Limita a Camera ao mapa da lojinha
	$Camera2D.limit_right = 4300
	$Camera2D.limit_left = 3600
	$Camera2D.limit_top = -702
	$Camera2D.limit_bottom = -58
# Sair da lojinha
func _on_TP_Sair_Shop_body_entered(body):
	# Teleporta 
	self.position.x = 1870 
	self.position.y = 1443
	# Limita a Câmera2D ao mapa geral:
	$Camera2D.limit_bottom = 2450
	$Camera2D.limit_top = -1914
	$Camera2D.limit_left = -86
	$Camera2D.limit_right = 2400

# Entrar no banco
func _on_Banco_TP_body_entered(_body):
	# Teleporta
	self.position.x = 4024 
	self.position.y = 2293 
	# Limita a camera2D para o mapa do banco
	$Camera2D.limit_bottom = 2210
	$Camera2D.limit_top = 1420
	$Camera2D.limit_left = 3092
	$Camera2D.limit_right = 4445
# Sair do banco
func _on_TP_Sair_Banco_body_entered(_body):
	# Teleporta
	self.position.x = 2177 
	self.position.y = 2109 
	# Limita a Câmera2D ao mapa geral:
	$Camera2D.limit_bottom = 2450
	$Camera2D.limit_top = -1914
	$Camera2D.limit_left = -86
	$Camera2D.limit_right = 2400

# Entrar no Mercadinho
func _on_Mercadinho_TP_body_entered(_body):
	# Teleporta
	self.position.x = -277
	self.position.y = 1434 
	# Limita a Câmera2D para o mapa do mercadinho
	$Camera2D.limit_bottom = 1362
	$Camera2D.limit_top = 508
	$Camera2D.limit_left = -1423
	$Camera2D.limit_right = -260
# Sair do Mercadinho
func _on_TP_Sair_Mercadinho_body_entered(_body):
	# Teleporta
	self.position.x = 634  
	self.position.y = 1525 
	# Limita a Câmera2D ao mapa geral:
	$Camera2D.limit_bottom = 2450
	$Camera2D.limit_top = -1914
	$Camera2D.limit_left = -86
	$Camera2D.limit_right = 2400

# Entrar no Arcade
func _on_Arcade_TP_body_entered(_body):
	# Teleporta pra dentro do arcade
	self.position.x = -598
	self.position.y = 2686
	# Limita a camera para o ambiente do Arcade
	$Camera2D.limit_top = 1530
	$Camera2D.limit_bottom = 2635
	$Camera2D.limit_left = -1530
	$Camera2D.limit_right = -170
# Sair do Arcade
func _on_TP_Sair_Arcade_body_entered(_body):
	# Teleporta
	self.position.x = 509
	self.position.y = 2207
	# Limita a camera para o mapa geral
	$Camera2D.limit_bottom = 2450
	$Camera2D.limit_top = -1914
	$Camera2D.limit_left = -86
	$Camera2D.limit_right = 2400


# Entrar na faculdade
func _on_Faculdade_TP_body_entered(_body): # vai pra faculdade
	# Animação de entrar no lugar
	$Camera2D/Controles/Controlesorg.visible = false 
	speed = 30 # diminui a velocidadew
	yield(get_tree().create_timer(0.6), "timeout") 
	irCima = false # para de andar
	yield(get_tree().create_timer(0.01), "timeout") 
	
	# Limita a Câmera2D ao mapa da Faculdade:
	$Camera2D.limit_bottom = -1935
	$Camera2D.limit_top = -4330
	$Camera2D.limit_left = 0
	$Camera2D.limit_right = 2100
	# Teleporta
	self.position.x = 1329
	self.position.y = -1834 
	# Animação de entrando na faculdade 
	irCima = true # começa a andar devagarinho 
	yield(get_tree().create_timer(0.2), "timeout") 
	irCima = false # para de andar
	speed = 300 # volta à velocidade normal
	$Camera2D/Controles/Controlesorg.visible = true # reaparecem os controles
	
# Sair da Faculdade
func _on_TP_Sala_de_Aula_body_entered(_body): #sai da faculdade
	# Limita a Câmera2D ao mapa geral:
	$Camera2D.limit_bottom = 2450
	$Camera2D.limit_top = -1914
	$Camera2D.limit_left = -86
	$Camera2D.limit_right = 2400
	# Teleporta
	self.position.x = 1390
	self.position.y = -830

## Teleportes dentro do mapinha do celular
# Preços
var precoTaxi = 20
var precoOnibus = 8
var precoBike = 0


# Teleporte para a faculdade
var goToFaculdade = false
var irFaculdade = false #botao pra ir pra facul ta desativado
var contadorFaculdadeTPButton = 0 #ordena as clicadas
func _on_FaculdadeTP_pressed(): #botão para teleportar para a faculdade dentro do celular
	contadorFaculdadeTPButton += 1 #conta as vezes que é apertado
	if contadorFaculdadeTPButton % 2 == 1: #quando for ímpar
		irFaculdade = true #ir pra faculdade está ativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/FaculdadeTP.modulate.a = 12 #deixa as letras tampadas
	if contadorFaculdadeTPButton % 2 == 0: #quando for par
		irFaculdade = false #ir pra faculdade está desativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/FaculdadeTP.modulate.a = 0 #mostra as letras
	# Para ir de taxi à Faculdade
	if irFaculdade == true and irTaxi == true: #se ativar a faculdade e o taxi
		Global.money -= precoTaxi #paga
		goToFaculdade = true #valida a ida para a faculdade
	# Para ir de Ônibus à Faculdade
	if irFaculdade == true and irOnibus == true: #se ativar a faculdade e o onibus
		Global.money -= precoOnibus #paga
		goToFaculdade = true #valida a ida para a faculdade
	# Para ir de Bike à Faculdade
	if irFaculdade == true and irBike == true: #se ativa faculdade e bicicleta
		Global.money -= precoBike #paga
		goToFaculdade = true #valida a ida para a faculdade
	# Ir à Faculdade significa:
	if goToFaculdade == true:
		yield(get_tree().create_timer(0.3), "timeout") #espera 0.3 sec
		self.position.x = 1390 #teleporta pra porta da facudlade
		self.position.y = -830##
		
		# Limita a Câmera2D ao mapa geral:
		$Camera2D.limit_bottom = 2450
		$Camera2D.limit_top = -1914
		$Camera2D.limit_left = -86
		$Camera2D.limit_right = 2400
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI.visible = false #desaparece o acesso ao mapa
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/CloseMAPButton.visible = false #desaparece o botao 
		$Camera2D/Controles/Controlesorg.visible = true #aparecem os controles
		$Camera2D/Celular/AbrirCelular/CelularPanel.visible = false #desaparece o celular
		yield(get_tree().create_timer(0.01), "timeout") #espera 0.01 sec
		irFaculdade = false
		contadorFaculdadeTPButton = 0
		deixarTudoInvisivelagain = true
		goToFaculdade = false
#### Coisa Grande aqui em cima ####


# Botão para ir para casa
var goToCasa = false
var irCasa = false #botao pra ir pra facul ta desativado
var contadorCasaTPButton = 0 #ordena as clicadas
func _on_CasaTPad_pressed():
	contadorCasaTPButton += 1 #conta as vezes que é apertado
	if contadorCasaTPButton % 2 == 1: #quando for ímpar
		irCasa = true #ir pra casa está ativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/CasaTPad.modulate.a = 12 #deixa as letras tampadas
	if contadorCasaTPButton % 2 == 0: #quando for par
		irCasa = false #ir pra casa está desativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/CasaTPad.modulate.a = 0 #mostra as letras
	# Para ir de Taxi à Casa
	if irCasa == true and irTaxi == true: #se ativar a casa e o taxi
		Global.money -= precoTaxi #paga
		goToCasa = true #valida a ida para a casa
	# Para ir de Ônibus à Casa
	if irCasa == true and irOnibus == true: #se ativar a casa e o onibus
		Global.money -= precoOnibus #paga
		goToCasa = true #valida a ida para a casa
	# Para ir de Bike à Casa
	if irCasa == true and irBike == true: #se ativa casa e bicicleta
		Global.money -= precoBike #paga
		goToCasa = true #valida a ida para a casa
	# Ir à casa significa
	if goToCasa == true:
		yield(get_tree().create_timer(0.1), "timeout") #espera 0.3 sec
		self.position.x = -1882  #teleporta pra porta da facudlade
		self.position.y =  2177##
		
		# Limita a Câmera2D ao mapa da casa:
		$Camera2D.limit_bottom = 2450
		$Camera2D.limit_top = 1640
		$Camera2D.limit_left = -3600
		$Camera2D.limit_right = -1900
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI.visible = false #desaparece o acesso ao mapa
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/CloseMAPButton.visible = false #desaparece o botao 
		$Camera2D/Controles/Controlesorg.visible = true #aparecem os controles
		$Camera2D/Celular/AbrirCelular/CelularPanel.visible = false #desaparece o celular
		if Global.F1_objetivo6 == true:
			$Camera2D/Celular/AbrirCelular/Notificacao.visible = true
			Global.F1_objetivo7 = true
		yield(get_tree().create_timer(0.01), "timeout") #espera 0.01 sec
		irCasa = false
		contadorCasaTPButton = 0
		deixarTudoInvisivelagain = true 
		goToCasa = false
#### Coisa Grande aqui em cima ####

# Botão pra ir para o banco
var goToBanco = false
var irBanco = false #botao pra ir pra facul ta desativado
var contadorBancoTPButton = 0 #ordena as clicadas
func _on_BancoTPad_pressed():
	contadorBancoTPButton += 1 #conta as vezes que é apertado
	if contadorBancoTPButton % 2 == 1: #quando for ímpar
		irBanco = true #ir pra banco está ativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/BancoTPad.modulate.a = 12 #deixa as letras tampadas
	if contadorBancoTPButton % 2 == 0: #quando for par
		irBanco = false #ir pra banco está desativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/BancoTPad.modulate.a = 0 #mostra as letras
	# Ir de Taxi ao Banco
	if irBanco == true and irTaxi == true: #se ativar a banco e o taxi
		Global.money -= precoTaxi #paga
		goToBanco = true #valida a ida para a banco
	# Ir de Ônibus ao Banco
	if irBanco == true and irOnibus == true: #se ativar a banco e o onibus
		Global.money -= precoOnibus #paga
		goToBanco = true #valida a ida para a banco
	# Ir de Bike ao Banco
	if irBanco == true and irBike == true: #se ativa banco e bicicleta
		Global.money -= precoBike #paga
		goToBanco = true #valida a ida para a banco
	# Ir ao Banco significa
	if goToBanco == true:
		yield(get_tree().create_timer(0.01), "timeout")
		self.position.x = 2177 #teleporta pra porta do banco
		self.position.y = 2293 ##
		
		# Limita a Câmera2D ao mapa geral:
		$Camera2D.limit_bottom = 2450
		$Camera2D.limit_top = -1914
		$Camera2D.limit_left = -86
		$Camera2D.limit_right = 2400
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI.visible = false #desaparece o acesso ao mapa
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/CloseMAPButton.visible = false #desaparece o botao 
		$Camera2D/Controles/Controlesorg.visible = true #aparecem os controles
		$Camera2D/Celular/AbrirCelular/CelularPanel.visible = false #desaparece o celular
		yield(get_tree().create_timer(0.01), "timeout") #espera 0.01 sec
		irBanco = false
		contadorBancoTPButton = 0 
		deixarTudoInvisivelagain = true
		goToBanco = false
#### Coisa Grande aqui em cima ####

# Teleporte para a Arcade
var goToArcade = false
var irArcade = false #botao pra ir pra facul ta desativado
var contadorArcadeTPButton = 0 #ordena as clicadas
func _on_ArcadeTPad_pressed(): #botão para teleportar para a Arcade dentro do celular
	contadorArcadeTPButton += 1 #conta as vezes que é apertado
	if contadorArcadeTPButton % 2 == 1: #quando for ímpar
		irArcade = true #ir pra faculdade está ativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/ArcadeTPad.modulate.a = 12 #deixa as letras tampadas
	if contadorArcadeTPButton % 2 == 0: #quando for par
		irArcade = false #ir pra Arcade está desativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/ArcadeTPad.modulate.a = 0 #mostra as letras
	# Ir de Taxi ao Arcade
	if irArcade == true and irTaxi == true: #se ativar a Arcade e o taxi
		Global.money -= precoTaxi #paga
		goToArcade = true #valida a ida para a Arcade
	# Ir de Ônibus ao Arcade
	if irArcade == true and irOnibus == true: #se ativar a Arcade e o onibus
		Global.money -= precoOnibus #paga
		goToArcade = true #valida a ida para a Arcade
	# Ir de Bike ao Arcade
	if irArcade == true and irBike == true: #se ativa Arcade e bicicleta
		Global.money -= precoBike #paga
		goToArcade = true #valida a ida para a Arcade
	# Ir ao Arcade significa
	if goToArcade == true:
		yield(get_tree().create_timer(0.01), "timeout")
		self.position.x = 509 # teleporta pra frente do arcade 
		self.position.y = 2207 ##
		
		# Limita a Câmera2D ao mapa geral:
		$Camera2D.limit_bottom = 2450
		$Camera2D.limit_top = -1914
		$Camera2D.limit_left = -86
		$Camera2D.limit_right = 2400
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI.visible = false #desaparece o acesso ao mapa
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/CloseMAPButton.visible = false #desaparece o botao 
		$Camera2D/Controles/Controlesorg.visible = true #aparecem os controles
		$Camera2D/Celular/AbrirCelular/CelularPanel.visible = false #desaparece o celular
		yield(get_tree().create_timer(0.01), "timeout") #espera 0.01 sec
		irArcade = false
		contadorArcadeTPButton = 0
		deixarTudoInvisivelagain = true
		goToArcade = false
#### Coisa Grande aqui em cima ####


# Botão pra ir para o mercadinho
var goToMercadinho = false
var irMercadinho = false #botao pra ir pra facul ta desativado
var contadorMercadinhoTPButton = 0 #ordena as clicadas
func _on_MercadinhoTPad_pressed():
	contadorMercadinhoTPButton += 1 #conta as vezes que é apertado
	if contadorMercadinhoTPButton % 2 == 1: #quando for ímpar
		irMercadinho = true #ir pra mercadinho está ativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/MercadinhoTPad.modulate.a = 12 #deixa as letras tampadas
	if contadorMercadinhoTPButton % 2 == 0: #quando for par
		irMercadinho = false #ir pra mercadinho está desativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/MercadinhoTPad.modulate.a = 0 #mostra as letras
	# Ir de Taxi ao Mercadinho
	if irMercadinho == true and irTaxi == true: #se ativar o mercadinho e o taxi
		Global.money -= precoTaxi #paga
		goToMercadinho = true #valida a ida para a mercadinho
	# Ir de Ônibus ao Mercadinho
	if irMercadinho == true and irOnibus == true: #se ativar a mercadinho e o onibus
		Global.money -= precoOnibus #paga
		goToMercadinho = true #valida a ida para a mercadinho
	# Ir de Bike ao Mercadinho
	if irMercadinho == true and irBike == true: #se ativa mercadinho e bicicleta
		Global.money -= precoBike #paga
		goToMercadinho = true #valida a ida para a mercadinho
	# Ir ao Mercadinho significa
	if goToMercadinho == true:
		yield(get_tree().create_timer(0.01), "timeout")
		self.position.x = 634  #teleporta pra porta do mercadinho
		self.position.y = 1525 ##
		
		# Limita a Câmera2D ao mapa geral:
		$Camera2D.limit_bottom = 2450
		$Camera2D.limit_top = -1914
		$Camera2D.limit_left = -86
		$Camera2D.limit_right = 2400
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI.visible = false #desaparece o acesso ao mapa
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/CloseMAPButton.visible = false #desaparece o botao 
		$Camera2D/Controles/Controlesorg.visible = true #aparecem os controles
		$Camera2D/Celular/AbrirCelular/CelularPanel.visible = false #desaparece o celular
		yield(get_tree().create_timer(0.01), "timeout") #espera 0.01 sec
		irMercadinho = false
		contadorMercadinhoTPButton = 0
		deixarTudoInvisivelagain = true
		goToMercadinho = false
#### Coisa Grande aqui em cima ####

# Teleporte para a lojinha
var goToLojinha = false
var irLojinha = false #botao pra ir pra lojinha ta desativado
var contadorLojinhaTPButton = 0 #ordena as clicadas
func _on_LojinhaTPad_pressed(): #botão para teleportar para a Lojinhadentro do celular
	contadorLojinhaTPButton += 1 #conta as vezes que é apertado
	if contadorLojinhaTPButton % 2 == 1: #quando for ímpar
		irLojinha = true #ir pra Lojinha está ativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/LojinhaTPad.modulate.a = 12 #deixa as letras tampadas
	if contadorLojinhaTPButton % 2 == 0: #quando for par
		irLojinha = false #ir pra Lojinha está desativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/LojinhaTPad.modulate.a = 0 #mostra as letras
	# Para ir de taxi à Lojinha
	if irLojinha == true and irTaxi == true: #se ativar a Lojinha e o taxi
		Global.money -= precoTaxi #paga
		goToLojinha = true #valida a ida para a lojinha
	# Para ir de Ônibus à Lojinha
	if irLojinha == true and irOnibus == true: #se ativar a Lojinhae o onibus
		Global.money -= precoOnibus #paga
		goToLojinha = true #valida a ida para a lojinha
	# Para ir de Bike à Lojinha
	if irLojinha == true and irBike == true: #se ativa Lojinha e bicicleta
		Global.money -= precoBike #paga
		goToLojinha = true #valida a ida para a lojinha
	# Ir à Lojinha significa:
	if goToLojinha == true:
		yield(get_tree().create_timer(0.3), "timeout") #espera 0.3 sec
		self.position.x = 1390 #teleporta pra porta da facudlade
		self.position.y = -830##
		
		# Limita a Câmera2D ao mapa geral:
		$Camera2D.limit_bottom = 2450
		$Camera2D.limit_top = -1914
		$Camera2D.limit_left = -86
		$Camera2D.limit_right = 2400
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI.visible = false #desaparece o acesso ao mapa
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/CloseMAPButton.visible = false #desaparece o botao 
		$Camera2D/Controles/Controlesorg.visible = true #aparecem os controles
		$Camera2D/Celular/AbrirCelular/CelularPanel.visible = false #desaparece o celular
		yield(get_tree().create_timer(0.01), "timeout") #espera 0.01 sec
		irLojinha = false
		contadorLojinhaTPButton = 0
		deixarTudoInvisivelagain = true
		goToLojinha = false
#### Coisa Grande aqui em cima ####




### Lógicas para os botões do mapinha
#Ir de taxi
var irTaxi = false 
var contadorTaxiButton = 0
func _on_TaxiB_pressed():
	contadorTaxiButton += 1
	if contadorTaxiButton % 2 == 0:
		irTaxi = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Taxiimg/TaxiB.modulate.a = 0
	if contadorTaxiButton % 2 == 1:
		irTaxi = true
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Taxiimg/TaxiB.modulate.a = 1
# Pra ir de ônibus
var irOnibus = false
var contadorOnibusButton = 0
func _on_OnibusB_pressed():
	if Global.F1_objetivo2 == true: # Falou com o tio
		contadorOnibusButton += 1
		if contadorOnibusButton % 2 == 0:
			irOnibus = false
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Onibusimg/OnibusB.modulate.a = 0
		if contadorOnibusButton % 2 == 1:
			irOnibus = true
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Onibusimg/OnibusB.modulate.a = 1

# Pra ir de Bike
var irBike = false 
var contadorBikeButton = 0
func _on_BikeB_pressed():
	if Global.temBicicleta == false:
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Bikeimg/Cadeado.visible = true
	if Global.temBicicleta == true:
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Bikeimg/Cadeado.visible = false
		contadorBikeButton += 1
		if contadorBikeButton % 2 == 0:
			irBike = false
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Bikeimg/BikeB.modulate.a = 0
		if contadorBikeButton % 2 == 1:
			irBike = true
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Bikeimg/BikeB.modulate.a = 1
###

### Efeitos visuais
func _on_Deixarbixolento_body_entered(_body): #quando ele sobe/desce a escada
	speed = 200 #deixa lento pra dar a impressão de subir a escada
func _on_Deixarbixolento_body_exited(_body): #quando ele sai da escada
	speed = 275 #volta a ficar rápido


# Coisas para as falas dos personagens
var abrirPcArea2D = false
func _on_Abrir_pc_body_entered(_body):
	abrirPcArea2D = true
func _on_Abrir_pc_body_exited(_body):
	abrirPcArea2D = false

# Falas do Guilherme, O Banqueiro do Betejóia
# Abrir conversa com ele
func _on_Iniciar_Guilherme_Falas_body_entered(_body): # area2D no banco para falar com o baqueiro
	$Camera2D/Falas/GuilhermeFalas.visible = true # aparece o label de falas do guilherme
	$Camera2D/Controles/Controlesorg.visible = false # desaparecem os controles (pra evitar andar durante a conversa)
	$Camera2D/Celular/AbrirCelular.visible = false # desaparece o celular (a fim de evitar que liguem ele durante a conversa)
	pararMovimento = true # para o movimento do boneco pra não bugar
# Sair da conversa dele
func _on_SairCvsaGui_pressed(): # botão de "até mais"
	$Camera2D/Controles/Controlesorg.visible = true # reaparecem os controles
	$Camera2D/Celular/AbrirCelular.visible = true # reaparece o celular

# Falas da Secretária da Faculdade
# Abrir conversa com ela
func _on_Iniciar_Secretria_Falas_body_entered(_body): # area2D na escola/secretaria para falar com a secretária
	$Camera2D/Falas/SecretariaFalas.visible = true # aparece o label de falas dela 
	$Camera2D/Controles/Controlesorg.visible = false # desaparecem os controles (pra evitar andar durante a conversa)
	$Camera2D/Celular/AbrirCelular.visible = false # desaparece o celular (a fim de evitar que liguem ele durante a conversa)
	pararMovimento = true # para o movimento do boneco pra não bugar
# Sair da conversa dela
func _on_SairCvsaSecr_pressed(): # Botão de "Até mais"
	$Camera2D/Controles/Controlesorg.visible = true
	$Camera2D/Celular/AbrirCelular.visible = true
	
	Global.F1_objetivo3 = true
	$Camera2D/Celular/AbrirCelular/Notificacao.visible = true

# Coisas relacionadas ao primeiro boleto da faculdade
# Ação de pegar o boleto com a secretária 
var boleto = false 
var contadorSecrFalasButton = 0 # ordena o botão de "próximo" da secretária
func _on_SecrFalasButton_pressed(): # botão de "próximo" da secretária
	contadorSecrFalasButton += 1 # cada vez que vai apertando faz algo
	if contadorSecrFalasButton == 3: # na terceira vez em ponto, o prota recebe o boleto (dá "true" pra ele poder pagar no banco)
		$Camera2D/Controles/Controlesorg.visible = true # voltam os controles
		$Camera2D/Celular/AbrirCelular.visible = true # volta o celular
		boleto = true # com o boleto, ele pode pagar no banco
		$Camera2D/Dinheiro/Boleto.visible = true
	if contadorSecrFalasButton == 4 and Global.F1_objetivo4 == true:
		$Camera2D/Celular/AbrirCelular/Notificacao.visible = true

# Ação de Pagar o boleto com o Guilherme
func _on_PagarBoleto_pressed(): # botão de "Pagar Boleto" na conversa do Guilherme
	if boleto == true: # se ele possui o boleto (falou com a secretária)
		Global.money -= 80 # paga 80 pau
		$Camera2D/Falas/GuilhermeFalas/PagarBoleto.visible = false # desaparece esse botão
		# Muda o texto para o que ele pagou a taxa de matrícula
		$Camera2D/Falas/GuilhermeFalas/FalaGuilherme.text = "Prontinho, você pagou a taxa de matrícula. Sempre que precisar pagar algo pode falar comigo, até mais."
		$Camera2D/Dinheiro/Boleto.visible = false
		
		Global.F1_objetivo4 = true # completa o objetivo de pagar o boleto
		$Camera2D/Celular/AbrirCelular/Notificacao.visible = true # aparece uma notificação de missão completa
	else:
		pass

# Coisas relacionadas à Professora e às aulas dela

func _on_IniciarAula_pressed(): # Botão de iniciar aula entre as falas da professora
	Global.comecarAula = true
	self.position.x = 765  # teleporta para o meio da sala
	self.position.y = -2874
	$Camera2D/Falas/ProfessoraFalas/IniciarAula.visible = false
	$Camera2D/Falas/ProfessoraFalas.visible = false
	pararMovimento = true

var AcontecerUmaVez = 0
func _on_InicioAula_body_entered(_body): # Area2D que inicia as primeiras falas da professora
	if Global.dia == 1 and Global.comecarAula == false and AcontecerUmaVez == 0:
		yield(get_tree().create_timer(1.5), "timeout")
		$Camera2D/Falas/ProfessoraFalas.visible = true
		$Camera2D/Falas/ProfessoraFalas/ProfFalasButton.visible = true
		AcontecerUmaVez = 1
	if Global.dia == 2 and Global.comecarAula == false and AcontecerUmaVez == 1:
		$Camera2D/Falas/ProfessoraFalas.visible = true
		$Camera2D/Falas/ProfessoraFalas/ProfFalasButton.visible = true
		AcontecerUmaVez = 2
	if Global.dia == 3 and Global.comecarAula == false and AcontecerUmaVez == 2:
		$Camera2D/Falas/ProfessoraFalas.visible = true
		$Camera2D/Falas/ProfessoraFalas/ProfFalasButton.visible = true
		AcontecerUmaVez = 3
	

func _on_SairCvsaProf_pressed():
	$Camera2D/Controles/Controlesorg.visible = true # reaparecem os controles
	$Camera2D/Celular/AbrirCelular.visible = true # reaparece o celula


#func _on_Area2D_sora_body_entered(_body): # Area2D que está EM VOLTA da professora
#	if Global.Falar_Depois_DaAula == true:
#		$Camera2D/Falas/ProfessoraFalas.visible = true
#		$Camera2D/Falas/ProfessoraFalas/FalaProfessora.text = "Eai? Conseguiu? Me conta qual foi seu resultado aqui embaixo."
#		$Camera2D/Falas/ProfessoraFalas/Resultado_Aula1.visible = true

# Interação com o Japinha do Mercadinho
func _on_Iniciar_Japinha_Falas_body_entered(_body): # botão atrás do 
	$Camera2D/Falas/JapinhaFalas/Falaorg.visible = true
	$Camera2D/Controles/Controlesorg.visible = false
	$Camera2D/Celular/AbrirCelular.visible = false
	pararMovimento = true

func _on_SairCvsaJapa_pressed():
	$Camera2D/Controles/Controlesorg.visible = true
	$Camera2D/Celular/AbrirCelular.visible = true

var contadorBotaoComprarComida = 0
func _on_BotaoComprarComida_pressed():
	contadorBotaoComprarComida += 1
	if contadorBotaoComprarComida % 2 == 1:
		$Camera2D/Falas/JapinhaFalas/Comidinhas.visible = true
		$Camera2D/Falas/JapinhaFalas/Falaorg.visible = false

func _on_Iniciar_TioClovis_Falas_body_entered(_body):
	$Camera2D/Falas/TioClovisFalas.visible = true
	$Camera2D/Controles/Controlesorg.visible = false
	$Camera2D/Celular/AbrirCelular.visible = false
	pararMovimento = true

func _on_iniciar_falavo_body_entered(_body):
	$Camera2D/Falas/VoFalas.visible = true
	$Camera2D/Controles/Controlesorg.visible = false
	$Camera2D/Celular/AbrirCelular.visible = false
	pararMovimento = true

func _on_tchau_vo_pressed():
	$Camera2D/Falas/VoFalas.visible = false
	$Camera2D/Celular/AbrirCelular.visible = true
	$Camera2D/Controles/Controlesorg.visible = true
	
	Global.F1_objetivo1 = true
	$Camera2D/Celular/AbrirCelular/Notificacao.visible = true

func _on_sairFala_pressed():
	$Camera2D/Falas/TioClovisFalas.visible = false
	$Camera2D/Celular/AbrirCelular.visible = true
	$Camera2D/Controles/Controlesorg.visible = true
	
	Global.F1_objetivo2 = true
	$Camera2D/Celular/AbrirCelular/Notificacao.visible = true

func _on_ComprarComida1_pressed():
	Global.money -= 5
	Global.BarraFome += 25
	Global.BarraFelicidade += 3
	Global.BarraEnergia += 2

func _on_ComprarComida2_pressed():
	Global.money -= 9
	Global.BarraFome += 50
	Global.BarraFelicidade += 3
	Global.BarraEnergia += 2

func _on_ComprarComida3_pressed():
	Global.money -= 13
	Global.BarraFome += 75
	Global.BarraFelicidade += 3
	Global.BarraEnergia += 2
##


func _on_Iniciar_Pong_body_entered(_body):
	$Camera2D/Dinheiro/Popups/IniciarPongImg.visible = true
	Global.BarraFelicidade += 10
	
func _on_Iniciar_Pong_body_exited(_body):
	$Camera2D/Dinheiro/Popups/IniciarPongImg.visible = false

func _on_IniciarPongButton_pressed():
	get_tree().change_scene("res://Pong/NovoLevelPong.tscn")


func _on_Iniciar_FlapMoney_body_entered(_body):
	$Camera2D/Dinheiro/Popups/IniciarFlapImg.visible = true
	Global.BarraFelicidade += 10
	
func _on_Iniciar_FlapMoney_body_exited(_body):
	$Camera2D/Dinheiro/Popups/IniciarFlapImg.visible = false

func _on_IniciarFlapMoneyButton_pressed():
	get_tree().change_scene("res://FlapCoin/FlapCoinWorld.tscn")

var Contador_NinYang_Area2D = 0
func _on_Iniciar_yang_Falas_body_entered(body):
	$Camera2D/Controles/Controlesorg.visile = false
	$Camera2D/Celular/AbrirCelular.visible = false
	pararMovimento = true
	Contador_NinYang_Area2D += 1
	if Contador_NinYang_Area2D == 1:
		$Camera2D/Falas/Nin_YangFalas.visible = true
		pararMovimento = true
		$Camera2D/Controles/Controlesorg.visible = false
		$Camera2D/Celular/AbrirCelular.visible = false
	if Contador_NinYang_Area2D >= 2:
		$Camera2D/Falas/Nin_YangFalas.visible = true
		$Camera2D/Falas/Nin_YangFalas/Falas_Do_NinYang.text = "Olá " + str(Global.player_name) + ", você deseja comprar alguma coisa hoje?"
		$Camera2D/Falas/Nin_YangFalas/ComprarButton_NinYang2.visible = true
		$Camera2D/Falas/Nin_YangFalas/SairCvrs_NinYang.visible = true
		$Camera2D/Falas/Nin_YangFalas/Sair_NinYang.visible = false
		pararMovimento = true
		$Camera2D/Controles/Controlesorg.visible = false
		$Camera2D/Celular/AbrirCelular.visible = false

func _on_Comprar_Bicicleta_pressed():
	$Camera2D/Falas/Nin_YangFalas/Comprar_Bicicleta.visible = false
	$Camera2D/Falas/Nin_YangFalas/Comprar_avatares.visible = false
	Global.money -= 500
	$Camera2D/Dinheiro/DinheiroLabel.text = "BT$" + str(Global.money)
	$Camera2D/Falas/Nin_YangFalas/Falas_Do_NinYang.text = "Prontinho, você desbloqueou a bicicleta, pode checar seu mapa, você já poderá utilizá-la para ir aos lugares."
	$Camera2D/Falas/Nin_YangFalas/Sair_NinYang.visible = true
	Global.temBicicleta = true
	Global.BarraFelicidade += 15


	


