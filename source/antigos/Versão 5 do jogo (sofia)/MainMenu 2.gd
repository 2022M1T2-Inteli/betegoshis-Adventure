extends CanvasLayer


func _on_IniciarButton_pressed():
	get_tree().change_scene("res://Cidade.tscn")


func _on_ConfiguracoesButton_pressed():
	get_tree().change_scene("res://Node2D.tscn")


func _on_SairButton_pressed():
	get_tree().quit()

var contadorAlternarMusica = 0
func _on_AlternarMusica_pressed():
	contadorAlternarMusica += 1
	if contadorAlternarMusica % 2 == 1:
		$AudioStreamPlayer.stream_paused = true
	if contadorAlternarMusica % 2 == 0:
		$AudioStreamPlayer.stream_paused = false
