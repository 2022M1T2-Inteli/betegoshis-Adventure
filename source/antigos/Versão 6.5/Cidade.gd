extends Node2D

# Quando o jogo começa, as animações das exclamações acima dos personagens começam
func _ready():
	$ClovisTio/Exclamacao/AnimationPlayer.play("cimabaixo")
	$vo/ExclamacaoVo/AnimationPlayer.play("PulaPula")
	$Areas2D_e_NPC/BodysContaienr/GuilhermeBanquista/ExclamacaoGui/AnimationPlayer.play("PulaPula")
	$Areas2D_e_NPC/BodysContaienr/SecretariaAndando/ExclamacaoSecr/AnimationPlayer.play("PulaPula")
	

func _process(_delta): 
	# Quando ele pode ter a aula (clicou em "Começar aula") existe um início de aula diferente para cada dia
	
	# Dia 1 [Aula 01] (Matemática financeira e Gastos Diários)
	if Global.dia == 1 and Global.comecarAula == true:
		Global.comecarAula = false
		$"Aulas/Aula 1 Gastos diarios".visible = true
		$"Aulas/Aula 1 Gastos diarios/Aula_1".texture = aula1[1]
		$"Aulas/Aula 1 Gastos diarios/Aula_1/AnimationPlayer".play("pop up")
		$Aulas/BotaoProximoSlide.visible = true
		get_node("KinematicBody2D2").desligarCelularControle(false)
	
	# Dia 2 [Aula 2] (Inflação)
	if Global.dia == 2 and Global.comecarAula == true:
		Global.comecarAula = false
		$"Aulas/Aula 2 Inflacao".visible = true
		$"Aulas/Aula 2 Inflacao/Aula_2".texture = aula2[1]
		$"Aulas/Aula 2 Inflacao/Aula_2/AnimationPlayer".play("pop up")
		$Aulas/BotaoProximoSlide.visible = true
		get_node("KinematicBody2D2").desligarCelularControle(false)
	
	# Dia 3 [Aula 3] (Perfis de Investidor)
	if Global.dia == 3 and Global.comecarAula == true:
		Global.comecarAula = false
		$"Aulas/Aula 3 Perfis de Investidor".visible = true
		$"Aulas/Aula 3 Perfis de Investidor/Aula_3".texture = aula3[1]
		$"Aulas/Aula 3 Perfis de Investidor/Aula_3/AnimationPlayer".play("pop up")
		$Aulas/BotaoProximoSlide.visible = true
	
	# Dia 4 [Aula 4] (Renda Fixa)
	if Global.dia == 4 and Global.comecarAula == true:
		Global.comecarAula == false
		$"Aulas/Aula 4 Renda Fixa".visible = true
		$"Aulas/Aula 4 Renda Fixa/Aula_4".texture = aula4[1]
		$"Aulas/Aula 4 Renda Fixa/Aula_4/AnimationPlayer".play("pop up")
		$Aulas/BotaoProximoSlide.visible = true
	
	# Dia 5 [Aula 5] (Renda Variável)
	if Global.dia == 5 and Global.comecarAula == true:
		Global.comecarAula == false
		$"Aulas/Aula 5 Renda Variavel".visible = true
		$"Aulas/Aula 5 Renda Variavel/Aula_5".texture = aula5[1]
		$"Aulas/Aula 5 Renda Variavel/Aula_5/AnimationPlayer".play("pop up")
		$Aulas/BotaoProximoSlide.visible = true
	
	# Dia 6 [Aula 6] (Efeito Bola de Neve)
	if Global.dia == 6 and Global.comecarAula == true:
		Global.comecarAula == false
		$"Aulas/Aula 6 Efeito Bola de Neve".visible = true
		$"Aulas/Aula 6 Efeito Bola de Neve/Aula_6".texture = aula6[1]
		$"Aulas/Aula 6 Efeito Bola de Neve/Aula_6/AnimationPlayer".play("pop up")
		$Aulas/BotaoProximoSlide.visible = true
	
	# Senhor do tempo
	$Tempo/Horas.text = "Dia " + str(Global.dia) + "  " + str(Global.hora) + "h " + str(Global.minuto) + "min" 
	if Global.Tempo == true: 
		Global.sent += _delta
		if Global.sent >= Global.VelocidadeTempo: 
			Global.minuto += 1
			Global.sent = 0
		if Global.minuto >= 60: 
			Global.hora += 1 
			Global.minuto = 0
		if Global.hora >= 24:
			Global.hora = 0
			Global.dia += 1
		if Global.hora == 23:
			Global.Tempo = false # Sugestão: para o tempo a fim de pedir para que ele chame um transporte para ir para casa
	if Global.dia == 1:
	
		if Global.objetivo2 == false and Global.hora == 8 and Global.minuto == 30 and Global.dia == 1:
			Global.Tempo = false
	
	
	# Programas para escurecer o mapa
	## Ciclo dia e noite na Cidade
	var QuadroAtual = range_lerp(Global.hora, 0, 24, 0, 24)
	$Mapa/Cidade/AnimationPlayer.play("CicloDiaNoite")
	
	## Correção da cor dos postes quando está de dia e de noite
	$Mapa/Cidade/AnimationPlayer.seek(QuadroAtual)
	if Global.hora >= 18 or Global.hora < 6:
		$Postes/Luzes.visible = true
		$Postes/Poste.modulate.r8 = 92
		$Postes/Poste.modulate.g8 = 92
		$Postes/Poste.modulate.b8 = 92
		$Postes/Plantas.modulate.r8 = 92
		$Postes/Plantas.modulate.g8 = 92
		$Postes/Plantas.modulate.b8 = 92
	if Global.hora >= 6 and Global.hora < 18:
		$Postes/Luzes.visible = false
		$Postes/Poste.modulate.r8 = 255
		$Postes/Poste.modulate.g8 = 255
		$Postes/Poste.modulate.b8 = 255
		$Postes/Plantas.modulate.r8 = 255
		$Postes/Plantas.modulate.g8 = 255
		$Postes/Plantas.modulate.b8 = 255
	#
	
	
	# Para chamar qualquer exclamação (criar "necessidade" de falar com tal personagem),
	# é só alterar as globais de cada personagem.
	if Global.ExclamacaoSecr == true:
		$Areas2D_e_NPC/BodysContaienr/SecretariaAndando/ExclamacaoSecr.visible = true
	if Global.ExclamacaoSecr == false:
		$Areas2D_e_NPC/BodysContaienr/SecretariaAndando/ExclamacaoSecr.visible = false
	
	if Global.ExclamacaoGui == true:
		$Areas2D_e_NPC/BodysContaienr/GuilhermeBanquista/ExclamacaoGui.visible = true
	if Global.ExclamacaoGui == false:
		$Areas2D_e_NPC/BodysContaienr/GuilhermeBanquista/ExclamacaoGui.visible = false
	
	if Global.ExclamacaoTio == true:
		$ClovisTio/Exclamacao.visible = true
	if Global.ExclamacaoTio == false:
		$ClovisTio/Exclamacao.visible = false
	
	if Global.ExclamacaoVo == true:
		$vo/ExclamacaoVo.visible = true
	if Global.ExclamacaoVo == false:
		$vo/ExclamacaoVo.visible = false
	
	## Dormir (escurecer e amanhecer)
	if Global.dormir == true:
		$Mapa/Casa/EscurecerAnimacao.play("Escurecer")
		Global.dormir = false
	

