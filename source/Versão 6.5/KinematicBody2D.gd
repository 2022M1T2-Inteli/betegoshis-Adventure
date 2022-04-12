extends KinematicBody2D

# Dinheiro
var pegarBoletoFaculdade = false 

var Gabriela = 15
func _ready(): # Acontece quando se inicia a cena
	$Camera2D/Dinheiro/DinheiroLabel.text = "BT$  " + str(Global.dinheiro)
	Global.VelocidadeTempo = Global.ShopTempo
	
	# Para as trocas de cena darem certo:
	if Global.inicio_1 == false:
		# Limita a Câmera2D ao mapa da Casa da Vó:
		limitarCamera2D(0, 1140, 1195, 0)
		get_parent().get_node("vo/ExclamacaoVo/AnimationPlayer").play("PulaPula")
		Global.inicio_1 = true
	if Global.inicio_2 == true and Global.Gabriela == 5:
		# Limita a camera ao mapa da casa do tio
		limitarCamera2D(1590, -1830, 2500, -3666)
		Global.inicio_2 = false 
		Gabriela = 12
		get_parent().get_node("ClovisTio/Exclamacao").visible = true
	if Global.Jogo_Pong == true:
		#Teleporta pra frente do pong
		teleportar(-1180, 2725, Global.ArcadeTempo)
		#Limita a camera pro arcade
		limitarCamera2D(1500, -175, 2800, -1680)
		$Camera2D/Dinheiro/Popups/IniciarPongImg.visible = false
		Global.Jogo_Pong = false
	
	if Global.Jogo_flapCoin == true:
		# Teleporta pra frente do flapCoin
		teleportar(-871, 2644, Global.ArcadeTempo)
		#Limita a camera pro arcade
		limitarCamera2D(1500, -175, 2800, -1680)
		$Camera2D/Dinheiro/Popups/IniciarFlapImg.visible = false
		Global.Jogo_flapCoin = false
	
	if Global.Jogo_taxi == true:
		# Teleporta pra frente do flapCoin
		teleportar(-463, 2639, Global.ArcadeTempo)
		#Limita a camera pro arcade
		limitarCamera2D(1500, -175, 2800, -1680)
		$Camera2D/Dinheiro/Popups/IniciarTaxiImg.visible = false
		Global.Jogo_taxi = false
	
	if Global.Jogo_tiroCoin == true:
		# Teleporta pra frente do flapCoin
		teleportar(-147, 2722, Global.ArcadeTempo)
		#Limita a camera pro arcade
		limitarCamera2D(1500, -175, 2800, -1680)
		$Camera2D/Dinheiro/Popups/IniciarNaveImg.visible = false
		Global.Jogo_tiroCoin = false

func _process(_delta):
	$Camera2D/Celular/AbrirCelular/Notificacao/AnimationPlayer.play("Brilhar")
	$Camera2D/Dinheiro/DinheiroLabel.text = "BT$  " + str(Global.dinheiro)
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Nome_banco.text = "Olá, " + str(Global.nome_jogador)
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Saldo_banco.text = "Seu saldo: BT$ " + str(Global.dinheiro)

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
	
	
	# Seleção da sprite do player
	if Global.select == 1:
		$Avatar.texture = Avatar_1
	if Global.select == 2:
		$Avatar.texture = Avatar_2
	if Global.select == 3:
		$Avatar.texture = Avatar_3
	
	# Para os botões no teleporte do celular
	# Especificamente aparecem quando um dos modais ou locais estão selecionados
	if Global.irFaculdade or Global.irArcade or Global.irBanco or Global.irLoja or Global.irCasa or Global.irMercado:
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoViajar.visible = true
	else:
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoViajar.visible = false
	
	# Coisas relacionadas às barras
	$Camera2D/Celular/AbrirCelular/CelularPanel/barras/Barra_Energia.value = Global.BarraEnergia
	$Camera2D/Celular/AbrirCelular/CelularPanel/barras/Barra_Fome.value = Global.BarraFome
	$Camera2D/Celular/AbrirCelular/CelularPanel/barras/Barra_Felicidade.value = Global.BarraFelicidade
	Global.BarraEnergia -= float(Global.MenosEnergia)
	Global.BarraFome -= float(Global.MenosFome)
	Global.BarraFelicidade -= float(Global.MenosFelicidade)
	
	if Global.BarraFome >= 100:
		Global.BarraFome = 100


var Avatar_1 = preload("res://Action RPG Resources/Player/Fox sheet.png")
var Avatar_2 = preload("res://Action RPG Resources/Player/Sapinho sheet.png")
var Avatar_3 = preload("res://Action RPG Resources/Player/Leaozinho sheet.png")



# Processos de movimentação e animação do personagem
# Definições iniciais
export (int) var speed = 300 
const SPEED = 1 
var velocity = Vector2() 

