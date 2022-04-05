extends Node2D




func _process(_delta): #Botão da professora
	if Global.comecarAulaUm == true:
		Global.comecarAulaUm = false
		$"Aula 1 Gastos diarios".visible = true
		$"Aula 1 Gastos diarios/Parte 1 Gastos Diarios/AnimationPlayer".play("pop up")
		$"Aula 1 Gastos diarios/Parte 1 Gastos Diarios".visible = true
		$"Aula 1 Gastos diarios/NextButton".visible = true
		$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = false
		$KinematicBody2D2/Camera2D/Celular/AbrirCelular.visible = false
	
	
	$Tempo/Horas.text = str(Global.hora) + "h " + str(Global.minuto) + "min"
	$Tempo/Dias.text = str(Global.dia) + "d"
	
	# Senhor do tempo
	Global.sent += _delta
	if Global.sent >= 0.5:
		Global.minuto += 1
		Global.sent = 0
	if Global.minuto == 60:
		Global.hora += 1
		Global.minuto = 0
	if Global.hora == 24:
		Global.dia += 1
		Global.hora = 0 
	

var contadorNextButton = 0
func _on_NextButton_pressed():
	contadorNextButton += 1
	if contadorNextButton == 1:
		$"Aula 1 Gastos diarios/NextButton".visible = true
		$"Aula 1 Gastos diarios/Parte 1 Gastos Diarios".visible = false
		$"Aula 1 Gastos diarios/Parte 2 CDMaximo".visible = true
	if contadorNextButton == 2:
		$"Aula 1 Gastos diarios/Parte 3 Exemplo CDMax".visible = true
		$"Aula 1 Gastos diarios/Parte 2 CDMaximo".visible = false
	if contadorNextButton == 3:
		$"Aula 1 Gastos diarios/Parte 3 Exemplo CDMax".visible = false
		$"Aula 1 Gastos diarios/Parte 4 CDMinimo".visible = true
	if contadorNextButton == 4:
		$"Aula 1 Gastos diarios/Parte 4 CDMinimo".visible = false
		$"Aula 1 Gastos diarios/Parte 5 Exemplo CDMin".visible = true
	if contadorNextButton == 5:
		$"Aula 1 Gastos diarios/Parte 5 Exemplo CDMin".visible = false
		$"Aula 1 Gastos diarios".visible = false
		
		$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = true
		$KinematicBody2D2/Camera2D/Celular/AbrirCelular.visible = true
		
		Global.ComecarFala_Da_ProfAula1 = true
		Global.objetivo4 = true
		yield(get_tree().create_timer(0.5), "timeout")
		$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas.visible = true
		$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/FalaProfessora.text = "É isso por hoje, algumas aulas terão aprimoramentos no assunto, quando houver, eu irei lhe avisar"
		$KinematicBody2D2/Camera2D/Falas/ProfessoraFalas/ProfFalasButton.visible = true


# Coisas relacionadas a Avisos de Orientação ao jogador
func _on_Aviso_Quarto_body_entered(_body): # Se ele tentar sair do quarto por onde poderia haver uma porta:
	$KinematicBody2D2/Camera2D/Dinheiro/Popups/Orientacoes/AvisoAoSairDoQuarto.visible = true
	yield(get_tree().create_timer(1.7), "timeout")
	$KinematicBody2D2/Camera2D/Dinheiro/Popups/Orientacoes/AvisoAoSairDoQuarto.visible = false


