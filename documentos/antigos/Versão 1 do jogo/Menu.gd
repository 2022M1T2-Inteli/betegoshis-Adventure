extends Control





func _on_Sair_pressed():
	get_tree().quit()



func _on_Iniciar_pressed():
	get_tree().change_scene("res://Cidade.tscn")