#função principal
func get_input():
	velocity = Vector2() 
	if Input.is_action_pressed("keyD") and Input.is_action_pressed("keyW") or irCimaDireita == true: #se apertar "D" e "W" simultaneamente
		velocity.x += SPEED
		velocity.y -= SPEED 
		$AnimationPlayer.play("correndinho pra direita")
		Global.BarraEnergia -= 0.005
	elif Input.is_action_pressed("keyD") and Input.is_action_pressed("keyS") or irBaixoDireita == true: #se apertar "D" e "S" simultanemamente
		velocity.x += SPEED 
		velocity.y += SPEED 
		$AnimationPlayer.play("correndinho pra direita")
		Global.BarraEnergia -= 0.005
	elif Input.is_action_pressed("keyA") and Input.is_action_pressed("keyW") or irCimaEsquerda == true: #se apertar "A" e "W" simultanemamente
		velocity.x -= SPEED 
		velocity.y -= SPEED
		$AnimationPlayer.play("correndinho pra esquerda")
		Global.BarraEnergia -= 0.005
	elif Input.is_action_pressed("keyA") and Input.is_action_pressed("keyS") or irBaixoEsquerda == true: #se apertar "A" e "S" simultanemamente
		velocity.x -= SPEED
		velocity.y += SPEED 
		$AnimationPlayer.play("correndinho pra esquerda")
		Global.BarraEnergia -= 0.005
	elif Input.is_action_pressed("keyD") or irDireita == true: 
		velocity.x += SPEED 
		$AnimationPlayer.play("correndinho pra direita") 
		Global.BarraEnergia -= 0.005
	elif Input.is_action_pressed("keyA") or irEsquerda == true:
		velocity.x -= SPEED
		$AnimationPlayer.play("correndinho pra esquerda") 
		Global.BarraEnergia -= 0.005
	elif Input.is_action_pressed("keyS") or irBaixo == true: 
		velocity.y += SPEED
		$AnimationPlayer.play("correndinho pra baixo") 
		Global.BarraEnergia -= 0.005
	elif Input.is_action_pressed("keyW") or irCima == true:
		velocity.y -= SPEED 
		$AnimationPlayer.play("correndinho pra cima") 
		Global.BarraEnergia -= 0.005
	else: #se apertar nada
		$AnimationPlayer.play("paradinhozinho") 
	velocity = velocity.normalized() * speed 
#	if Input.is_action_just_pressed("ui_accept"):
#		Global.hora += 2
#processos físicos
func _physics_process(_delta): 
	get_input() 
	velocity = move_and_slide(velocity) 

# Movimentação com os botões da tela
## Quando uma dessas variáveis recebe "true", ele anda para a direção indicada 
var irDireita = false
var irCima = false
var irBaixo = false
var irEsquerda = false
var irCimaDireita = false
var irCimaEsquerda = false
var irBaixoEsquerda = false
var irBaixoDireita = false
var pararMovimento = false

# Isso ocorre devido à ação de apertar os botões 
func _on_Direita_button_down(): 
	irDireita = true 
func _on_Direita_button_up(): 
	irDireita = false

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

func _on_BaixoEsquerda_button_down():
	irBaixoEsquerda = true 
func _on_BaixoEsquerda_button_up():
	irBaixoEsquerda = false

func _on_BaixoDireita_button_down(): 
	irBaixoDireita = true 
func _on_BaixoDireita_button_up(): 
	irBaixoDireita = false 

func _on_CimaEsquerda_button_down(): 
	irCimaEsquerda = true
func _on_CimaEsquerda_button_up(): 
	irCimaEsquerda = false 

func _on_CimaDireita_button_down(): 
	irCimaDireita = true 
func _on_CimaDireita_button_up(): 
	irCimaDireita = false
##



# AbrirCelular
func _on_AbrirCelular_pressed(): #apertar o botão de celular
	$Camera2D/Celular/AbrirCelular/CelularPanel.visible = true #aparece o celular
	$Camera2D/Controles/Controlesorg.visible = false #desaparecem os controles pra evitar andar com o celular aberto
	$Camera2D/Celular/AbrirCelular/Notificacao.visible = false

func _on_FecharCelular_pressed(): #aperta o botao de fechar
	$Camera2D/Celular/AbrirCelular/CelularPanel.visible = false #desaparece o celular
	$Camera2D/Controles/Controlesorg.visible = true #voltam os controles
	fecharCelular()


# Botão para abrir o mapa
func _on_BotaoMapa_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais.visible = true #aparece o mapa
	visibilidadeBotoesApps(false)
# Para sair do mapa utiliza-se o botão "Voltar Modal"


func _on_BotaoAjustes_pressed():
	$CelularPanel/apps/AjustesI.visible = true
func _on_BotaoSairAjustes_pressed():
	$CelularPanel/apps/AjustesI.visible = false
#Teleportes

##Teleportes por Area2D

# Área2D para entrar na Loja
func _on_Shop_TP_body_entered(_body):
	# Limita a Camera ao mapa da lojinha
	limitarCamera2D(-702, 4300, -58, 3600)
	teleportar(3978, 74, Global.ShopTempo)

