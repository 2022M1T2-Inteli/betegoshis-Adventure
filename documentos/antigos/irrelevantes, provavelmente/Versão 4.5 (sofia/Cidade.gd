extends Node2D



var contadorAreaInicioAula = 0
func _on_InicioAula1_body_entered(_body):
	contadorAreaInicioAula += 1
	if contadorAreaInicioAula == 1: #na primeira vez que passa pela porta
		yield(get_tree().create_timer(1.56), "timeout") #espera 1 segundo
		$Professora/Balaozinho.visible = true #o painel com o balaozinho de fala da professora aparece
		$Professora/Balaozinho/TextoDaProfessora.visible = true #o texto do balaozinho aparece
		yield(get_tree().create_timer(2), "timeout") #espera 2 segundos
		$Professora/Balaozinho/TextoDaProfessora.text = "Começaremos com uma mini-aula para você entender um pouco sobre matemática financeira" #altera o texto do balaozinho
		yield(get_tree().create_timer(3), "timeout") #espera 3 segundos
		$Professora/Balaozinho/TextoDaProfessora.text = "Clique em mim para começá-la." #altera novamente o texto do balaozinho
		$"Professora/Professora(botao)".visible = true #aparece o Botão da Professora para a aula começar
	if contadorAreaInicioAula >= 2:
		pass

#get.tree().on_IniciarAula_pressed():
func _process(delta): #Botão da professora
	if Global.comecarAulaUm == true:
		Global.comecarAulaUm = false
		$"Professora/Professora(botao)".visible = false #O botao da professora desaparece
		$"Aula 1".visible = true #o Painel da aula 1 aparece
		$"Aula 1/MatemáticaFinanceira".visible = true #o primeiro slide aparece
		$"Aula 1/NextButton".visible = true #aparece o botao de "próximo slide" na tela
		$"Aula 1/Nextbuttonimg".visible = true #aparece a imagem do botao de proximo slide
		$KinematicBody2D2/Camera2D/Controles.visible = false #os controles desaparecem
		$Professora/Balaozinho.visible = false #o painel do balaozinho desaparece
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
		$KinematicBody2D2/Camera2D/Controles.visible = true #o controle reaparece
		yield(get_tree().create_timer(1), "timeout") #espera 1 segundo
		$Professora/Balaozinho.visible = true #aparece o painel com o balaozinho
		$Professora/Balaozinho/TextoDaProfessora.text = "É isso por hoje, algumas aulas terão aprimoramentos no assunto, quando houver, avisar-lhe-ei." #muda o texto do balaozinho
		yield(get_tree().create_timer(3), "timeout") #espera 3 segundos
		$Professora/Balaozinho/TextoDaProfessora.text = "Clique em mim para se aprofundar" #muda o texto do balaozinho
		
		
		

		



