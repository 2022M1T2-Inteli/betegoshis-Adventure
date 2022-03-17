extends KinematicBody2D

# Dinheiro
var money = Global.money
var pegarBoletoFaculdade = false
func _on_PagarFaculdade_pressed():
	if pegarBoletoFaculdade == true:
		money -= 300.49
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$" + str(money)


func _ready(): #iniciar a cena já ativa os comandos abaixo
	
	$Camera2D/Dinheiro/DinheiroLabel.text = "R$" + str(money) #mostra o dinheiro inicial dele
	

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
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Taxiimg.modulate.a = 1 # volta a cor da imagem do taxi
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Onibusimg.modulate.a = 1 # volta a cor da imagem do onibus
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Bikeimg.modulate.a = 1 # volta a cor da imagem da bike
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/FaculdadeTP.modulate.a = 0 # desaparece o botao da faculdade
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/BancoTPad.modulate.a = 0 # desaparece o botao do banco
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/CasaTPad.modulate.a = 0 # desaparece o botao da casa
		# Atualização dos contadores de cada função de ordenação de botões
		contadorFaculdadeTPButton += 1 #
		contadorBancoTPButton += 1 # 
		contadorCasaTPButton += 1 # 
		contadorBikeButton += 1 # 
		contadorTaxiButton += 1 # 
		contadorOnibusButton += 1 # 
		yield(get_tree().create_timer(0.1), "timeout")
		deixarTudoInvisivelagain = false

		

#Apenas tocando nos botões da tela
func _on_Direita_mouse_entered(): #botão Direita apertado
	irDireita = true # faz andar pra direita
func _on_Direita_mouse_exited(): #botão Direita solto
	irDireita = false # para o movimento pra direita
#Botão pra baixo
func _on_Baixo_mouse_entered(): #botão Baixo apertado
	irBaixo = true #faz andar pra baixo
func _on_Baixo_mouse_exited(): #botão Baixo solto
	irBaixo = false # para o movimento pra baixo
#Botão pra cima
func _on_Cima_mouse_entered(): #botão Cima apertado
	irCima = true #faz andar pra cima
func _on_Cima_mouse_exited(): #botão Cima solto
	irCima = false # para o movimento pra cima
#Botão pra esquerda
func _on_Esquerda_mouse_entered(): #botão Esquerda apertado
	irEsquerda = true #faz andar pra esquerda
func _on_Esquerda_mouse_exited(): #botão Esquerda solto
	irEsquerda = false # para o movimento pra esquerda
#Botão pra suldoeste
func _on_BaixoEsquerda_mouse_entered(): #botão BaixoEsquerda apertado
	irBaixoEsquerda = true #anda na diagonal suldoeste
func _on_BaixoEsquerda_mouse_exited(): #botão BaixoEsquerda solto
	irBaixoEsquerda = false # para o movimento diagonal
#Botão para suldeste
func _on_BaixoDireita_mouse_entered(): #botão BaixoDireita apertado
	irBaixoDireita = true #anda na diagonal suldeste
func _on_BaixoDireita_mouse_exited(): #botão BaixoEsquerda solto
	irBaixoDireita = false # para o movimento diagonal
#Botão pra noroeste
func _on_CimaEsquerda_mouse_entered(): #botão CimaEsquerda apertado 
	irCimaEsquerda = true #anda na diagonal noroeste 
func _on_CimaEsquerda_mouse_exited(): #botão CimaEsquerda solto
	irCimaEsquerda = false # para o movimento diagonla
#Botão pra nordeste
func _on_CimaDireita_mouse_entered(): #botão CimaDireita apertado
	irCimaDireita = true #anda na diagonal nordeste
func _on_CimaDireita_mouse_exited(): #botão Cima Direita solto
	irCimaDireita = false # para o movimento diagonla

#AbrirCelular
func _on_Config_pressed(): #apertar o botão de celular
	$Camera2D/Celular/AbrirCelular/CelularPanel.visible = true #aparece o celular
	$Camera2D/Controles/Controlesorg.visible = false #desaparecem os controles pra evitar andar com o celular aberto
func _on_CloseiPad_pressed(): #aperta o botao de fechar
	$Camera2D/Celular/AbrirCelular/CelularPanel.visible = false #desaparece o celular
	$Camera2D/Controles/Controlesorg.visible = true #voltam os controles


#Teleportes

##Teleportes por Area2D

# Entrar no banco
func _on_Banco_TP_body_entered(_body):
	self.position.x = 4024 #teleporta pra dentro do banco
	self.position.y = 2293 ##
	# Limita a camera2D para o mapa do banco
	$Camera2D.limit_bottom = 2210
	$Camera2D.limit_top = 1420
	$Camera2D.limit_left = 3092
	$Camera2D.limit_right = 4445
