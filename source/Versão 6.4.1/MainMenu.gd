extends CanvasLayer


func _on_IniciarButton_pressed():
	$Menuiniciar.visible = false
	$ColocarNome.visible = true


func _on_ConfiguracoesButton_pressed():
	$Configuracoes.visible = true
func _on_SaveButton_pressed():
	$Configuracoes.visible = false

func _on_SairButton_pressed():
	get_tree().quit()

func _on_BotaoSeta_pressed():
	$ColocarNome.visible = false
	$SelecionarPersonagem.visible = true
	Global.nome_jogador = str($ColocarNome/BalaoNome/LineEdit.text)

var soundoff_buttons = preload("res://images/buttons/audioOff.png")
var soundon_buttons = preload("res://images/buttons/audioOn.png")
var musicon_buttons = preload("res://images/buttons/musicOn.png")
var musicoff_buttons = preload("res://images/buttons/musicOff.png")
var sound = true
var music = true

func _on_SoundButton_pressed():
	if sound:
		sound = false
		$Configuracoes/SoundButton.texture_normal = soundoff_buttons
	else:
		sound = true
		$Configuracoes/SoundButton.texture_normal = soundon_buttons

var contadorAlternarMusica = 0
func _on_MusicButton_pressed():
	contadorAlternarMusica += 1
	if contadorAlternarMusica % 2 == 1:
		$AudioStreamPlayer.stream_paused = true
	if contadorAlternarMusica % 2 == 0:
		$AudioStreamPlayer.stream_paused = false
	
	if music:
		music = false
		$Configuracoes/MusicButton.texture_normal = musicoff_buttons
	else:
		music = true
		$Configuracoes/MusicButton.texture_normal = musicon_buttons




func _on_Avatar_1_pressed():
	Global.select = 1

func _on_Avatar_2_pressed():
	Global.select = 2

func _on_Avatar_3_pressed():
	Global.select = 3


func _on_ComecarOGame_pressed():
	get_tree().change_scene("res://Cidade.tscn")
