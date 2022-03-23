extends MarginContainer


func _on_Button1_pressed():
	get_tree().change_scene("res://Cidade.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Node2D.tscn")


func _on_Button3_pressed():
	get_tree().quit()
