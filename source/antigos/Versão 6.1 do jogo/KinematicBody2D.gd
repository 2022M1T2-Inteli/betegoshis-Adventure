extends KinematicBody2D

# Dinheiro
var pegarBoletoFaculdade = false 

func _ready(): # Acontece quando se inicia a cena
	$Camera2D/Dinheiro/DinheiroLabel.text = "BT$  " + str(Global.dinheiro)
	Global.VelocidadeTempo = Global.ShopTempo
	
	if Global.inicio_1 == false:
		# Limita a Câmera2D ao mapa da Casa da Vó:
		$Camera2D.limit_left = 3250
		$Camera2D.limit_right = 4380
		$Camera2D.limit_top = 109
		$Camera2D.limit_bottom = 1225
		Global.inicio_1 = true
	
	if Global.Jogo_Pong == true:
		#Teleporta pra frente do pong
		self.position.x = -857
		self.position.y = 2355
		#Limita a camera pro arcade
		$Camera2D.limit_top = 1530
		$Camera2D.limit_bottom = 2635
		$Camera2D.limit_left = -1530
		$Camera2D.limit_right = -170
		Global.Jogo_Pong = false
	
	if Global.Jogo_flapCoin == true:
		# Teleporta pra frente do flapCoin
		self.position.x = -857
		self.position.y = 2400
		#Limita a camera pro arcade
		$Camera2D.limit_top = 1530
		$Camera2D.limit_bottom = 2635
		$Camera2D.limit_left = -1530
		$Camera2D.limit_right = -170
		Global.Jogo_flapCoin = false
	

func _process(_delta):
	$Camera2D/Celular/AbrirCelular/Notificacao/AnimationPlayer.play("Brilhar")
	$Camera2D/Dinheiro/DinheiroLabel.text = "BT$  " + str(Global.dinheiro)
	
	
	
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
		
		Global.Tempo = true
		
		# Atualização dos contadores de cada função de ordenação de botões
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
	
	if Global.BarraFome >= 100:
		Global.BarraFome = 100
	print(Global.BarraFome)


var Avatar_1 = preload("res://Action RPG Resources/Player/Fox sheet.png")
var Avatar_2 = preload("res://Action RPG Resources/Player/Sapinho sheet.png")
var Avatar_3 = preload("res://Action RPG Resources/Player/Leaozinho sheet.png")



# Processos de movimentação e animação do personagem l3~l104
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


# Apenas tocando nos botões da tela
func _on_Direita_button_down(): #botão Direita apertado
	irDireita = true # faz andar pra direita
func _on_Direita_button_up(): #botão Direita solto
	irDireita = false # para o movimento pra direita
# Botão pra baixo
func _on_Baixo_button_down(): #botão Baixo apertado
	irBaixo = true #faz andar pra baixo
func _on_Baixo_button_up(): #botão Baixo solto
	irBaixo = false # para o movimento pra baixo
# Botão pra cima
func _on_Cima_button_down(): #botão Cima apertado
	irCima = true #faz andar pra cima
func _on_Cima_button_up(): #botão Cima solto
	irCima = false # para o movimento pra cima
# Botão pra esquerda
func _on_Esquerda_button_down(): #botão Esquerda apertado
	irEsquerda = true #faz andar pra esquerda
func _on_Esquerda_button_up(): #botão Esquerda solto
	irEsquerda = false # para o movimento pra esquerda
# Botão pra suldoeste
func _on_BaixoEsquerda_button_down(): #botão BaixoEsquerda apertado
	irBaixoEsquerda = true #anda na diagonal suldoeste
func _on_BaixoEsquerda_button_up(): #botão BaixoEsquerda solto
	irBaixoEsquerda = false # para o movimento diagonal
# Botão para suldeste
func _on_BaixoDireita_button_down(): #botão BaixoDireita apertado
	irBaixoDireita = true #anda na diagonal suldeste
func _on_BaixoDireita_button_up(): #botão BaixoEsquerda solto
	irBaixoDireita = false # para o movimento diagonal
# Botão pra noroeste
func _on_CimaEsquerda_button_down(): #botão CimaEsquerda apertado 
	irCimaEsquerda = true #anda na diagonal noroeste 
func _on_CimaEsquerda_button_up(): #botão CimaEsquerda solto
	irCimaEsquerda = false # para o movimento diagonla