# Área2D para sair da Loja
func _on_TP_Sair_Shop_body_entered(_body):
	# Limita a Câmera2D ao mapa geral:
	limitarCamera2D(-1914, 2400, 2450, -86)
	teleportar(1870, 1443, Global.CidadeTempo)


# Área2D para entrar no Banco
func _on_Banco_TP_body_entered(_body):
	# Limita a camera2D para o mapa do banco
	limitarCamera2D(1420, 4445, 2210, 3092)
	teleportar(4024, 2293, Global.ShopTempo)

# Área2D para sair do Banco
func _on_TP_Sair_Banco_body_entered(_body):
	# Limita a Câmera2D ao mapa geral:
	limitarCamera2D(-1914, 2400, 2450, -86)
	teleportar(2177, 2109, Global.CidadeTempo)


# Área2D para entrar no Mercado
func _on_Mercadinho_TP_body_entered(_body):
	# Limita a Câmera2D para o mapa do mercadinho
	limitarCamera2D(508, -260, 1362, -1423)
	teleportar(-277, 1434, Global.ShopTempo)

# Área2D para sair do Mercado
func _on_TP_Sair_Mercadinho_body_entered(_body):
	# Limita a Câmera2D ao mapa geral:
	limitarCamera2D(-1914, 2400, 2450, -86)
	teleportar(634, 1525, Global.CidadeTempo)


# Área2D para entrar no Arcade
func _on_Arcade_TP_body_entered(_body):
	# Limita a camera para o ambiente do Arcade
	limitarCamera2D(1500, -175, 2800, -1680)
	teleportar(-675, 2856, Global.ArcadeTempo)
# Área2D para sair do Arcade
func _on_TP_Sair_Arcade_body_entered(_body):
	teleportar(509, 2207, Global.CidadeTempo)
	# Limita a camera para o mapa geral
	limitarCamera2D(-1914, 2400, 2450, -86)


# Área2D para entrar na faculdade
func _on_Faculdade_TP_body_entered(_body):
	# Limita a Câmera2D ao mapa da Faculdade:
	limitarCamera2D(-4330, 2100, -1935, 0)
	teleportar(1329, -1834, Global.FaculdadeTempo) 

# Área2D para sair da faculdade
func _on_TP_Sair_Faculdade_body_entered(_body): 
	# Limita a Câmera2D ao mapa geral:
	limitarCamera2D(-1914, 2400, 2450, -86)
	teleportar(1390, -830, Global.CidadeTempo)




# Funções relacionadas ao teleporte pelo mapa do celular

## Botão de próximo na tela de Modais, apenas troca de imagem
func _on_SelecionarLugares_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais.visible = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares.visible = true

## Botão para sair do mapa praticamente
func _on_VoltarModal_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais.visible = false
	visibilidadeBotoesApps(true)

# Botões relacionados aos modos de transporte para os lugares. 
## Quando um deles é apertado, os outros são desapertados' automaticamente

### Botão para ir de taxi
func _on_BotaoTaxi_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoTaxi.pressed == true:
		Global.irTaxi = true
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoOnibus.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoBike.pressed = false
		Global.irOnibus = false
		Global.irBike = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/SelecionarLugares.visible = true
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoTaxi.pressed == false:
		Global.irTaxi = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/SelecionarLugares.visible = false
	
### Botão para ir de ônibus
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
	

### Botão para ir de bike
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
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoBike.disabled = true
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoBike/Cadeado.visible = true
	

## Volta para os modais
func _on_VoltarLugares_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares.visible = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais.visible = true

## Botões relacionados ao lugar de transporte
## Idem para os botões anteriores, quando um é apertado, os outros são abertos

### Botão para ir à Faculdade
func _on_BotaoIrFaculdade_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed == true:
		Global.irFaculdade = true
		
		Global.irArcade = false
		Global.irBanco = false
		Global.irBike = false
		Global.irLoja = false
		Global.irMercado = false
		Global.irCasa = false

		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed = false
	
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed == false:
		Global.irFaculdade = false


### Botão para ir ao Arcade
func _on_BotaoIrArcade_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed == true:
		Global.irArcade = true
		
		Global.irFaculdade = false
		Global.irBanco = false
		Global.irBike = false
		Global.irLoja = false
		Global.irMercado = false
		Global.irCasa = false

		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed = false
	
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed == false:
		Global.irArcade = false
	

### Botão para ir ao Mercado
func _on_BotaoIrMercado_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed == true:
		Global.irMercado = true
		
		Global.irArcade = false
		Global.irBanco = false
		Global.irBike = false
		Global.irLoja = false
		Global.irFaculdade = false
		Global.irCasa = false

		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed = false
	
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed == false:
		Global.irMercado = false
	