var totalSlides = -1
func _on_BotaoProximoSlide_pressed():
	Global.contadorBotaoAula += 1
	
	# Aula 01 (Matemática Financeira e Gastos Diários)
	if Global.dia == 1:
		totalSlides = 10
		if Global.contadorBotaoAula < (totalSlides + 1):
			$"Aulas/Aula 1 Gastos diarios/Aula_1".texture = aula1[Global.contadorBotaoAula]
			Global.passaTempo(21)
		if Global.contadorBotaoAula == (totalSlides + 1):
			$"Aulas/Aula 1 Gastos diarios".visible = false
			Global.passaTempo(11)
			
			get_node("KinematicBody2D2").desligarCelularControle(false)
			Global.ComecarFala_Da_ProfDepoisDaula = true
			yield(get_tree().create_timer(0.5), "timeout")
			Global.passaTempo(1)
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas.visible = true
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/FalaProfessora.text = "Além disso, depois de assistir às aulas, você terá que aplicar o que aprendeu, e eu vou te ajudar com isso."
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/BotaoFalasProf.visible = true
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/BotaoFalasProf.disabled = false
			$KinematicBody2D2/Camera2D/Celular/AbrirCelular/Notificacao.visible = true
			Global.contadorBotaoAula = 0
		
	# Aula 2 (Inflação)
	if Global.dia == 2:
		totalSlides = 5
		if Global.contadorBotaoAula < (totalSlides + 1):
			$"Aulas/Aula 2 Inflacao/Aula_2".texture = aula2[Global.contadorBotaoAula]
			Global.passaTempo(22)
		if Global.contadorBotaoAula == (totalSlides + 1):
			$"Aulas/Aula 2 Inflacao".visible = false
			Global.passaTempo(10)
			
			get_node("KinematicBody2D2").desligarCelularControle(false)
			
			Global.objetivo4 = true
			$KinematicBody2D2/Camera2D/Celular/AbrirCelular/Notificacao.visible = true
			yield(get_tree().create_timer(0.3), "timeout")
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas.visible = true
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/FalaProfessora.text = "a"
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/BotaoFalasProf.visible = true
	
	# Aula 3 (Perfis de investidor)
	if Global.dia == 3:
		totalSlides = 5
		if Global.contadorBotaoAula < (totalSlides + 1):
			$"Aulas/Aula 3 Perfis de Investidor/Aula_3".texture = aula3[Global.contadorBotaoAula]
			Global.passaTempo(23)
		if Global.contadorBotaoAula == (totalSlides + 1):
			$"Aulas/Aula 2 Inflacao".visible = false
			Global.passaTempo(10)
			
			get_node("KinematicBody2D2").desligarCelularControle(false)
			
			Global.contadorBotaoAula = 0
			
		
	# Aula 4 (Renda Fixa)
	if Global.dia == 4:
		pass
	
	# Aula 5 (Renda Variável)
	if Global.dia == 5:
		pass
	
	# Aula 6 (Efeito Bola de Neve)
	if Global.dia == 6:
		pass