# Botão pra nordeste
func _on_CimaDireita_button_down(): #botão CimaDireita apertado
	irCimaDireita = true #anda na diagonal nordeste
func _on_CimaDireita_button_up(): #botão Cima Direita solto
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
func _on_Shop_TP_body_entered(_body):
	Global.VelocidadeTempo = Global.ShopTempo
	# Teleporta
	self.position.x = 3978
	self.position.y = 74
	# Limita a Camera ao mapa da lojinha
	$Camera2D.limit_right = 4300
	$Camera2D.limit_left = 3600
	$Camera2D.limit_top = -702
	$Camera2D.limit_bottom = -58
# Sair da lojinha
func _on_TP_Sair_Shop_body_entered(_body):
	Global.VelocidadeTempo = Global.CidadeTempo
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
	Global.VelocidadeTempo = Global.ShopTempo
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
	Global.VelocidadeTempo = Global.CidadeTempo
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
	Global.VelocidadeTempo = Global.ShopTempo
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
	Global.VelocidadeTempo = Global.CidadeTempo
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
	Global.VelocidadeTempo = Global.ArcadeTempo
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
	Global.VelocidadeTempo = Global.CidadeTempo
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
	Global.VelocidadeTempo = Global.FaculdadeTempo
	# Animação de entrar no lugar
#	$Camera2D/Controles/Controlesorg.visible = false 
#	speed = 30 # diminui a velocidadew
#	yield(get_tree().create_timer(0.6), "timeout") 
#	irCima = false # para de andar
#	yield(get_tree().create_timer(0.01), "timeout") 
	
	# Limita a Câmera2D ao mapa da Faculdade:
	$Camera2D.limit_bottom = -1935
	$Camera2D.limit_top = -4330
	$Camera2D.limit_left = 0
	$Camera2D.limit_right = 2100
	# Teleporta
	self.position.x = 1329
	self.position.y = -1834 
	# Animação de entrando na faculdade 
#	irCima = true # começa a andar devagarinho 
#	yield(get_tree().create_timer(0.2), "timeout") 
#	irCima = false # para de andar
#	speed = 300 # volta à velocidade normal
#	$Camera2D/Controles/Controlesorg.visible = true # reaparecem os controles
	
# Sair da Faculdade
func _on_TP_Sala_de_Aula_body_entered(_body): #sai da faculdade
	Global.VelocidadeTempo = Global.CidadeTempo
	# Limita a Câmera2D ao mapa geral:
	$Camera2D.limit_bottom = 2450
	$Camera2D.limit_top = -1914
	$Camera2D.limit_left = -86
	$Camera2D.limit_right = 2400
	# Teleporta
	self.position.x = 1390
	self.position.y = -830

### Efeitos visuais
func _on_Deixarbixolento_body_entered(_body): # quando ele sobe/desce a escada
	speed = 200 # deixa lento pra dar a impressão de subir a escada
func _on_Deixarbixolento_body_exited(_body): # quando ele sai da escada
	speed = 275 # volta a ficar rápido



# Coisas para as falas dos personagens

# Falas do Guilherme, O Banqueiro do Betejóia
# Abrir conversa com ele
func _on_Iniciar_Guilherme_Falas_body_entered(_body): # area2D no banco para falar com o baqueiro
	$Camera2D/Falas/GuilhermeFalas.visible = true # aparece o label de falas do guilherme
	$Camera2D/Controles/Controlesorg.visible = false # desaparecem os controles (pra evitar andar durante a conversa)
	$Camera2D/Celular/AbrirCelular.visible = false # desaparece o celular (a fim de evitar que liguem ele durante a conversa)
	pararMovimento = true # para o movimento do boneco pra não bugar
	Global.ExclamacaoGui = false
# Sair da conversa dele
func _on_SairCvsaGui_pressed(): # botão de "até mais"
	$Camera2D/Controles/Controlesorg.visible = true # reaparecem os controles
	$Camera2D/Celular/AbrirCelular.visible = true # reaparece o celular

func _on_SairCvsaRafa_pressed(): # botão de "até mais"
	$Camera2D/Controles/Controlesorg.visible = true # reaparecem os controles
	$Camera2D/Celular/AbrirCelular.visible = true # reaparece o celular

