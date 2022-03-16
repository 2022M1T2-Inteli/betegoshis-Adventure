extends Node2D

func _ready():
	$"Tela de Carregamento 1/AnimationPlayer".play("tela de carregamento") #anima a a tela de carregamento
	yield(get_tree().create_timer(2.6), "timeout") #espera 2.6 segundos
	$"Tela de Carregamento 1".visible = false #desaparece ela
	


func _process(delta): #Botão da professora
	if Global.comecarAulaUm == true:
		Global.comecarAulaUm = false
		$"Professora/Professora(botao)".visible = false #O botao da professora desaparece
		$"Aula 1".visible = true #o Painel da aula 1 aparece
		$"Aula 1/MatemáticaFinanceira".visible = true #o primeiro slide aparece
		$"Aula 1/NextButton".visible = true #aparece o botao de "próximo slide" na tela
		$"Aula 1/Nextbuttonimg".visible = true #aparece a imagem do botao de proximo slide
		$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = false #os controles desaparecem
		$"Aula 1/MatemáticaFinanceira/AnimationPlayer".play("pop up") #animação do slide aparecendo
		


var contadorBotaoProximo = 0 
func _on_NextButton_pressed(): # Botão de "próximo" na primeira aula
	contadorBotaoProximo += 1 # Ordena a quantidade de vezes que o botão é apertado
	if contadorBotaoProximo == 1: #Na primeira vez que se aperta
		$"Aula 1/MatemáticaFinanceira".visible = false #O primeiro slide some
		$"Aula 1/GastosDiários".visible = true #Aparece o segundo slide
	if contadorBotaoProximo == 2: #Na segunda vez que se aperta
		$"Aula 1/GastosDiários".visible = false #O segundo slide desaparece
		$"Aula 1/CustoDiárioMínimo".visible = true #O terceiro slide aparece
	if contadorBotaoProximo == 3: #Na terceira vez que se aperta
		$"Aula 1/CustoDiárioMínimo".visible = false #O terceiro slide desaparece
		$"Aula 1/CustoDiárioMáximo".visible = true #O quarto slide aparece
	if contadorBotaoProximo == 4: #Na quarta vez que se aperta
		$"Aula 1/CustoDiárioMáximo".visible = false #O quarto slide desaparece
		$"Aula 1".visible = false #O Painel de aula desaparece
		$KinematicBody2D2/Camera2D/Controles/Controlesorg.visible = true
		Global.ComecarFala_Da_ProfAula1 = true #o controle reaparece
#		