var aula1 : Array = [0,
preload("res://aulas/aula 0 introdução/aula 0.1.png"), # 1
preload("res://aulas/aula 0 introdução/Aula 0.2.png"), # 2
preload("res://aulas/aula 0 introdução/Aula 0.3.png"), # 3
preload("res://aulas/aula 0 introdução/Aula 0.4.png"), # 4
preload("res://aulas/aula 1 gastos diários/aula 1.1.png"), # 5 
preload("res://aulas/aula 1 gastos diários/Aula 1.2.png"), # 6
preload("res://aulas/aula 1 gastos diários/Aula 1.3.png"), # 7
preload("res://aulas/aula 1 gastos diários/aula 1.4.png"), # 8
preload("res://aulas/aula 1 gastos diários/Aula 1.5.png"), # 9
preload("res://aulas/aula 1 gastos diários/Aula 1.6.png"), # 10
0]
var aula2 : Array = [0,
preload("res://aulas/aula 2 inflação/aula 2.1.png"), # 1
preload("res://aulas/aula 2 inflação/aula 2.2.png"), # 2
preload("res://aulas/aula 2 inflação/aula 2.3.png"), # 3
preload("res://aulas/aula 2 inflação/aula 2.4.png"), # 4
preload("res://aulas/aula 2 inflação/aula 2.5.png"), # 5
0]
var aula3 : Array = [0,
preload("res://aulas/aula 3 perfis de investidor/aula 3.0.png"),
preload("res://aulas/aula 3 perfis de investidor/aula 3.1.png"),
preload("res://aulas/aula 3 perfis de investidor/aula 3.2.png"),
preload("res://aulas/aula 3 perfis de investidor/aula 3.3.png"),
preload("res://aulas/aula 3 perfis de investidor/aula 3.4.png"),
preload("res://aulas/aula 3 perfis de investidor/aula 3.5.png"),
preload("res://aulas/aula 3 perfis de investidor/aula 3.6.png"),
preload("res://aulas/aula 3 perfis de investidor/aula 3.7.png"),
0]
var aula4 : Array = [0,
preload("res://aulas/aula 4 renda fixa/aula 4.0.png"),
preload("res://aulas/aula 4 renda fixa/aula 4.1.png"),
preload("res://aulas/aula 4 renda fixa/aula 4.2.png"),
preload("res://aulas/aula 4 renda fixa/aula 4.3.png"),
preload("res://aulas/aula 4 renda fixa/aula 4.4.png"),
preload("res://aulas/aula 4 renda fixa/aula 4.5.png"),
preload("res://aulas/aula 4 renda fixa/aula 4.6.png"),
preload("res://aulas/aula 4 renda fixa/aula 4.7.png"),
0]
var aula5 : Array = [0,
preload("res://aulas/aula 5 reda variável/aula 5.0.png"),
preload("res://aulas/aula 5 reda variável/aula 5.1.png"),
preload("res://aulas/aula 5 reda variável/aula 5.2.png"),
preload("res://aulas/aula 5 reda variável/aula 5.3.png"),
preload("res://aulas/aula 5 reda variável/aula 5.4.png"),
preload("res://aulas/aula 5 reda variável/aula 5.5.png"),
preload("res://aulas/aula 5 reda variável/aula 5.6.png"),
preload("res://aulas/aula 5 reda variável/aula 5.7.png"),
0]
var aula6 : Array = [0,
preload("res://aulas/aula 6 efeito bola de neve/aula 6.0.png"),
preload("res://aulas/aula 6 efeito bola de neve/aula 6.1.png"),
preload("res://aulas/aula 6 efeito bola de neve/aula 6.2.png"),
preload("res://aulas/aula 6 efeito bola de neve/aula 6.3.png"),
0]
var fimdasAulas = preload("res://aulas/fim (férias).png")

# Coisas relacionadas a Avisos de Orientação ao jogador
#func _on_Aviso_Quarto_body_entered(_body): # Se ele tentar sair do quarto por onde poderia haver uma porta:
#	$KinematicBody2D2/Camera2D/Dinheiro/Popups/Orientacoes/AvisoAoSairDoQuarto.visible = true
#	yield(get_tree().create_timer(1.7), "timeout")
#	$KinematicBody2D2/Camera2D/Dinheiro/Popups/Orientacoes/AvisoAoSairDoQuarto.visible = false