# Falas da Secretária da Faculdade
# Abrir conversa com ela
func _on_Iniciar_Secretria_Falas_body_entered(_body): # area2D na escola/secretaria para falar com a secretária
	$Camera2D/Falas/SecretariaFalas.visible = true # aparece o label de falas dela 
	$Camera2D/Controles/Controlesorg.visible = false # desaparecem os controles (pra evitar andar durante a conversa)
	$Camera2D/Celular/AbrirCelular.visible = false # desaparece o celular (a fim de evitar que liguem ele durante a conversa)
	pararMovimento = true # para o movimento do boneco pra não bugar
	Global.ExclamacaoSecr = false
	
	if Global.dia == 1 and Global.F1_objetivo4 == true: # ou seja, ele pagou o boleto (completando o segundo objetivo)
		$Camera2D/Falas/SecretariaFalas/SecrFalasButton.visible = true
	

# Sair da conversa dela
func _on_SairCvsaSecr_pressed(): # Botão de "Até mais"
	$Camera2D/Controles/Controlesorg.visible = true
	$Camera2D/Celular/AbrirCelular.visible = true
	Global.ExclamacaoGui = true 
	
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
	if contadorSecrFalasButton == 3 and Global.F1_objetivo4 == true:
		$Camera2D/Celular/AbrirCelular/Notificacao.visible = true
		$Camera2D/Falas/SecretariaFalas/SairCvsaSecr.visible = false
# Ação de Pagar o boleto com o Guilherme
func _on_PagarBoleto_pressed(): # botão de "Pagar Boleto" na conversa do Guilherme
	if boleto == true: # se ele possui o boleto (falou com a secretária)
		Global.dinheiro -= 80 # paga 80 pau
		$Camera2D/Falas/GuilhermeFalas/PagarBoleto.visible = false # desaparece esse botão
		# Muda o texto para o que ele pagou a taxa de matrícula
		$Camera2D/Falas/GuilhermeFalas/FalaGuilherme.text = "Prontinho, você pagou a taxa de matrícula. Sempre que precisar pagar algo pode falar comigo, até mais."
		$Camera2D/Falas/SecretariaFalas/FalaSecretaria.text = "Olá novamente, já confirmamos que o seu boleto foi pago!"
		$Camera2D/Falas/SecretariaFalas/SairCvsaSecr.visible = false
		$Camera2D/Dinheiro/Boleto.visible = false
		Global.ExclamacaoSecr = true 
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
	Global.ExclamacaoTio = false
	if Global.dia == 2: 
		$Camera2D/Falas/TioClovisFalas/falastio.text = "Bom dia, " + str(Global.nome_jogador) + "! Obrigado por me acordar." 
		$Camera2D/Falas/TioClovisFalas/nextfala_tio.visible = true
		$Camera2D/Falas/TioClovisFalas/sairFala.visible = false
	

func _on_iniciar_falavo_body_entered(_body):
	$Camera2D/Falas/VoFalas.visible = true
	$Camera2D/Controles/Controlesorg.visible = false
	$Camera2D/Celular/AbrirCelular.visible = false
	pararMovimento = true
	Global.Tempo = false
	Global.ExclamacaoVo = false
func _on_tchau_vo_pressed():
	$Camera2D/Falas/VoFalas.visible = false
	$Camera2D/Celular/AbrirCelular.visible = true
	$Camera2D/Controles/Controlesorg.visible = true
	Global.Tempo = true
	Global.F1_objetivo1 = true
	$Camera2D/Celular/AbrirCelular/Notificacao.visible = true
	Global.ExclamacaoTio = true

func _on_sairFala_pressed():
	$Camera2D/Falas/TioClovisFalas.visible = false
	$Camera2D/Celular/AbrirCelular.visible = true
	$Camera2D/Controles/Controlesorg.visible = true
	Global.ExclamacaoSecr = true
	Global.F1_objetivo2 = true
	$Camera2D/Celular/AbrirCelular/Notificacao.visible = true

func _on_ComprarComida1_pressed():
	Global.BarraFome += 25 
	Global.BarraFelicidade += 3
	Global.BarraEnergia += 2
	if Global.dia == 2:
		Global.frango = true
	Global.gastarDinheiro(5, Global.Gastos_mercado)
	
	$Camera2D/Falas/JapinhaFalas/Comidinhas/fundo_branco/Exclamacao.visible = true
	yield(get_tree().create_timer(1), "timeout")
	$Camera2D/Falas/JapinhaFalas/Comidinhas/fundo_branco/Exclamacao.visible = false



