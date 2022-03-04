extends Control

func _ready():
	$Fundo/AnimationPlayer.play("gif fundo")

func _on_Sair_pressed():
	get_tree().quit()

var START_GAME = false
var START_EMAIL = false
func _on_Iniciar_pressed():
	START_EMAIL = true
	$Config/Emailimg.visible = true
	if START_GAME == true:
		get_tree().change_scene("res://Cidade.tscn")


var closeIPAD = false #ordena a sequência
func _on_Config_pressed(): #apertar o botão de celular
	if START_EMAIL == true:
		$Config/iPad.visible = true #aparece o IPAD
		$Config/Emailimg.visible = false
		START_GAME = true

func _on_CloseiPad_pressed():
	closeIPAD = true
	yield(get_tree().create_timer(.3), "timeout")
	closeIPAD = false

func _process(_delta):
	if closeIPAD == true:
		$Config/iPad.visible = false
