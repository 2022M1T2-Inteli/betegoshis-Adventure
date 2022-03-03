extends Node2D


func _ready():
	print("Hello world")


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Cidade.tscn")

var contadorAreaInicioAula = 0
func _on_Area2D2_body_entered(body):
	contadorAreaInicioAula += 1
	if contadorAreaInicioAula == 1:
		yield(get_tree().create_timer(1), "timeout") #espera 1 segundo
		$Balaozinho.visible = true #o painel com o balaozinho de fala da professora aparece
		$Balaozinho/TextoDaProfessora.visible = true #o texto do balaozinho aparece
		yield(get_tree().create_timer(2), "timeout") #espera 2 segundos
		$Balaozinho/TextoDaProfessora.text = "Começaremos com uma mini-aula para você entender um pouco sobre matemática financeira" #altera o texto do balaozinho
		yield(get_tree().create_timer(3), "timeout") #espera 3 segundos
		$Balaozinho/TextoDaProfessora.text = "Clique em mim para começá-la." #altera novamente o texto do balaozinho
		$"Professora/Professora(botao)".visible = true #aparece o Botão da Professora para a aula começar
	if contadorAreaInicioAula == 2:
		pass

func _on_Professorabotao_pressed(): #Botão da professora
	$"Professora/Professora(botao)".visible = false #O botao da professora desaparece
	$"Aula 1".visible = true #o Painel da aula 1 aparece
	$"Aula 1/MatemáticaFinanceira".visible = true #o primeiro slide aparece
	$"Aula 1/Button".visible = true #aparece o botao de "próximo slide" na tela
	$Balaozinho.visible = false #o painel do balaozinho desaparece
	$"Aula 1/MatemáticaFinanceira/AnimationPlayer".play("pop up") #animação do slide aparecendo



var contadorBotaoProximo = 0 
func _on_Button_pressed(): # Botão de "próximo" na primeira aula
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
		yield(get_tree().create_timer(1), "timeout") #espera 1 segundo
		$Balaozinho.visible = true #aparece o painel com o balaozinho
		$Balaozinho/TextoDaProfessora.text = "É isso, se você quiser se aprofundar no assunto, é só falar comigo" #muda o texto do balaozinho
		yield(get_tree().create_timer(4), "timeout") #espera 4 segundos
		$Balaozinho/TextoDaProfessora.text = "Clique em mim para se aprofundar" #muda o texto do balaozinho