func _on_ComprarComida2_pressed():
	Global.gastarDinheiro(9, Global.Gastos_mercado)
	Global.BarraFome += 50
	Global.BarraFelicidade += 3
	Global.BarraEnergia += 2
	if Global.dia == 2:
		Global.cogumelo = true
	
	$Camera2D/Falas/JapinhaFalas/Comidinhas/fundo_branco/Exclamacao.visible = true
	yield(get_tree().create_timer(1), "timeout")
	$Camera2D/Falas/JapinhaFalas/Comidinhas/fundo_branco/Exclamacao.visible = false
func _on_ComprarComida3_pressed():
	Global.gastarDinheiro(13, Global.Gastos_mercado)
	Global.BarraFome += 75
	Global.BarraFelicidade += 3
	Global.BarraEnergia += 2
	
	$Camera2D/Falas/JapinhaFalas/Comidinhas/fundo_branco/Exclamacao.visible = true
	yield(get_tree().create_timer(1), "timeout")
	$Camera2D/Falas/JapinhaFalas/Comidinhas/fundo_branco/Exclamacao.visible = false
##


func _on_Iniciar_Pong_body_entered(_body):
	$Camera2D/Dinheiro/Popups/IniciarPongImg.visible = true
func _on_Iniciar_Pong_body_exited(_body):
	$Camera2D/Dinheiro/Popups/IniciarPongImg.visible = false

func _on_IniciarPongButton_pressed():
	get_tree().change_scene("res://Pong/NovoLevelPong.tscn")


func _on_Iniciar_FlapMoney_body_entered(_body):
	$Camera2D/Dinheiro/Popups/IniciarFlapImg.visible = true
func _on_Iniciar_FlapMoney_body_exited(_body):
	$Camera2D/Dinheiro/Popups/IniciarFlapImg.visible = false

func _on_IniciarFlapMoneyButton_pressed():
	get_tree().change_scene("res://FlapCoin/FlapCoinWorld.tscn")

var Contador_NinYang_Area2D = 0
func _on_Iniciar_yang_Falas_body_entered(_body):
	$Camera2D/Controles/Controlesorg.visible = false
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
		$Camera2D/Falas/Nin_YangFalas/Falas_Do_NinYang.text = "Olá " + str(Global.nome_jogador) + ", você deseja comprar alguma coisa hoje?"
		$Camera2D/Falas/Nin_YangFalas/ComprarButton_NinYang2.visible = true
		$Camera2D/Falas/Nin_YangFalas/SairCvrs_NinYang.visible = true
		$Camera2D/Falas/Nin_YangFalas/Sair_NinYang.visible = false
		pararMovimento = true
		$Camera2D/Controles/Controlesorg.visible = false
		$Camera2D/Celular/AbrirCelular.visible = false

func _on_Comprar_Bicicleta_pressed():
	$Camera2D/Falas/Nin_YangFalas/Comprar_Bicicleta.visible = false
	$Camera2D/Falas/Nin_YangFalas/Comprar_avatares.visible = false
	Global.gastarDinheiro(500, Global.Gastos_LojaDeItens)
	$Camera2D/Falas/Nin_YangFalas/Falas_Do_NinYang.text = "Prontinho, você desbloqueou a bicicleta, pode checar seu mapa, você já poderá utilizá-la para ir aos lugares."
	$Camera2D/Falas/Nin_YangFalas/Sair_NinYang.visible = true
	Global.temBicicleta = true




func _on_DormirArea2D_body_entered(_body):
	if Global.dia == 1 and Global.F1_objetivo7 == true:
		$Camera2D/Dinheiro/DormirButton.visible = true
	if Global.dia == 2 and Global.F2_objetivo5 == true:
		$Camera2D/Dinheiro/DormirButton.visible = true
func _on_DormirArea2D_body_exited(_body):
	$Camera2D/Dinheiro/DormirButton.visible = false

func anoitecer():
	$Camera2D/Controles/Controlesorg.visible = false
	$Camera2D/Celular/AbrirCelular.visible = false
	# Roda lá em cima (em process pro tempo passar rapidão também
	yield(get_tree().create_timer(9),"timeout")
	$Camera2D/Controles/Controlesorg.visible = true
	$Camera2D/Celular/AbrirCelular.visible = true
	

