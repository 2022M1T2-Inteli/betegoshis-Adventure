extends Node2D




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
	$Tempo/Horas.text = str(Global.hora) + "h " + str(Global.minuto) + "min"
	$Tempo/Dias.text = str(Global.dia) + "d"
	if Global.Tempo == true: # se o tempo está rodando
		Global.sent += _delta # soma um valor rapidamente 
		if Global.sent >= 0.5: # depois de 1 segundo 
			Global.minuto += 1 # soma um minuto no jogo
			Global.sent = 0
		if Global.minuto >= 60: # depois de 60 minutos no jogo
			Global.hora += 1 # soma uma hora
			Global.minuto = 0
		if Global.hora >= 24: # depois de 24 horas no jogo
			Global.dia += 1 # soma um dia
			Global.hora = 0 
		if Global.hora == 23: # quando a hora é exatamente 23h
			Global.Tempo = false # para o tempo a fim de pedir para que ele chame um transporte para ir para casa
	

var contadorNextButton = 0
func _on_NextButton_pressed():
	contadorNextButton += 1
	if Global.dia == 1:
		if contadorNextButton == 1:
			$"Aulas/Aula 0 Introducao/Parte 1 Intro".visible = false
			$"Aulas/Aula 0 Introducao/Parte 2 What".visible = true
		if contadorNextButton == 2:
			$"Aulas/Aula 0 Introducao/Parte 2 What".visible = false
			$"Aulas/Aula 0 Introducao/Parte 3 Significado".visible = true
		if contadorNextButton == 3:
			$"Aulas/Aula 0 Introducao/Parte 3 Significado".visible = false
			$"Aulas/Aula 0 Introducao/Parte 4 Engloba".visible = true
		if contadorNextButton == 4:
			$"Aulas/Aula 0 Introducao/Parte 4 Engloba".visible = false
			$"Aulas/Aula 0 Introducao".visible = false
			$Aulas/NextButton.visible = false
			
			
			$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = true
			$KinematicBody2D2/Camera2D/Celular/AbrirCelular.visible = true
			Global.ComecarFala_Da_ProfDepoisDaula = true
			yield(get_tree().create_timer(0.5), "timeout")
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas.visible = true
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/FalaProfessora.text = "Além disso, depois de assistir às aulas, você terá que aplicar o que aprendeu, e eu vou te ajudar com isso."
			$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/ProfFalasButton.visible = true
			
		
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
func _on_Aviso_Quarto_body_entered(_body): # Se ele tentar sair do quarto por onde poderia haver uma porta:
	$KinematicBody2D2/Camera2D/Dinheiro/Popups/Orientacoes/AvisoAoSairDoQuarto.visible = true
	yield(get_tree().create_timer(1.7), "timeout")
	$KinematicBody2D2/Camera2D/Dinheiro/Popups/Orientacoes/AvisoAoSairDoQuarto.visible = false