# Sair do banco
func _on_TP_Sair_Banco_body_entered(_body):
	self.position.x = 2177 #teleporta pra porta do banco
	self.position.y = 2109 ##
	# Limita a Câmera2D ao mapa geral:
	$Camera2D.limit_bottom = 2450
	$Camera2D.limit_top = -1914
	$Camera2D.limit_left = -86
	$Camera2D.limit_right = 2400

# Sair do Mercadinho
func _on_TP_Sair_Mercadinho_body_entered(_body):
	self.position.x = 634  # teleporta pra porta do mercadinho
	self.position.y = 1525 ##
	# Limita a Câmera2D ao mapa geral:
	$Camera2D.limit_bottom = 2450
	$Camera2D.limit_top = -1914
	$Camera2D.limit_left = -86
	$Camera2D.limit_right = 2400
# Entrar no Mercadinho
func _on_Mercadinho_TP_body_entered(_body):
	self.position.x = -277 # teleporta para o mercadinho
	self.position.y = 1434 ##
	# Limita a Câmera2D para o mapa do mercadinho
	$Camera2D.limit_bottom = 1362
	$Camera2D.limit_top = 508
	$Camera2D.limit_left = -1423
	$Camera2D.limit_right = -260


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
# Entrar na faculdade
func _on_Faculdade_TP_body_entered(_body): # vai pra faculdade
	Global.money = money
	$Camera2D/Controles/Controlesorg.visible = false # desaparecem os controles
	speed = 20 # diminui a velocidade
	yield(get_tree().create_timer(0.8), "timeout") # espera 0.8 sec
	irCima = false # para de andar
	yield(get_tree().create_timer(0.01), "timeout") # coiso
	
#	# Limita a Câmera2D ao mapa da Faculdade:
	$Camera2D.limit_bottom = -1935
	$Camera2D.limit_top = -4330
	$Camera2D.limit_left = 0
	$Camera2D.limit_right = 2100
	
	self.position.x = 1329  # teleporta para dentro da faculdade
	self.position.y = -1834 ##
	irCima = true # começa a andar devagarinho 
	yield(get_tree().create_timer(0.3), "timeout") # espera 3 sec
	irCima = false # para de andar
	speed = 300 # volta à velocidade normal
	$Camera2D/Controles/Controlesorg.visible = true # reaparecem os controles


#	Global.money -= 300
#	$"Camera2D/DinheiroLabel".text = "R$" + str(Global.money)

## Teleportes dentro do mapinha do celular
# Preços
var precoTaxi = 25
var precoOnibus = 15
var precoBike = 0


# Teleporte para a faculdade
var goToFaculdade = false
var irFaculdade = false #botao pra ir pra facul ta desativado
var contadorFaculdadeTPButton = 1 #ordena as clicadas
func _on_FaculdadeTP_pressed(): #botão para teleportar para a faculdade dentro do celular
	Global.money = money
	contadorFaculdadeTPButton += 1 #conta as vezes que é apertado
	if contadorFaculdadeTPButton % 2 == 0: #quando for par
		irFaculdade = true #ir pra faculdade está ativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/FaculdadeTP.modulate.a = 12 #deixa as letras tampadas
	if contadorFaculdadeTPButton % 2 == 1: #quando for impar
		irFaculdade = false #ir pra faculdade está desativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/FaculdadeTP.modulate.a = 0 #mostra as letras
	if irFaculdade == true and irTaxi == true: #se ativar a faculdade e o taxi
		money -= precoTaxi #paga
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$"+str(money) #valida isso fodase
		goToFaculdade = true #valida a ida para a faculdade
		
	if irFaculdade == true and irOnibus == true: #se ativar a faculdade e o onibus
		money -= precoOnibus #paga
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$"+str(money) #valida isso
		goToFaculdade = true #valida a ida para a faculdade
		
		
	if irFaculdade == true and irBike == true: #se ativa faculdade e bicicleta
		money -= precoBike #paga
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$"+str(money) #valida isso
		goToFaculdade = true #valida a ida para a faculdade

		
	if goToFaculdade == true:
		yield(get_tree().create_timer(0.8), "timeout") #espera 0.8 sec
		self.position.x = 1390 #teleporta pra porta da facudlade
		self.position.y = -830##]
		
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
		deixarTudoInvisivelagain = true
		goToFaculdade = false
#### Coisa Grande aqui em cima ####