func _on_DormirButton_pressed():
	if Global.dia == 1 and Global.F1_objetivo7 == true:
		Global.F1_objetivo8 = true
		anoitecer()
		# Passa o dia 
		Global.hora = 7
		Global.minuto = 30
		Global.dia = 2
	
	if Global.dia == 2 and Global.F2_objetivo5 == true:
		
		anoitecer()
		# Passa o dia
		Global.hora = 6
		Global.minuto = 30
		Global.dia = 3

#abrir pagina banco
func _on_BancoB_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco.visible = true 
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Nome_banco.text = "Olá, " + str(Global.nome_jogador)
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Saldo_banco.text = "Seu saldo: BT$ " + str(Global.dinheiro)

# sair Pagina banco
func _on_SairB_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco.visible = false

#abrir extrato
func _on_ExtratoButton_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato.visible = true
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Nome_banco.visible = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Saldo_banco.visible = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/InvestimentoButton.visible = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/ExtratoButton.visible = false
	
	if Global.Gastos_mercado.size() > 0:
		for i in Global.Gastos_mercado:
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.add_item("Mercado: BT$ " + str(i))
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.set_item_custom_fg_color($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, Color.red)
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.set_item_selectable($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, false)
				
	if Global.Gastos_LojaDeItens.size() > 0:
		for i in Global.Gastos_LojaDeItens:
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.add_item("Loja de Itens: BT$ " + str(i))
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.set_item_custom_fg_color($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, Color.red)
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.set_item_selectable($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, false)
				
	if Global.Gastos_transporte.size() > 0:
		for i in Global.Gastos_transporte:
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.add_item("Transporte: BT$ " + str(i))
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.set_item_custom_fg_color($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, Color.red)
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.set_item_selectable($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, false)
			
	if Global.Gastos_arcade.size() > 0:
		for i in Global.Gastos_arcade:
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.add_item("Arcade: BT$ " + str(i))
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.set_item_custom_fg_color($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, Color.red)
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.set_item_selectable($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, false)




func _on_InvestimentoButton_pressed():
	get_tree().change_scene("res://investimentos.tscn")


func _on_SairB2_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato.visible = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco.visible = true
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Nome_banco.visible = true
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Saldo_banco.visible = true
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/InvestimentoButton.visible = true
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/ExtratoButton.visible = true
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.clear()


func _on_Iniciar_RafaelFalas_body_entered(body):
	$Camera2D/Falas/RafaelFalas.visible = true
	$Camera2D/Controles/Controlesorg.visible = false
	$Camera2D/Celular/AbrirCelular.visible = false
	pararMovimento = true


func _on_InvestirButton_pressed():
	get_tree().change_scene("res://investimentos.tscn")

func _on_Sair_NinYang_pressed():
	$Camera2D/Falas/Nin_YangFalas.visible = false
	$Camera2D/Controles/Controlesorg.visible = true
	$Camera2D/Celular/AbrirCelular.visible = true

var contadorBotaoAvatar1 = 0
func _on_Avatar_1_pressed():
	Global.contadorBotaoAvatar1 += 1
	if contadorBotaoAvatar1 % 2 == 1:
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.disabled = true
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.disabled = true
	if contadorBotaoAvatar1 % 2 == 0:
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.disabled = false
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.disabled = false

var contadorBotaoAvatar2 = 0
func _on_Avatar_2_pressed():
	Global.contadorBotaoAvatar2 += 1
	if contadorBotaoAvatar2 % 2 == 1:
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.disabled = true
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.disabled = true
	if contadorBotaoAvatar2 % 2 == 0:
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.disabled = false
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.disabled = false

var contadorBotaoAvatar3 = 0
func _on_Avatar_3_pressed():
	contadorBotaoAvatar3 += 1
	if contadorBotaoAvatar3 % 2 == 1:
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.disabled = true
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.disabled = true
	if contadorBotaoAvatar3 % 2 == 0:
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.disabled = false
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.disabled = false


func _on_Comprar_pressed():
	# essas linhas podem mudar depois para auxiliar no processo da mochila (criar variável "TemAvatar1" pra deixar na mochila e ele poder trocar de personagem a qualquer momento)
	if contadorBotaoAvatar1 % 2 == 1:
		Global.select = 1 
		Global.gastarDinheiro(100, Global.Gastos_LojaDeItens)
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.visible = false
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.disabled = false
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.disabled = false
	if contadorBotaoAvatar2 % 2 == 1:
		Global.select = 2
		Global.gastarDinheiro(100, Global.Gastos_LojaDeItens)
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.visible = false
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.disabled = false
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.disabled = false
	if contadorBotaoAvatar3 % 2 == 1:
		Global.select = 3
		Global.gastarDinheiro(100, Global.Gastos_LojaDeItens)
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.visible = false
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.disabled = false
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.disabled = false

