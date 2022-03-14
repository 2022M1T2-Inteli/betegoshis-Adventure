extends KinematicBody2D

# Dinheiro
var money = Global.money
var pegarBoletoFaculdade = false
func _on_PagarFaculdade_pressed():
	if pegarBoletoFaculdade == true:
		money -= 300.49
		$"Camera2D/Dinheiro dele".text = "R$" + str(money)


func _ready(): #iniciar a cena já ativa os comandos abaixo
	
	$"Camera2D/Dinheiro dele".text = "R$" + str(money) #mostra o dinheiro inicial dele
	

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

func _process(delta):
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
		
	if deixarTudoInvisivelagain == true:
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Taxiimg.modulate.b = 1
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Onibusimg.modulate.b = 1
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Metroimg.modulate.b = 1
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Bikeimg.modulate.b = 1
		$Camera2D/Config/iPad/apps/MapaB/MapaI/FaculdadeTP.modulate.a = 0
		$Camera2D/Config/iPad/apps/MapaB/MapaI/BancoTPad.modulate.a = 0
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
	$Camera2D/Config/iPad.visible = true #aparece o IPAD
	$Camera2D/Controles.visible = false #desaparecem os controles pra evitar andar com o ipad aberto
func _on_CloseiPad_pressed(): #aperta o botao de fechar
	$Camera2D/Config/iPad.visible = false #desaparece o ipad
	$Camera2D/Controles.visible = true #voltam os controles


#Teleportes

##Teleportes por Area2D
func _on_TP_Sala_de_Aula_body_entered(_body): #sai da faculdade
	self.position.x = 1390
	self.position.y = -830
	

func _on_TPSairBanco_body_entered(_body):
	pass


func _on_Faculdade_TP_body_entered(_body): # vai pra faculdade
	Global.money = money
#	$Camera2D/Controles.visible = false # desaparecem os controles
	speed = 20 # diminui a velocidade
	yield(get_tree().create_timer(0.8), "timeout") # espera 0.8 sec
	irCima = false # para de andar
	yield(get_tree().create_timer(0.01), "timeout") # coiso
#	#Limita a Câmera2D:
#	$Camera2D.limit_bottom = -1912
#	$Camera2D.limit_left = 100
	self.position.x = 1329  # teleporta para dentro da faculdade
	self.position.y = -1834 ##
	irCima = true # começa a andar devagarinho 
	yield(get_tree().create_timer(0.3), "timeout") # espera 3 sec
	irCima = false # para de andar
	speed = 300 # volta à velocidade normal
	$Camera2D/Controles.visible = true # reaparecem os controles


#	Global.money -= 300
#	$"Camera2D/Dinheiro dele".text = "R$" + str(Global.money)

## Teleportes dentro do mapinha do iPad
# Preços
var precoTaxi = 25
var precoOnibus = 15
var precoMetro = 20
var precoBike = 0