### Botão para ir à Loja de itens
func _on_BotaoIrLoja_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed == true:
		Global.irLoja = true
		
		Global.irArcade = false
		Global.irBanco = false
		Global.irBike = false
		Global.irFaculdade = false
		Global.irMercado = false
		Global.irCasa = false

		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed = false
	
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed == false:
		Global.irLoja = false
	

### Botão para ir ao Banco
func _on_BotaoIrBanco_pressed():
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed == true:
		Global.irBanco = true
		
		Global.irArcade = false
		Global.irFaculdade = false
		Global.irBike = false
		Global.irLoja = false
		Global.irMercado = false
		Global.irCasa = false

		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed = false
		
		
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed == false:
		Global.irBanco = false
	

### Botão para ir à casa do tio
func _on_BotaoIrCasa_pressed():
	print(Global.irCasa)
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed == true:
		Global.irCasa = true
		
		Global.irArcade = false
		Global.irBanco = false
		Global.irBike = false
		Global.irLoja = false
		Global.irMercado = false
		
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed = false
		
		
	if $Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed == false:
		Global.irCasa = false
	

# Funções para diminuir a quantidade de linhas do código
## Teleporta e define a velocidade do tempo no lugar
func teleportar(X, Y, VT):
	self.position.x = X
	self.position.y = Y
	Global.VelocidadeTempo = VT


##
func limitarCamera2D(cima, direita, baixo, esquerda):
	$Camera2D.limit_top = cima
	$Camera2D.limit_right = direita
	$Camera2D.limit_bottom = baixo
	$Camera2D.limit_left = esquerda

## Tira a visibilidade dos botões de app para evitar bugs
func visibilidadeBotoesApps(estado):
	if estado == false:
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/BotaoAjustes.visible = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/BotaoBanco.visible = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/BotaoRevisao.visible = false
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/BotaoMapa.visible = false
	
	if estado == true:
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/BotaoAjustes.visible = true
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/BotaoBanco.visible = true
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/BotaoRevisao.visible = true
		$Camera2D/Celular/AbrirCelular/CelularPanel/apps/BotaoMapa.visible = true

## fechar celular significa basicamente voltar à configuração inicial dele mesmo
func fecharCelular():
	$Camera2D/Celular/AbrirCelular/CelularPanel.visible = false
	$Camera2D/Controles/Controlesorg.visible = true
	
	# Fechar tudo no mapa do celular (tanto "despressionar" os botões quanto fechar os sprites de organização e as variáveis relacionadas ao teleporte)
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares.visible = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoOnibus.pressed = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoBike.pressed = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Modais/BotaoTaxi.pressed = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrFaculdade.pressed = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrArcade.pressed = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrBanco.pressed = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa.pressed = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrMercado.pressed = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrLoja.pressed = false
	
	Global.irTaxi = false
	Global.irBike = false
	Global.irOnibus = false 
	#
	Global.irFaculdade = false
	Global.irArcade = false
	Global.irBanco = false
	Global.irMercado = false
	Global.irCasa = false
	Global.irLoja = false
	##
	visibilidadeBotoesApps(true) 

## Diferentemente do "fecharCelular", essa serve, principalmente, para impedir o acesso ao celular e à movimentação do personagem
func desligarCelularControle(estado):
	if estado == false:
		$Camera2D/Celular/AbrirCelular.visible = false
		$Camera2D/Controles/Controlesorg.visible = false
	if estado == true:
		$Camera2D/Celular/AbrirCelular.visible = true
		$Camera2D/Controles/Controlesorg.visible = true




