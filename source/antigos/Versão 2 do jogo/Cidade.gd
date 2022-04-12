extends Node2D

func _ready():
	pass


func _on_Faculdade_TP_body_entered(body):
	yield(get_tree().create_timer(1), "timeout")
	$Panel.visible = true
	$Panel/RichTextLabel.visible = true
	yield(get_tree().create_timer(2), "timeout")
	$Panel/RichTextLabel.text = "Começaremos com uma mini-aula para você entender um pouco sobre matemática financeira"
	yield(get_tree().create_timer(3), "timeout")
	$Panel/RichTextLabel.text = "Clique em mim para começá-la."
	$"Professora/Professora(botao)".visible = true



var contadorBotaoProximo = 0
func _on_Button_pressed():
	contadorBotaoProximo += 1
	if contadorBotaoProximo == 1:
		$"Aula 1/MatemáticaFinanceira".visible = false
		$"Aula 1/GastosDiários".visible = true
	if contadorBotaoProximo == 2:
		$"Aula 1/GastosDiários".visible = false
		$"Aula 1/CustoDiário".visible = true
	if contadorBotaoProximo == 3:
		$"Aula 1/CustoDiário".visible = false
		$"Aula 1".visible = false
		yield(get_tree().create_timer(1), "timeout")
		$Panel.visible = true
		$Panel/RichTextLabel.text = "É isso, se você quiser se aprofundar no assunto, é só falar comigo"
		yield(get_tree().create_timer(4), "timeout")
		$Panel/RichTextLabel.text = "Clique em mim para se aprofundar"

func _on_Professorabotao_pressed():
	$"Aula 1".visible = true
	$"Aula 1/MatemáticaFinanceira".visible = true
	$"Aula 1/Button".visible = true
	$Panel.visible = false
	$"Aula 1/MatemáticaFinanceira/AnimationPlayer".play("pop up")