# Teleporte para a faculdade
var goToFaculdade = false
var irFaculdade = false #botao pra ir pra facul ta desativado
var contadorFaculdadeTPButton = 1 #ordena as clicadas
func _on_FaculdadeTP_pressed(): #botão para teleportar para a faculdade dentro do iPad
	Global.money = money
	contadorFaculdadeTPButton += 1 #conta as vezes que é apertado
	if contadorFaculdadeTPButton % 2 == 0: #quando for par
		irFaculdade = true #ir pra faculdade está ativado
		$Camera2D/Config/iPad/apps/MapaB/MapaI/FaculdadeTP.modulate.a = 12 #deixa as letras tampadas
	if contadorFaculdadeTPButton % 2 == 1: #quando for impar
		irFaculdade = false #ir pra faculdade está desativado
		$Camera2D/Config/iPad/apps/MapaB/MapaI/FaculdadeTP.modulate.a = 0 #mostra as letras
	if irFaculdade == true and irTaxi == true: #se ativar a faculdade e o taxi
		money -= precoTaxi #paga
		$"Camera2D/Dinheiro dele".text = "R$"+str(money) #valida isso fodase
		goToFaculdade = true #valida a ida para a faculdade
		
	if irFaculdade == true and irOnibus == true: #se ativar a faculdade e o onibus
		money -= precoOnibus #paga
		$"Camera2D/Dinheiro dele".text = "R$"+str(money) #valida isso
		goToFaculdade = true #valida a ida para a faculdade
		
	if irFaculdade == true and irMetro == true: #se ativar faculdade e metrô
		money -= precoMetro #paga
		$"Camera2D/Dinheiro dele".text = "R$"+str(money) #valida isso
		goToFaculdade = true #valida a ida para a faculdade
		
	if irFaculdade == true and irBike == true: #se ativa faculdade e bicicleta
		money -= precoBike #paga
		$"Camera2D/Dinheiro dele".text = "R$"+str(money) #valida isso
		goToFaculdade = true #valida a ida para a faculdade

		
	if goToFaculdade == true:
		yield(get_tree().create_timer(0.8), "timeout") #espera 0.8 sec
		self.position.x = 1390 #teleporta pra porta da facudlade
		self.position.y = -830##
		$Camera2D/Config/iPad/apps/MapaB/MapaI.visible = false #desaparece o acesso ao mapa
		$Camera2D/Config/iPad/apps/MapaB/CloseMAPButton.visible = false #desaparece o botao 
		$Camera2D/Controles.visible = true #aparecem os controles
		$Camera2D/Config/iPad.visible = false #desaparece o iPad
		yield(get_tree().create_timer(0.01), "timeout") #espera 0.01 sec
		irFaculdade = false
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Taxiimg.modulate.b = 1
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Onibusimg.modulate.b = 1
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Metroimg.modulate.b = 1
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Bikeimg.modulate.b = 1
		$Camera2D/Config/iPad/apps/MapaB/MapaI/FaculdadeTP.modulate.a = 0
		goToFaculdade = false



# Botão para ir para casa
var goToCasa = false
var irCasa = false #botao pra ir pra facul ta desativado
var contadorCasaTPButton = 1 #ordena as clicadas
func _on_CasaTPad_pressed():
	Global.money = money
	contadorCasaTPButton += 1 #conta as vezes que é apertado
	if contadorCasaTPButton % 2 == 0: #quando for par
		irCasa = true #ir pra faculdade está ativado
		$Camera2D/Config/iPad/apps/MapaB/MapaI/CasaTPad.modulate.a = 12 #deixa as letras tampadas
	if contadorCasaTPButton % 2 == 1: #quando for impar
		irCasa = false #ir pra faculdade está desativado
		$Camera2D/Config/iPad/apps/MapaB/MapaI/CasaTPad.modulate.a = 0 #mostra as letras
	if irCasa == true and irTaxi == true: #se ativar a faculdade e o taxi
		money -= precoTaxi #paga
		$"Camera2D/Dinheiro dele".text = "R$"+str(money) #valida isso fodase
		goToCasa = true #valida a ida para a faculdade
		
	if irCasa == true and irOnibus == true: #se ativar a faculdade e o onibus
		money -= precoOnibus #paga
		$"Camera2D/Dinheiro dele".text = "R$"+str(money) #valida isso
		goToCasa = true #valida a ida para a faculdade
		
	if irCasa == true and irMetro == true: #se ativar faculdade e metrô
		money -= precoMetro #paga
		$"Camera2D/Dinheiro dele".text = "R$"+str(money) #valida isso
		goToCasa = true #valida a ida para a faculdade
		
	if irCasa == true and irBike == true: #se ativa faculdade e bicicleta
		money -= precoBike #paga
		$"Camera2D/Dinheiro dele".text = "R$"+str(Global.money) #valida isso
		goToCasa = true #valida a ida para a faculdade

		
	if goToCasa== true:
		yield(get_tree().create_timer(0.8), "timeout") #espera 0.8 sec
		self.position.x = -1882  #teleporta pra porta da facudlade
		self.position.y =  2177##
		$Camera2D/Config/iPad/apps/MapaB/MapaI.visible = false #desaparece o acesso ao mapa
		$Camera2D/Config/iPad/apps/MapaB/CloseMAPButton.visible = false #desaparece o botao 
		$Camera2D/Controles.visible = true #aparecem os controles
		$Camera2D/Config/iPad.visible = false #desaparece o iPad
		yield(get_tree().create_timer(0.01), "timeout") #espera 0.01 sec
		irCasa = false
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Taxiimg.modulate.b = 1
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Onibusimg.modulate.b = 1
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Metroimg.modulate.b = 1
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Bikeimg.modulate.b = 1
		$Camera2D/Config/iPad/apps/MapaB/MapaI/FaculdadeTP.modulate.a = 0
		$Camera2D/Config/iPad/apps/MapaB/MapaI/BancoTPad.modulate.a = 0
		goToCasa = false


