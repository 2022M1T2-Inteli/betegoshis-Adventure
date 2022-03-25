extends Control


func _process(delta):
#	$cash.text = "Cash :" + str(Global.investimentos)
	
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res:game.tscn")
		 