## O botão VIAJAR faz com que o personagem teleporte.
## Cada estrofe de códigos compara os botões de modal e lugar apertados.
## Em cada teleporte:
## -  desconta a quantidade de dinheiro do modal
## -  printa o gasto no extrato
## -  teleporta
## -  limita a camera2D
## -  fecha o celular
## -  passa o tempo e coloca a velociade dele na do lugar teleportado
func _on_BotaoViajar_pressed():
	
	## Ir à Faculdade
	if Global.irFaculdade == true and Global.irTaxi == true: 
		Global.dinheiro -= Global.precoTaxi 
		Global.Gastos_transporte.append(-20.00)
		teleportar(1390, -830, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoTaxi)
	
	if Global.irFaculdade == true and Global.irOnibus == true: 
		Global.dinheiro -= Global.precoOnibus
		Global.Gastos_transporte.append(-8.00)
		teleportar(1390, -830, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoOnibus)
	
	if Global.irFaculdade == true and Global.irBike == true: 
		Global.dinheiro -= Global.precoBike 
		teleportar(1390, -830, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoBike)
	
	# Ir ao Arcade
	if Global.irArcade == true and Global.irTaxi == true: 
		Global.dinheiro -= Global.precoTaxi 
		Global.Gastos_transporte.append(-20.00)
		teleportar(509, 2207, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoTaxi)
	
	if Global.irArcade == true and Global.irOnibus == true: 
		Global.dinheiro -= Global.precoOnibus
		Global.Gastos_transporte.append(-8.00)
		teleportar(509, 2207, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoOnibus)
	
	if Global.irArcade == true and Global.irBike == true: 
		Global.dinheiro -= Global.precoBike 
		teleportar(509, 2207, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoBike)
	
	
	# Ir à Loja
	if Global.irLoja == true and Global.irTaxi == true: 
		Global.dinheiro -= Global.precoTaxi 
		Global.Gastos_transporte.append(-20.00)
		teleportar(1870, 1443, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoTaxi)
	
	if Global.irLoja == true and Global.irOnibus == true: 
		Global.dinheiro -= Global.precoOnibus
		Global.Gastos_transporte.append(-8.00)
		teleportar(1870, 1443, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoOnibus)
	
	if Global.irLoja == true and Global.irBike == true: 
		Global.dinheiro -= Global.precoBike 
		teleportar(1870, 1443, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		Global.passaTempo(Global.tempoBike)
	
	# Ir ao Mercado
	if Global.irMercado == true and Global.irTaxi == true: 
		Global.dinheiro -= Global.precoTaxi 
		Global.Gastos_transporte.append(-20.00)
		teleportar(634, 1525, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoTaxi)
	
	if Global.irMercado == true and Global.irOnibus == true: 
		Global.dinheiro -= Global.precoOnibus
		Global.Gastos_transporte.append(-8.00)
		teleportar(634, 1525, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoOnibus)
	
	if Global.irMercado == true and Global.irBike == true: 
		Global.dinheiro -= Global.precoBike 
		teleportar(634, 1525, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		Global.passaTempo(Global.tempoBike)
	
	# Ir ao Banco
	if Global.irBanco == true and Global.irTaxi == true: 
		Global.dinheiro -= Global.precoTaxi 
		Global.Gastos_transporte.append(-20.00)
		teleportar(2177, 2109, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoTaxi)
	
	if Global.irBanco == true and Global.irOnibus == true: 
		Global.dinheiro -= Global.precoOnibus
		Global.Gastos_transporte.append(-8.00)
		teleportar(2177, 2109, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoOnibus)
	
	if Global.irBanco == true and Global.irBike == true: 
		Global.dinheiro -= Global.precoBike 
		teleportar(2177, 2109, Global.CidadeTempo)
		limitarCamera2D(-1914, 2400, 2450, -86)
		fecharCelular()
		Global.passaTempo(Global.tempoBike)
	
	# Ir à Casa do Tio
	if Global.irCasa == true and Global.irTaxi == true: 
		Global.dinheiro -= Global.precoTaxi 
		Global.Gastos_transporte.append(-20.00)
		teleportar(-1900, 2176, Global.CidadeTempo)
		limitarCamera2D(1590, -1830, 2500, -3666)
		fecharCelular()
		Global.passaTempo(Global.tempoTaxi)
	
	if Global.irCasa == true and Global.irOnibus == true: 
		Global.dinheiro -= Global.precoOnibus
		Global.Gastos_transporte.append(-8.00)
		teleportar(-1900, 2176, Global.CidadeTempo)
		limitarCamera2D(1590, -1830, 2500, -3666)
		fecharCelular()
		Global.passaTempo(Global.tempoOnibus)
	
	if Global.irCasa == true and Global.irBike == true: 
		Global.dinheiro -= Global.precoBike 
		teleportar(-1900, 2176, Global.CidadeTempo)
		limitarCamera2D(1590, -1830, 2500, -3666)
		fecharCelular()
		Global.passaTempo(Global.tempoBike)






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


# Falas da Secretária da Faculdade
# Abrir conversa com ela
func _on_Iniciar_Secretria_Falas_body_entered(_body): 
	$Camera2D/Falas/SecretariaFalas.visible = true 
	desligarCelularControle(false) 
	pararMovimento = true
	Global.ExclamacaoSecr = false
	
	if Global.dia == 1 and $Camera2D/Falas/GuilhermeFalas/PagarBoleto.pressed == true: # ou seja, ele pagou o boleto (completando o segundo objetivo)
		$Camera2D/Falas/SecretariaFalas/SecrFalasButton.visible = true
		$Camera2D/Falas/SecretariaFalas/SairCvsaSecr.visible = true
	if Global.boleto == true:
		$Camera2D/Falas/GuilhermeFalas/FalaGuilherme.text = ""

# Sair da conversa dela
func _on_SairCvsaSecr_pressed(): 
	desligarCelularControle(true)
	if Global.dia == 1:
		Global.ExclamacaoGui = true 
		Global.objetivo3 = true
		$Camera2D/Celular/AbrirCelular/Notificacao.visible = true

# Coisas relacionadas ao primeiro boleto da faculdade
## Ação de Pagar o boleto com o Guilherme
func _on_PagarBoleto_pressed(): 
	if Global.boleto == true: 
		Global.dinheiro -= 80 
		$Camera2D/Falas/GuilhermeFalas/PagarBoleto.visible = false 
		
		$Camera2D/Falas/GuilhermeFalas/FalaGuilherme.text = "Prontinho, você pagou a taxa de matrícula. Sempre que precisar pagar algo pode falar comigo, até mais."
		$Camera2D/Falas/SecretariaFalas/FalaSecretaria.text = "Olá novamente, já confirmamos que o seu boleto foi pago!"
		
		$Camera2D/Falas/SecretariaFalas/SairCvsaSecr.visible = false
		$Camera2D/Dinheiro/Boleto.visible = false
		Global.ExclamacaoSecr = true 
		Global.objetivo4 = true 
	else:
		pass

# Coisas relacionadas à Professora e às aulas dela

func _on_IniciarAula_pressed(): # Botão de iniciar aula entre as falas da professora
	Global.comecarAula = true
	teleportar(765, -2874, Global.FaculdadeTempo)
	$Camera2D/Falas/ProfessoraFalas/IniciarAula.visible = false
	$Camera2D/Falas/ProfessoraFalas.visible = false
	pararMovimento = true

var AcontecerUmaVez = 0
func _on_InicioAula_body_entered(_body): # Area2D que inicia as primeiras falas da professora
	if Global.dia == 1 and Global.comecarAula == false and AcontecerUmaVez == 0:
		yield(get_tree().create_timer(1.5), "timeout")
		$Camera2D/Falas/ProfessoraFalas.visible = true
		$Camera2D/Falas/ProfessoraFalas/BotaoFalasProf.visible = true
		AcontecerUmaVez = 1
	if Global.dia == 2 and Global.comecarAula == false and AcontecerUmaVez == 1:
		$Camera2D/Falas/ProfessoraFalas.visible = true
		$Camera2D/Falas/ProfessoraFalas/BotaoFalasProf.visible = true
		$Camera2D/Falas/ProfessoraFalas/IniciarAula.visible = true
		AcontecerUmaVez = 2
	if Global.dia == 3 and Global.comecarAula == false and AcontecerUmaVez == 2:
		$Camera2D/Falas/ProfessoraFalas.visible = true
		$Camera2D/Falas/ProfessoraFalas/BotaoFalasProf.visible = true
		AcontecerUmaVez = 3
		$Camera2D/Falas/ProfessoraFalas/IniciarAula.visible = true
	if Global.dia == 4 and Global.comecarAula == false and AcontecerUmaVez == 3:
		$Camera2D/Falas/ProfessoraFalas.visible = true
		$Camera2D/Falas/ProfessoraFalas/BotaoFalasProf.visible = true
		AcontecerUmaVez = 4
		$Camera2D/Falas/ProfessoraFalas/IniciarAula.visible = true
	if Global.dia == 5 and Global.comecarAula == false and AcontecerUmaVez == 4:
		$Camera2D/Falas/ProfessoraFalas.visible = true
		$Camera2D/Falas/ProfessoraFalas/BotaoFalasProf.visible = true
		AcontecerUmaVez = 5
		$Camera2D/Falas/ProfessoraFalas/IniciarAula.visible = true
	if Global.dia == 6 and Global.comecarAula == false and AcontecerUmaVez == 5:
		$Camera2D/Falas/ProfessoraFalas.visible = true
		$Camera2D/Falas/ProfessoraFalas/BotaoFalasProf.visible = true
		AcontecerUmaVez = 6
		$Camera2D/Falas/ProfessoraFalas/IniciarAula.visible = true


#func _on_Area2D_sora_body_entered(_body): # Area2D que está EM VOLTA da professora
#	if Global.Falar_Depois_DaAula == true:
#		$Camera2D/Falas/ProfessoraFalas.visible = true
#		$Camera2D/Falas/ProfessoraFalas/FalaProfessora.text = "Eai? Conseguiu? Me conta qual foi seu resultado aqui embaixo."
#		$Camera2D/Falas/ProfessoraFalas/Resultado_Aula1.visible = true

# Interação com o Japinha do Mercadinho
func _on_Iniciar_Japinha_Falas_body_entered(_body): # botão atrás do 
	$Camera2D/Falas/JapinhaFalas/Falaorg.visible = true
	desligarCelularControle(false)
	pararMovimento = true


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
	pararMovimento = true
	Global.Tempo = false
	Global.ExclamacaoVo = false
func _on_tchau_vo_pressed():
	$Camera2D/Falas/VoFalas.visible = false
	$Camera2D/Controles/Controlesorg.visible = true
	Global.Tempo = true
	Global.objetivo1 = true

func _on_sairFala_pressed():
	$Camera2D/Falas/TioClovisFalas.visible = false
	desligarCelularControle(true)
	if Global.dia == 1:
		Global.ExclamacaoSecr = true
		Global.objetivo2 = true

func _on_ComprarComida1_pressed():
	Global.dinheiro -= 5
	Global.Gastos_mercado.append(-5)
	
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
	Global.dinheiro -= 9
	Global.Gastos_mercado.append(-9)
	
	Global.BarraFome += 50
	Global.BarraFelicidade += 3
	Global.BarraEnergia += 2
	if Global.dia == 2:
		Global.cogumelo = true
	
	$Camera2D/Falas/JapinhaFalas/Comidinhas/fundo_branco/Exclamacao.visible = true
	yield(get_tree().create_timer(1), "timeout")
	$Camera2D/Falas/JapinhaFalas/Comidinhas/fundo_branco/Exclamacao.visible = false
func _on_ComprarComida3_pressed():
	Global.dinheiro -= 13
	Global.Gastos_mercado.append(-13)
	
	Global.BarraFome += 75
	Global.BarraFelicidade += 3
	Global.BarraEnergia += 2
	
	$Camera2D/Falas/JapinhaFalas/Comidinhas/fundo_branco/Exclamacao.visible = true
	yield(get_tree().create_timer(1), "timeout")
	$Camera2D/Falas/JapinhaFalas/Comidinhas/fundo_branco/Exclamacao.visible = false
##


# Áreas2D para os minigames:
func _on_Iniciar_Pong_body_entered(_body):
	$Camera2D/Dinheiro/Popups/IniciarPongImg.visible = true
func _on_Iniciar_Pong_body_exited(_body):
	$Camera2D/Dinheiro/Popups/IniciarPongImg.visible = false
func _on_IniciarPongButton_pressed():
	get_tree().change_scene("res://Minigames/Pong/NovoLevelPong.tscn")
#
func _on_Iniciar_FlapMoney_body_entered(_body):
	$Camera2D/Dinheiro/Popups/IniciarFlapImg.visible = true
func _on_Iniciar_FlapMoney_body_exited(_body):
	$Camera2D/Dinheiro/Popups/IniciarFlapImg.visible = false
func _on_IniciarFlapMoneyButton_pressed():
	get_tree().change_scene("res://Minigames/flappyCoinGame/WorldFlapCoin.tscn")
#
func _on_Iniciar_TaxiGame_body_entered(_body):
	$Camera2D/Dinheiro/Popups/IniciarTaxiImg.visible = true
func _on_Iniciar_TaxiGame_body_exited(_body):
	$Camera2D/Dinheiro/Popups/IniciarTaxiImg.visible = false
func _on_IniciarTaxiGame_pressed():
	get_tree().change_scene("res://Minigames/taxiGame/WorldTaxi.tscn")
#
func _on_Iniciar_NaveGame_body_entered(_body):
	$Camera2D/Dinheiro/Popups/IniciarNaveImg.visible = true
func _on_Iniciar_NaveGame_body_exited(_body):
	$Camera2D/Dinheiro/Popups/IniciarNaveImg.visible = false
func _on_IniciarNaveGame_pressed():
	get_tree().change_scene("res://Minigames/tiroCoinGame/Player/WorldNave.tscn")
##


var Contador_NinYang_Area2D = 0
func _on_Iniciar_yang_Falas_body_entered(_body):
	desligarCelularControle(false)
	pararMovimento = true
	$Camera2D/Falas/Nin_YangFalas.visible = true
	Contador_NinYang_Area2D += 1
	if Contador_NinYang_Area2D == 1:
		pararMovimento = true
		$Camera2D/Controles/Controlesorg.visible = false
		$Camera2D/Celular/AbrirCelular.visible = false
	if Contador_NinYang_Area2D >= 2:
		$Camera2D/Falas/Nin_YangFalas.visible = true
		$Camera2D/Falas/Nin_YangFalas/Falas_Do_NinYang.text = "Olá " + str(Global.nome_jogador) + ", você deseja comprar alguma coisa hoje?"
		$Camera2D/Falas/Nin_YangFalas/ComprarButton_NinYang2.visible = true
		$Camera2D/Falas/Nin_YangFalas/SairCvrs_NinYang.visible = true
		$Camera2D/Falas/Nin_YangFalas/Falaorg/SairCvrs_NinYang/Label.text = "Não"
		pararMovimento = true
		desligarCelularControle(false)

func _on_Comprar_Bicicleta_pressed():
	$Camera2D/Falas/Nin_YangFalas/Falaorg/Comprar_Bicicleta.visible = false
	$Camera2D/Falas/Nin_YangFalas/Falaorg/Comprar_avatares.visible = false
	Global.gastarDinheiro(500, Global.Gastos_LojaDeItens)
	$Camera2D/Falas/Nin_YangFalas/Falaorg/Falas_Do_NinYang.text = "Prontinho, você desbloqueou a bicicleta, pode checar seu mapa, você já poderá utilizá-la para ir aos lugares."
	$Camera2D/Falas/Nin_YangFalas/Falaorg/Sair_NinYang.visible = true
	Global.temBicicleta = true




func _on_DormirArea2D_body_entered(_body):
	if Global.dia == 1 and Global.objetivo7 == true:
		$Camera2D/Dinheiro/DormirButton.visible = true
	if Global.dia == 2 and Global.objetivo5 == true:
		$Camera2D/Dinheiro/DormirButton.visible = true
func _on_DormirArea2D_body_exited(_body):
	$Camera2D/Dinheiro/DormirButton.visible = false

func anoitecer():
	$Camera2D/Controles/Controlesorg.visible = false
	$Camera2D/Celular/AbrirCelular.visible = false
	#### Sugestão: Rodar em algum process para a hora passar rapidamente
	yield(get_tree().create_timer(9),"timeout")
	$Camera2D/Controles/Controlesorg.visible = true
	$Camera2D/Celular/AbrirCelular.visible = true
	


func _on_BotaoDormir_pressed():
	if Global.dia == 1 and Global.F1_objetivo7 == true:
		Global.Dormir = true
		anoitecer()
		# Passa o dia 
		Global.hora = 7
		Global.minuto = 30
		Global.dia = 2
	
	if Global.dia == 2 and Global.F2_objetivo5 == true:
		Global.Dormir = true
		anoitecer()
		# Passa o dia
		Global.hora = 6
		Global.minuto = 30
		Global.dia = 3

# Botão de abrir o aplicativo do banco
func _on_BotaoBanco_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg.visible = true 
	visibilidadeBotoesApps(false)

# Botão de voltar para o menu do celular
func _on_BotaoSairBanco_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg.visible = false
	visibilidadeBotoesApps(true)


# Botão de Abrir o extrato:
# Para cada compra feita (índice "i") é adicionado seu valor e onde foi gasto
# As informações de valor e local gasto estão armazenadas nas variáveis do script global
func _on_BotaoExtrato_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato.visible = true
	
	if Global.Gastos_mercado.size() > 0:
		for i in Global.Gastos_mercado:
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.add_item("Mercado: BT$ " + str(i))
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.set_item_custom_fg_color($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, Color.red)
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.set_item_selectable($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, false)
		
	if Global.Gastos_LojaDeItens.size() > 0:
		for i in Global.Gastos_LojaDeItens:
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.add_item("Loja de Itens: BT$ " + str(i))
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.set_item_custom_fg_color($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, Color.red)
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.set_item_selectable($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, false)
		
	if Global.Gastos_transporte.size() > 0:
		for i in Global.Gastos_transporte:
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.add_item("Transporte: BT$ " + str(i))
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.set_item_custom_fg_color($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, Color.red)
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.set_item_selectable($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, false)
		
	if Global.Gastos_arcade.size() > 0:
		for i in Global.Gastos_arcade:
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.add_item("Arcade: BT$ " + str(i))
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.set_item_custom_fg_color($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, Color.red)
			$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.set_item_selectable($Camera2D/Celular/AbrirCelular/CelularPanel/apps/PaginaBanco/Extrato/ItemList.get_item_count() - 1, false)

# Botão de investir passa para a cena da corretora, além de salvar o local em que ele está
func _on_BotaoInvestir_pressed():
	get_tree().change_scene("res://investimentos.tscn")
# Pedir ajuda ao luiz

# Botão para sair do extrato e aparecer o app do banco
func _on_SairExtrato_pressed():
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato.visible = false
	$Camera2D/Celular/AbrirCelular/CelularPanel/apps/Bancoorg/Extrato/Lista_Itens_Comprados.clear()

func _on_Iniciar_RafaelFalas_body_entered(body):
	$Camera2D/Falas/RafaelFalas.visible = true
	desligarCelularControle(false)
	pararMovimento = true



# Coisas de comprar NinYang
func _on_Avatar_1_pressed():
	if $Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.pressed == false:
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.pressed = true
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.pressed = true
	if $Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.pressed == true:
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.pressed = false
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.pressed = false
func _on_Avatar_2_pressed():
	if $Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.pressed == false:
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.pressed = true
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.pressed = true
	if $Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.pressed == true:
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.pressed = false
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.pressed = false
func _on_Avatar_3_pressed():
	if $Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.pressed == false:
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.pressed = true
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.pressed = true
	if $Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.pressed == true:
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.pressed = false
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.pressed = false
func _on_Comprar_pressed():
	# essas linhas podem mudar depois para auxiliar no processo da mochila (criar variável "TemAvatar1" pra deixar na mochila e ele poder trocar de personagem a qualquer momento)
	if $Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.pressed == true:
		Global.select = 1 
		Global.dinheiro -= 100
		Global.Gastos_LojaDeItens.append(-100)
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_1.visible = false
	
	if $Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.pressed == true:
		Global.select = 2
		Global.dinheiro -= 100
		Global.Gastos_LojaDeItens.append(-100)
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_2.visible = false
	
	if $Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.pressed == true:
		Global.select = 3
		Global.dinheiro -= 100
		Global.Gastos_LojaDeItens.append(-100)
		$Camera2D/Falas/Nin_YangFalas/Avatares/Avatar_3.visible = false



func _on_IniciarJogoDeVerdade_body_entered(body):
	get_tree().change_scene("res://Minigames/taxiGame/WorldTaxi.tscn")
