extends Node2D

# Quando o jogo começa, as animações das exclamações acima dos personagens começam
func _ready():
	$ClovisTio/Exclamacao/AnimationPlayer.play("cimabaixo")
	$vo/ExclamacaoVo/AnimationPlayer.play("PulaPula")
	$Areas2D_e_NPC/BodysContaienr/GuilhermeBanquista/ExclamacaoGui/AnimationPlayer.play("PulaPula")
	$Areas2D_e_NPC/BodysContaienr/SecretariaAndando/ExclamacaoSecr/AnimationPlayer.play("PulaPula")
	

func _process(_delta): 
	# Quando ele pode ter a aula (clicou em "Começar aula") existe um início de aula diferente para cada dia
	
	# Dia 1 [Aula 0] (Matemática financeira)
	if Global.dia == 1 and Global.comecarAula == true:
		Global.comecarAula = false
		$"Aulas/Aula 0 Introducao".visible = true
		$"Aulas/Aula 0 Introducao/Parte 1 Intro/AnimationPlayer".play("pop up")
		$"Aulas/Aula 0 Introducao/Parte 1 Intro".visible = true
		$Aulas/NextButton.visible = true
		$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = false
		$KinematicBody2D2/Camera2D/Celular/AbrirCelular.visible = false
	
	# Dia 2 [Aula 1] (Gastos diários)
	if Global.dia == 2 and Global.comecarAula == true:
		Global.comecarAula = false
		$"Aulas/Aula 1 Gastos diarios".visible = true
		$"Aulas/Aula 1 Gastos diarios/Parte 1 Gastos Diarios/AnimationPlayer".play("pop up")
		$"Aulas/Aula 1 Gastos diarios/Parte 1 Gastos Diarios".visible = true
		$Aulas/NextButton.visible = true
		$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = false
		$KinematicBody2D2/Camera2D/Celular/AbrirCelular.visible = false
	
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
		if Global.F1_objetivo2 == false and Global.hora == 8 and Global.minuto == 30:
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
		$"Areas2D_e_NPC/BodysContaienr/SecretariaAndando/Exclamação".visible = true
	if Global.ExclamacaoSecr == false:
		$"Areas2D_e_NPC/BodysContaienr/SecretariaAndando/Exclamação".visible = false
	
	if Global.ExclamacaoGui == true:
		$Areas2D_e_NPC/BodysContaienr/GuilhermeBanquista/Exclamacao.visible = true
	if Global.ExclamacaoGui == false:
		$Areas2D_e_NPC/BodysContaienr/GuilhermeBanquista/Exclamacao.visible = false
	
	if Global.ExclamacaoTio == true:
		$ClovisTio/Exclamacao.visible = true
	if Global.ExclamacaoTio == false:
		$ClovisTio/Exclamacao.visible = false
	
	if Global.ExclamacaoVo == true:
		$"vo/Exclamacao".visible = true
	if Global.ExclamacaoVo == false:
		$"vo/Exclamacao".visible = false
	
	## Dormir (escurecer e amanhecer)
	if Global.Dormir == true:
		$Mapa/Casa/EscurecerAnimacao.play("Escurecer")
		Global.Dormir = false

func _on_NextButton_pressed():
	Global.contadorBotaoAula += 1
	if Global.dia == 1:
		if Global.contadorBotaoAula == 1:
			$"Aulas/Aula 0 Introducao/Parte 1 Intro".visible = false
			$"Aulas/Aula 0 Introducao/Parte 2 What".visible = true
			Global.passaTempo(20)
		if Global.contadorBotaoAula == 2:
			$"Aulas/Aula 0 Introducao/Parte 2 What".visible = false
			$"Aulas/Aula 0 Introducao/Parte 3 Significado".visible = true
			Global.passaTempo(20)
		if Global.contadorBotaoAula == 3:
			$"Aulas/Aula 0 Introducao/Parte 3 Significado".visible = false
			$"Aulas/Aula 0 Introducao/Parte 4 Engloba".visible = true
			Global.passaTempo(20)
		if Global.contadorBotaoAula == 4:
			Global.passaTempo(10)
			$"Aulas/Aula 0 Introducao/Parte 4 Engloba".visible = false
			$"Aulas/Aula 0 Introducao".visible = false
			$Aulas/NextButton.visible = false
			
			$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = true
			$KinematicBody2D2/Camera2D/Celular/AbrirCelular.visible = true
			Global.ComecarFala_Da_ProfDepoisDaula = true
			yield(get_tree().create_timer(0.5), "timeout")
			Global.passaTempo(1)
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas.visible = true
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/FalaProfessora.text = "Além disso, depois de assistir às aulas, você terá que aplicar o que aprendeu, e eu vou te ajudar com isso."
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/ProfFalasButton.visible = true
			$KinematicBody2D2/Camera2D/Celular/AbrirCelular/Notificacao.visible = true
		
	if Global.dia == 2:
		if Global.contadorBotaoAula == 5:
			$"Aulas/Aula 1 Gastos diarios/Parte 1 Gastos Diarios".visible = false
			$"Aulas/Aula 1 Gastos diarios/Parte 2 CDMaximo".visible = true
			Global.passaTempo(20)
		if Global.contadorBotaoAula == 6:
			$"Aulas/Aula 1 Gastos diarios/Parte 2 CDMaximo".visible = false
			$"Aulas/Aula 1 Gastos diarios/Parte 3 Exemplo CDMax".visible = true
			Global.passaTempo(20)
		if Global.contadorBotaoAula == 7:
			$"Aulas/Aula 1 Gastos diarios/Parte 3 Exemplo CDMax".visible = false
			$"Aulas/Aula 1 Gastos diarios/Parte 4 ConclusaoCDMax".visible = true
			Global.passaTempo(20)
		if Global.contadorBotaoAula == 8:
			$"Aulas/Aula 1 Gastos diarios/Parte 4 ConclusaoCDMax".visible = false
			$"Aulas/Aula 1 Gastos diarios/Parte 5 CDMinimo".visible = true
			Global.passaTempo(20)
		if Global.contadorBotaoAula == 9:
			$"Aulas/Aula 1 Gastos diarios/Parte 5 CDMinimo".visible = false
			$"Aulas/Aula 1 Gastos diarios/Parte 6 Exemplo CDMin".visible = true
			Global.passaTempo(20)
		if Global.contadorBotaoAula == 10:
			$"Aulas/Aula 1 Gastos diarios/Parte 6 Exemplo CDMin".visible = false
			$"Aula 1 Gastos diarios".visible = false
			$Aulas/NextButton.visible = false
			Global.passaTempo(10)
			
			$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = true
			$KinematicBody2D2/Camera2D/Celular/AbrirCelular.visible = true
			
			Global.ComecarFala_Da_ProfDepoisDaula = true
			Global.objetivo4 = true
			$KinematicBody2D2/Camera2D/Celular/AbrirCelular/Notificacao.visible = true
			yield(get_tree().create_timer(0.3), "timeout")
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas.visible = true
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/FalaProfessora.text = "a"
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/ProfFalasButton.visible = true
	if Global.dia == 3:
		pass
	


# Coisas relacionadas a Avisos de Orientação ao jogador
#func _on_Aviso_Quarto_body_entered(_body): # Se ele tentar sair do quarto por onde poderia haver uma porta:
#	$KinematicBody2D2/Camera2D/Dinheiro/Popups/Orientacoes/AvisoAoSairDoQuarto.visible = true
#	yield(get_tree().create_timer(1.7), "timeout")
#	$KinematicBody2D2/Camera2D/Dinheiro/Popups/Orientacoes/AvisoAoSairDoQuarto.visible = false

