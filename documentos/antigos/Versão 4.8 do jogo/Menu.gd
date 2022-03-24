extends Control

func _ready(): #inicia o jogo
	$Fundo/AnimationPlayer.play("gif fundo") #anima o fundo

var START_GAME = false
var START_EMAIL = false
func _on_Iniciar_pressed(): # aperta o start button 
	START_EMAIL = true # permite clicar no ipad
	$Config/Emailimg.visible = true # aparece o emailzinho
	if START_GAME == true: # se apertar no ipad
		get_tree().change_scene("res://Cidade.tscn") # muda cena



func _on_Config_pressed(): # apertar o botão de celular
	if START_EMAIL == true: # se ele apertou o inicio pela primeira vez
		$Config/iPad.visible = true # aparece o IPAD 
		$Config/Emailimg.visible = false # desaparece o emailzinho
		START_GAME = true # permite iniciar o jogo

func _on_CloseiPad_pressed(): # clica no botao de fechar
	$Config/iPad.visible = false # desaparece o ipad

