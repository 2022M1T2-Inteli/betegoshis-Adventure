extends Node2D

func _ready():
	$"Tela de Carregamento 1/AnimationPlayer".play("tela de carregamento") #anima a a tela de carregamento
	yield(get_tree().create_timer(2.6), "timeout") #espera 2.6 segundos
	$"Tela de Carregamento 1".visible = false #desaparece ela




func _process(_delta): #Botão da professora
	if Global.comecarAulaUm == true:
		Global.comecarAulaUm = false
		$"Aula 1 Gastos diarios".visible = true
		$"Aula 1 Gastos diarios/Parte 1 Gastos Diarios/AnimationPlayer".play("pop up")
		$"Aula 1 Gastos diarios/Parte 1 Gastos Diarios".visible = true
		$"Aula 1 Gastos diarios/NextButton".visible = true
		$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = false
		$KinematicBody2D2/Camera2D/Celular/AbrirCelular.visible = false

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
		$"Aula 1 Gastos diarios".visible = true
		
		$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = true
		$KinematicBody2D2/Camera2D/Celular/AbrirCelular.visible = true
		
		Global.ComecarFala_Da_ProfAula1 = true
		Global.objetivo4 = true
		$KinematicBody2D2/Camera2D/Celular/AbrirCelular/Notificacao.visible = true
		yield(get_tree().create_timer(0.5), "timeout")
		$Camera2D/Falas/ProfessoraFalas.visible = true
		$Camera2D/Falas/ProfessoraFalas/FalaProfessora.text = "É isso por hoje, algumas aulas terão aprimoramentos no assunto, quando houver, eu irei lhe avisar"
		$Camera2D/Falas/ProfessoraFalas/ProfFalasButton.visible = true


# Coisas relacionadas a Avisos de Orientação ao jogador
func _on_Aviso_Quarto_body_entered(body): # Se ele tentar sair do quarto por onde poderia haver uma porta:
	$KinematicBody2D2/Camera2D/Dinheiro/Popups/Orientacoes/AvisoAoSairDoQuarto.visible = true
	yield(get_tree().create_timer(1), "timeout")
	$KinematicBody2D2/Camera2D/Dinheiro/Popups/Orientacoes/AvisoAoSairDoQuarto.visible = false