# Botão pra ir para o banco
var goToBanco = false
var irBanco = false #botao pra ir pra facul ta desativado
var contadorBancoTPButton = 1 #ordena as clicadas
func _on_BancoTPad_pressed():
	Global.money = money
	contadorBancoTPButton += 1 #conta as vezes que é apertado
	if contadorBancoTPButton % 2 == 0: #quando for par
		irBanco = true #ir pra faculdade está ativado
		$Camera2D/Config/iPad/apps/MapaB/MapaI/BancoTPad.modulate.a = 12 #deixa as letras tampadas
	if contadorBancoTPButton % 2 == 1: #quando for impar
		irBanco = false #ir pra faculdade está desativado
		$Camera2D/Config/iPad/apps/MapaB/MapaI/BancoTPad.modulate.a = 0 #mostra as letras
	if irBanco == true and irTaxi == true: #se ativar a faculdade e o taxi
		money -= precoTaxi #paga
		$"Camera2D/Dinheiro dele".text = "R$"+str(money) #valida isso fodase
		goToBanco = true #valida a ida para a faculdade
		
	if irBanco == true and irOnibus == true: #se ativar a faculdade e o onibus
		money -= precoOnibus #paga
		$"Camera2D/Dinheiro dele".text = "R$"+str(money) #valida isso
		goToBanco = true #valida a ida para a faculdade
		
	if irBanco == true and irMetro == true: #se ativar faculdade e metrô
		money -= precoMetro #paga
		$"Camera2D/Dinheiro dele".text = "R$"+str(money) #valida isso
		goToBanco = true #valida a ida para a faculdade
		
	if irBanco == true and irBike == true: #se ativa faculdade e bicicleta
		money -= precoBike #paga
		$"Camera2D/Dinheiro dele".text = "R$"+str(money) #valida isso
		goToBanco = true #valida a ida para a faculdade

		
	if goToBanco == true:
		yield(get_tree().create_timer(0.8), "timeout") #espera 0.8 sec
		self.position.x = 4024 #teleporta pra porta do banco
		self.position.y = 2293 ##
		$Camera2D/Config/iPad/apps/MapaB/MapaI.visible = false #desaparece o acesso ao mapa
		$Camera2D/Config/iPad/apps/MapaB/CloseMAPButton.visible = false #desaparece o botao 
		$Camera2D/Controles.visible = true #aparecem os controles
		$Camera2D/Config/iPad.visible = false #desaparece o iPad
		yield(get_tree().create_timer(0.01), "timeout") #espera 0.01 sec
		irBanco = false
		deixarTudoInvisivelagain = true
		goToBanco = false




### Lógicas para os botões do mapinha
#Ir de taxi
var irTaxi = false 
var contadorTaxiButton = 1
func _on_TaxiB_pressed():
	contadorTaxiButton += 1
	if contadorTaxiButton % 2 == 0:
		irTaxi = true
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Taxiimg.modulate.b = 0.12
	if contadorTaxiButton % 2 == 1:
		irTaxi = false
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Taxiimg.modulate.b = 1
		
var irOnibus = false
var contadorOnibusButton = 1
func _on_OnibusB_pressed():
	contadorOnibusButton += 1
	if contadorOnibusButton % 2 == 0:
		irOnibus = true
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Onibusimg.modulate.b = 0.12
	if contadorOnibusButton % 2 == 1:
		irOnibus = false
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Onibusimg.modulate.b = 1
		
var irMetro = false
var contadorMetroButton = 1
func _on_MetroB_pressed():
	contadorMetroButton += 1
	if contadorMetroButton % 2 == 0:
		irMetro = true
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Metroimg.modulate.b = 0.12
	if contadorMetroButton % 2 == 1:
		irMetro = false
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Metroimg.modulate.b = 1
		
