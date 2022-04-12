extends Node2D


func _ready():
	$ClovisTio/Exclamacao/AnimationPlayer.play("cimabaixo")

func _process(_delta): #Botão da professora
	if Global.dia == 1 and Global.comecarAula == true:
		Global.comecarAula = false
		$"Aulas/Aula 0 Introducao".visible = true
		$"Aulas/Aula 0 Introducao/Parte 1 Intro/AnimationPlayer".play("pop up")
		$"Aulas/Aula 0 Introducao/Parte 1 Intro".visible = true
		$Aulas/NextButton.visible = true
		$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = false
		$KinematicBody2D2/Camera2D/Celular/AbrirCelular.visible = false
	
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
	if Global.Tempo == true: # se o tempo está rodando
		Global.sent += _delta # soma um valor rapidamente 
		if Global.sent >= Global.TimeVelocity: # depois de 2 ; 5 ; 6 ; 8
			Global.minuto += 1 # soma um minuto no jogo
			Global.sent = 0
		if Global.minuto >= 60: # depois de 60 minutos no jogo
			Global.hora += 1 # soma uma hora no jogo
			Global.minuto = 0
		if Global.hora >= 24:
			Global.hora = 0
			Global.dia += 1
		if Global.hora == 23: # quando a hora é exatamente 23h
			Global.Tempo = false # para o tempo a fim de pedir para que ele chame um transporte para ir para casa
	if Global.dia == 1:
		if Global.F1_objetivo2 == false and Global.hora == 8 and Global.minuto == 30:
			Global.Tempo = false
	
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
	
	
	# Programas para escurecer o mapa
	## Ciclo dia e noite na Cidade
	var CurrentFrame = range_lerp(Global.hora, 0, 24, 0, 24)
	$Mapa/Cidade/AnimationPlayer.play("CicloDiaNoite")
	$Mapa/Cidade/AnimationPlayer.seek(CurrentFrame)
	
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
	if Global.F1_objetivo8 == true:
		$Mapa/Casa/EscurecerAnimacao.play("Escurecer")
	

var contadorNextButton = 0
func _on_NextButton_pressed():
	contadorNextButton += 1
	if Global.dia == 1:
		if contadorNextButton == 1:
			$"Aulas/Aula 0 Introducao/Parte 1 Intro".visible = false
			$"Aulas/Aula 0 Introducao/Parte 2 What".visible = true
			Global.passaTempo(20)
		if contadorNextButton == 2:
			$"Aulas/Aula 0 Introducao/Parte 2 What".visible = false
			$"Aulas/Aula 0 Introducao/Parte 3 Significado".visible = true
			Global.passaTempo(20)
		if contadorNextButton == 3:
			$"Aulas/Aula 0 Introducao/Parte 3 Significado".visible = false
			$"Aulas/Aula 0 Introducao/Parte 4 Engloba".visible = true
			Global.passaTempo(20)
		if contadorNextButton == 4:
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
		if contadorNextButton == 5:
			$"Aulas/Aula 1 Gastos diarios/Parte 1 Gastos Diarios".visible = false
			$"Aulas/Aula 1 Gastos diarios/Parte 2 CDMaximo".visible = true
		if contadorNextButton == 6:
			$"Aulas/Aula 1 Gastos diarios/Parte 2 CDMaximo".visible = false
			$"Aulas/Aula 1 Gastos diarios/Parte 3 Exemplo CDMax".visible = true
		if contadorNextButton == 7:
			$"Aulas/Aula 1 Gastos diarios/Parte 3 Exemplo CDMax".visible = false
			$"Aulas/Aula 1 Gastos diarios/Parte 4 ConclusaoCDMax".visible = true
		if contadorNextButton == 8:
			$"Aulas/Aula 1 Gastos diarios/Parte 4 ConclusaoCDMax".visible = false
			$"Aulas/Aula 1 Gastos diarios/Parte 5 CDMinimo".visible = true
		if contadorNextButton == 9:
			$"Aulas/Aula 1 Gastos diarios/Parte 5 CDMinimo".visible = false
			$"Aulas/Aula 1 Gastos diarios/Parte 6 Exemplo CDMin".visible = true
		if contadorNextButton == 10:
			$"Aulas/Aula 1 Gastos diarios/Parte 6 Exemplo CDMin".visible = false
			$"Aula 1 Gastos diarios".visible = false
			$Aulas/NextButton.visible = false
			
			$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = true
			$KinematicBody2D2/Camera2D/Celular/AbrirCelular.visible = true
			
			Global.ComecarFala_Da_ProfDepoisDaula = true
			Global.objetivo4 = true
			$KinematicBody2D2/Camera2D/Celular/AbrirCelular/Notificacao.visible = true
			yield(get_tree().create_timer(0.5), "timeout")
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas.visible = true
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/FalaProfessora.text = "É isso por hoje, algumas aulas terão aprimoramentos no assunto, quando houver, eu irei lhe avisar"
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/ProfFalasButton.visible = true
	if Global.dia == 3:
		pass
	


# Coisas relacionadas a Avisos de Orientação ao jogador
#func _on_Aviso_Quarto_body_entered(_body): # Se ele tentar sair do quarto por onde poderia haver uma porta:
#	$KinematicBody2D2/Camera2D/Dinheiro/Popups/Orientacoes/AvisoAoSairDoQuarto.visible = true
#	yield(get_tree().create_timer(1.7), "timeout")
#	$KinematicBody2D2/Camera2D/Dinheiro/Popups/Orientacoes/AvisoAoSairDoQuarto.visible = false