# Botão para ir para casa
var goToCasa = false
var irCasa = false #botao pra ir pra facul ta desativado
var contadorCasaTPButton = 1 #ordena as clicadas
func _on_CasaTPad_pressed():
	Global.money = money
	contadorCasaTPButton += 1 #conta as vezes que é apertado
	if contadorCasaTPButton % 2 == 0: #quando for par
		irCasa = true #ir pra casa está ativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/CasaTPad.modulate.a = 12 #deixa as letras tampadas
	if contadorCasaTPButton % 2 == 1: #quando for impar
		irCasa = false #ir pra casa está desativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/CasaTPad.modulate.a = 0 #mostra as letras
	if irCasa == true and irTaxi == true: #se ativar a casa e o taxi
		money -= precoTaxi #paga
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$"+str(money) #valida isso fodase
		goToCasa = true #valida a ida para a casa
		
	if irCasa == true and irOnibus == true: #se ativar a casa e o onibus
		money -= precoOnibus #paga
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$"+str(money) #valida isso
		goToCasa = true #valida a ida para a casa
		
		
	if irCasa == true and irBike == true: #se ativa casa e bicicleta
		money -= precoBike #paga
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$"+str(Global.money) #valida isso
		goToCasa = true #valida a ida para a casa

		
	if goToCasa == true:
		yield(get_tree().create_timer(0.8), "timeout") #espera 0.8 sec
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
		yield(get_tree().create_timer(0.01), "timeout") #espera 0.01 sec
		irCasa = false
		deixarTudoInvisivelagain = true 
		goToCasa = false
#### Coisa Grande aqui em cima ####

# Botão pra ir para o banco
var goToBanco = false
var irBanco = false #botao pra ir pra facul ta desativado
var contadorBancoTPButton = 1 #ordena as clicadas
func _on_BancoTPad_pressed():
	Global.money = money
	contadorBancoTPButton += 1 #conta as vezes que é apertado
	if contadorBancoTPButton % 2 == 0: #quando for par
		irBanco = true #ir pra banco está ativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/BancoTPad.modulate.a = 12 #deixa as letras tampadas
	if contadorBancoTPButton % 2 == 1: #quando for impar
		irBanco = false #ir pra banco está desativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/BancoTPad.modulate.a = 0 #mostra as letras
	if irBanco == true and irTaxi == true: #se ativar a banco e o taxi
		money -= precoTaxi #paga
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$"+str(money) #valida isso fodase
		goToBanco = true #valida a ida para a banco
		
	if irBanco == true and irOnibus == true: #se ativar a banco e o onibus
		money -= precoOnibus #paga
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$"+str(money) #valida isso
		goToBanco = true #valida a ida para a banco
		
	if irBanco == true and irBike == true: #se ativa banco e bicicleta
		money -= precoBike #paga
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$"+str(money) #valida isso
		goToBanco = true #valida a ida para a banco

		
	if goToBanco == true:
		yield(get_tree().create_timer(0.8), "timeout") #espera 0.8 sec
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
		deixarTudoInvisivelagain = true
		goToBanco = false
#### Coisa Grande aqui em cima ####


# Botão pra ir para o mercadinho
var goToMercadinho = false
var irMercadinho = false #botao pra ir pra facul ta desativado
var contadorMercadinhoTPButton = 1 #ordena as clicadas
func _on_MercadinhoTPad_pressed():
	Global.money = money
	contadorMercadinhoTPButton += 1 #conta as vezes que é apertado
	if contadorMercadinhoTPButton % 2 == 0: #quando for par
		irMercadinho = true #ir pra mercadinho está ativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/MercadinhoTPad.modulate.a = 12 #deixa as letras tampadas
	if contadorMercadinhoTPButton % 2 == 1: #quando for impar
		irMercadinho = false #ir pra mercadinho está desativado
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/MercadinhoTPad.modulate.a = 0 #mostra as letras
	if irMercadinho == true and irTaxi == true: #se ativar o mercadinho e o taxi
		money -= precoTaxi #paga
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$"+str(money) #valida isso fodase
		goToMercadinho = true #valida a ida para a mercadinho
		
	if irMercadinho == true and irOnibus == true: #se ativar a mercadinho e o onibus
		money -= precoOnibus #paga
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$"+str(money) #valida isso
		goToMercadinho = true #valida a ida para a mercadinho
		
		
	if irMercadinho == true and irBike == true: #se ativa mercadinho e bicicleta
		money -= precoBike #paga
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$"+str(money) #valida isso
		goToMercadinho = true #valida a ida para a mercadinho

		
	if goToMercadinho == true:
		yield(get_tree().create_timer(0.8), "timeout") #espera 0.8 sec
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
		deixarTudoInvisivelagain = true
		goToMercadinho = false
#### Coisa Grande aqui em cima ####


### Lógicas para os botões do mapinha
#Ir de taxi
var irTaxi = false 
var contadorTaxiButton = 1
func _on_TaxiB_pressed():
	contadorTaxiButton += 1
	if contadorTaxiButton % 2 == 0:
		irTaxi = true
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Taxiimg/TaxiB.modulate.a = 0.12
	if contadorTaxiButton % 2 == 1:
		irTaxi = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Taxiimg/TaxiB.modulate.a = 1