func _on_SelecionarLugares_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais.visible = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares.visible = true

# Para o botão de taxi:

func _on_BotaoTaxi_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoTaxi.pressed == true:
		Global.irTaxi = true
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoOnibus.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoBike.pressed = false
		Global.irOnibus = false
		Global.irTaxi = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/SelecionarLugares.visible = true
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoTaxi.pressed == false:
		Global.irTaxi = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/SelecionarLugares.visible = false
	
# Para o botão de ônibus:
func _on_BotaoOnibus_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoOnibus.pressed == true:
		Global.irOnibus = true
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoTaxi.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoBike.pressed = false
		Global.irTaxi = false
		Global.irBike = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/SelecionarLugares.visible = true
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoOnibus.pressed == false:
		Global.irOnibus = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/SelecionarLugares.visible = false
# Para o botão de bike:
func _on_BotaoBike_pressed():
	if Global.temBicicleta == true:
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoBike/Cadeado.visible = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoBike.disabled = false
		if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoBike.pressed == true:
			Global.irBike = true
			
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoOnibus.pressed = false
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoTaxi.pressed = false
			Global.irTaxi = false
			Global.irOnibus = false
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/SelecionarLugares.visible = true
		if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoBike.pressed == false:
			Global.irBike = false
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/SelecionarLugares.visible = false
	if Global.temBicicleta == false:
		pass

func _on_BotaoIrFaculdade_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed == true:
		Global.irFaculdade = true
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed = false
	
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed == false:
		Global.irFaculdade = false
		

func _on_BotaoIrArcade_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed == true:
		Global.irArcade = true
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed = false
	
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed == false:
		Global.irArcade = false
	
func _on_BotaoIrMercado_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed == true:
		Global.irMercado = true
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed = false
	
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed == false:
		Global.irMercado = false
	
func _on_BotaoIrLoja_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed == true:
		Global.irLoja = true
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed = false
	
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed == false:
		Global.irLoja = false
	
func _on_BotaoIrBanco_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed == true:
		Global.irBanco = true
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed = false
		
		
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed == false:
		Global.irBanco = false
	

func _on_BotaoIrCasa_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed == true:
		Global.irCasa = true
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed = false
		
		
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed == false:
		Global.irCasa = false
		

func teleportar(X, Y):
	self.position.x = X
	self.position.y = Y
	pass

func limitarCamera2D(cima, direita, baixo, esquerda):
	$Camera2D.limit_top = cima
	$Camera2D.limit_right = direita
	$Camera2D.limit_bottom = baixo
	$Camera2D.limit_left = esquerda
	pass

func fecharCelular():
	$Camera2D/Celular/AbrirCelular/CelularPanel.visible = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares.visible = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoOnibus.pressed = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoBike.pressed = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoTaxi.pressed = false
	visibilidadeBotoesApps(true)