var irBike = false
var contadorBikeButton = 1
func _on_BikeB_pressed():
	contadorBikeButton += 1
	if contadorBikeButton % 2 == 0:
		irBike = true
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Bikeimg.modulate.b = 0.12
	if contadorBikeButton % 2 == 1:
		irBike = false
		$Camera2D/Config/iPad/apps/MapaB/MapaI/Bikeimg.modulate.b = 1



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


func _on_Iniciar_Guilherme_Falas_body_entered(body): # area2D no banco para falar com o baqueiro
	$Camera2D/Falas/GuilhermeFalas.visible = true # aparece o label de falas do guilherme
	$Camera2D/Controles.visible = false # desaparecem os controles (pra evitar andar durante a conversa)
	$Camera2D/Config.visible = false # desaparece o ipad (a fim de evitar que liguem ele durante a conversa)
	pararMovimento = true # para o movimento do boneco pra não bugar


func _on_SairCvsaGui_pressed(): # botão de "até mais"
	$Camera2D/Controles.visible = true # reaparecem os controles
	$Camera2D/Config.visible = true # reaparece o ipad


func _on_Iniciar_Secretria_Falas_body_entered(body): # area2D na escola/secretaria para falar com a secretária
	$Camera2D/Falas/SecretariaFalas.visible = true # aparece o label de falas dela 
	$Camera2D/Controles.visible = false # desaparecem os controles (pra evitar andar durante a conversa)
	$Camera2D/Config.visible = false # desaparece o ipad (a fim de evitar que liguem ele durante a conversa)
	pararMovimento = true # para o movimento do boneco pra não bugar
	

var boleto = false # criando o boleto como variável
var contadorSecrFalasButton = 0 # ordena o botão de "próximo" da secretária
func _on_SecrFalasButton_pressed(): # botão de "próximo" da secretária
	contadorSecrFalasButton += 1 # cada vez que vai apertando faz algo
	if contadorSecrFalasButton >= 3: # na terceira vez em ponto, o prota recebe o boleto (dá "true" pra ele poder pagar no banco)
		$Camera2D/Controles.visible = true # voltam os controles
		$Camera2D/Config.visible = true # volta o ipad
		boleto = true # com o boleto, ele pode pagar no banco
		$Camera2D/Boleto.visible = true
		

func _on_PagarBoleto_pressed(): # botão de "Pagar Boleto" na conversa do Guilherme
	if boleto == true: # se ele possui o boleto (falou com a secretária)
		money -= 80 # paga 80 pau
		$"Camera2D/Dinheiro dele".text = "R$" + str(money) # mostra o diñero
		$Camera2D/Falas/GuilhermeFalas/PagarBoleto.visible = false # desaparece esse botão
		# Muda o texto para o que ele pagou a taxa de matrícula
		$Camera2D/Falas/GuilhermeFalas/FalaGuilherme.text = "Prontinho, você pagou a taxa de matrícula. Sempre que precisar pagar algo pode falar comigo, até mais."
		$Camera2D/Boleto.visible = false


func _on_SairCvsaSecr_pressed():
	$Camera2D/Controles.visible = true
	$Camera2D/Config.visible = true
	


func _on_Banco_TP_body_entered(body):
	self.position.x = 4024 #teleporta pra porta do banco
	self.position.y = 2293 ##


func _on_TP_Sair_Banco_body_entered(body):
	self.position.x = 2177 #teleporta pra porta do banco
	self.position.y = 2109 ##


func _on_TP_Sair_Mercadinho_body_entered(body):
	self.position.x = 633 # teleporta pra porta do mercadinho
	self.position.y = 1424 ##


func _on_Mercadinho_TP_body_entered(body):
	self.position.x = -299 # teleporta para o mercadinho
	self.position.y = 1389 ##

func _on_IniciarAula_pressed():
	Global.comecarAulaUm = true
	self.position.x = 765  # teleporta para o meio da sala
	self.position.y = -2874
	$Camera2D/Falas/ProfessoraFalas/IniciarAula.visible = false