# Pra ir de ônibus
var irOnibus = false
var contadorOnibusButton = 1
func _on_OnibusB_pressed():
	contadorOnibusButton += 1
	if contadorOnibusButton % 2 == 0:
		irOnibus = true
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Onibusimg/OnibusB.modulate.a = 0.12
	if contadorOnibusButton % 2 == 1:
		irOnibus = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Onibusimg/OnibusB.modulate.a = 1

# Pra ir de Bike
var irBike = false 
var contadorBikeButton = 1
func _on_BikeB_pressed():
	contadorBikeButton += 1
	if contadorBikeButton % 2 == 0:
		irBike = true
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Bikeimg/BikeB.modulate.a = 0.12
	if contadorBikeButton % 2 == 1:
		irBike = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/MapaB/MapaI/Bikeimg/BikeB.modulate.a = 1


# Efeitos visuais
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

# Coisas relacionadas ao primeiro boleto da faculdade
# Ação de pegar o boleto com a secretária 
var boleto = false # criando o boleto como variável
var contadorSecrFalasButton = 0 # ordena o botão de "próximo" da secretária
func _on_SecrFalasButton_pressed(): # botão de "próximo" da secretária
	contadorSecrFalasButton += 1 # cada vez que vai apertando faz algo
	if contadorSecrFalasButton >= 3: # na terceira vez em ponto, o prota recebe o boleto (dá "true" pra ele poder pagar no banco)
		$Camera2D/Controles/Controlesorg.visible = true # voltam os controles
		$Camera2D/Celular/AbrirCelular.visible = true # volta o celular
		boleto = true # com o boleto, ele pode pagar no banco
		$Camera2D/Dinheiro/Boleto.visible = true
# Ação de Pagar o boleto com o Guilherme
func _on_PagarBoleto_pressed(): # botão de "Pagar Boleto" na conversa do Guilherme
	if boleto == true: # se ele possui o boleto (falou com a secretária)
		money -= 80 # paga 80 pau
		$Camera2D/Dinheiro/DinheiroLabel.text = "R$" + str(money) # mostra o diñero
		$Camera2D/Falas/GuilhermeFalas/PagarBoleto.visible = false # desaparece esse botão
		# Muda o texto para o que ele pagou a taxa de matrícula
		$Camera2D/Falas/GuilhermeFalas/FalaGuilherme.text = "Prontinho, você pagou a taxa de matrícula. Sempre que precisar pagar algo pode falar comigo, até mais."
		$Camera2D/Dinheiro/Boleto.visible = false


# Coisas relacionadas à Professora e às aulas dela

func _on_IniciarAula_pressed(): # Botão de iniciar aula entre as falas da professora
	Global.comecarAulaUm = true
	self.position.x = 765  # teleporta para o meio da sala
	self.position.y = -2874
	$Camera2D/Falas/ProfessoraFalas/IniciarAula.visible = false
	$Camera2D/Falas/ProfessoraFalas.visible = false

var AcontecerUmaVez = 0
func _on_InicioAula1_body_entered(_body): # Area2D que inicia as primeiras falas da professora
	AcontecerUmaVez += 1
	if AcontecerUmaVez == 1:
		yield(get_tree().create_timer(1.6), "timeout")
		$Camera2D/Falas/ProfessoraFalas.visible = true

var ContadorProf = 0
var ContadorNextButton = 0
func _on_NextButton_pressed(): # Final dos slides muda os textos da professora
	ContadorNextButton += 1
	if ContadorNextButton == 4:
		yield(get_tree().create_timer(0.5), "timeout")
		$Camera2D/Falas/ProfessoraFalas.visible = true
		$Camera2D/Falas/ProfessoraFalas/FalaProfessora.text = "É isso por hoje, algumas aulas terão aprimoramentos no assunto, quando houver, eu irei lhe avisar"
		$Camera2D/Falas/ProfessoraFalas/ProfFalasButton.visible = true


#func _on_Area2D_sora_body_entered(_body): # Area2D que está EM VOLTA da professora
#	if Global.Falar_Depois_DaAula == true:
#		$Camera2D/Falas/ProfessoraFalas.visible = true
#		$Camera2D/Falas/ProfessoraFalas/FalaProfessora.text = "Eai? Conseguiu? Me conta qual foi seu resultado aqui embaixo."
#		$Camera2D/Falas/ProfessoraFalas/Resultado_Aula1.visible = true


# Interação com o Japinha do Mercadinho
func _on_Iniciar_Japinha_Falas_body_entered(_body):
	$Camera2D/Falas/JapinhaFalas.visible = true
	$Camera2D/Controles/Controlesorg.visible = false
	$Camera2D/Celular/AbrirCelular.visible = false
	pararMovimento = true


func _on_SairCvsaJapa_pressed():
	$Camera2D/Controles/Controlesorg.visible = true
	$Camera2D/Celular/AbrirCelular.visible = true