func _on_BotaoViajar_pressed():
	# Ir para a faculdade:
	if Global.irFaculdade == true and Global.irTaxi == true: 
		Global.dinheiro -= Global.precoTaxi 
		Global.Gastos_transporte.append(-20.00)
		teleportar(1390, -830)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoTaxi)
	# Para ir de Ônibus à Faculdade
	if Global.irFaculdade == true and Global.irOnibus == true: 
		Global.dinheiro -= Global.precoOnibus
		Global.Gastos_transporte.append(-8.00)
		teleportar(1390, -830)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoOnibus)
	# Para ir de Bike à Faculdade
	if Global.irFaculdade == true and Global.irBike == true: 
		Global.dinheiro -= Global.precoBike 
		teleportar(1390, -830)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoBike)
	
	# Ir para o Arcade:
	if Global.irArcade == true and Global.irTaxi == true: 
		Global.dinheiro -= Global.precoTaxi 
		Global.Gastos_transporte.append(-20.00)
		teleportar(509, 2207)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoTaxi)
	# Para ir de Ônibus à Faculdade
	if Global.irArcade == true and Global.irOnibus == true: 
		Global.dinheiro -= Global.precoOnibus
		Global.Gastos_transporte.append(-8.00)
		teleportar(509, 2207)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoOnibus)
	# Para ir de Bike à Faculdade
	if Global.irArcade == true and Global.irBike == true: 
		Global.dinheiro -= Global.precoBike 
		teleportar(509, 2207)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoBike)
	
	
	# Ir para o Loja:
	if Global.irLoja == true and Global.irTaxi == true: 
		Global.dinheiro -= Global.precoTaxi 
		Global.Gastos_transporte.append(-20.00)
		teleportar(1870, 1443)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoTaxi)
	# Para ir de Ônibus à Faculdade
	if Global.irLoja == true and Global.irOnibus == true: 
		Global.dinheiro -= Global.precoOnibus
		Global.Gastos_transporte.append(-8.00)
		teleportar(1870, 1443)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoOnibus)
	# Para ir de Bike à Faculdade
	if Global.irLoja == true and Global.irBike == true: 
		Global.dinheiro -= Global.precoBike 
		teleportar(1870, 1443)
		limitarCamera2D(-1914, 2400, 2450, -86)
		Global.passaTempo(Global.tempoBike)
	
	# Ir para o Mercado:
	if Global.irMercado == true and Global.irTaxi == true: 
		Global.dinheiro -= Global.precoTaxi 
		Global.Gastos_transporte.append(-20.00)
		teleportar(634, 1525)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoTaxi)
	# Para ir de Ônibus à Faculdade
	if Global.irMercado == true and Global.irOnibus == true: 
		Global.dinheiro -= Global.precoOnibus
		Global.Gastos_transporte.append(-8.00)
		teleportar(634, 1525)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoOnibus)
	# Para ir de Bike à Faculdade
	if Global.irMercado == true and Global.irBike == true: 
		Global.dinheiro -= Global.precoBike 
		teleportar(634, 1525)
		limitarCamera2D(-1914, 2400, 2450, -86)
		Global.passaTempo(Global.tempoBike)
	
	# Ir para o Banco:
	if Global.irBanco == true and Global.irTaxi == true: 
		Global.dinheiro -= Global.precoTaxi 
		Global.Gastos_transporte.append(-20.00)
		teleportar(2177, 2109)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoTaxi)
	# Para ir de Ônibus à Faculdade
	if Global.irBanco == true and Global.irOnibus == true: 
		Global.dinheiro -= Global.precoOnibus
		Global.Gastos_transporte.append(-8.00)
		teleportar(2177, 2109)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoOnibus)
	# Para ir de Bike à Faculdade
	if Global.irBanco == true and Global.irBike == true: 
		Global.dinheiro -= Global.precoBike 
		teleportar(2177, 2109)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoBike)
	
	# Ir para o Casa:
	if Global.irCasa == true and Global.irTaxi == true: 
		Global.dinheiro -= Global.precoTaxi 
		Global.Gastos_transporte.append(-20.00)
		teleportar(-1900, 2176)
		limitarCamera2D(1590, -1830, 2500, 3666)
		fecharCelular()
		Global.passaTempo(Global.tempoTaxi)
	# Para ir de Ônibus à Faculdade
	if Global.irCasa == true and Global.irOnibus == true: 
		Global.dinheiro -= Global.precoOnibus
		Global.Gastos_transporte.append(-8.00)
		teleportar(-1900, 2176)
		limitarCamera2D(1590, -1830, 2500, 3666)
		fecharCelular()
		Global.passaTempo(Global.tempoOnibus)
	# Para ir de Bike à Faculdade
	if Global.irCasa == true and Global.irBike == true: 
		Global.dinheiro -= Global.precoBike 
		teleportar(-1900, 2176)
		limitarCamera2D(1590, -1830, 2500, 3666)
		fecharCelular()
		Global.passaTempo(Global.tempoBike)

func visibilidadeBotoesApps(estado):
	if estado == false:
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/AjustesB.visible = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/BancoB.visible = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/RevisaoB.visible = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/BotaoMapa.visible = false
	
	if estado == true:
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/AjustesB.visible = true
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/BancoB.visible = true
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/RevisaoB.visible = true
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/BotaoMapa.visible = true

func _on_VoltarModal_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais.visible = false
	visibilidadeBotoesApps(true)

func _on_VoltarLugares_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares.visible = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais.visible = true

func _on_BotaoMapa_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais.visible = true #aparece o mapa
	visibilidadeBotoesApps(false)
