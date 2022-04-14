extends Control

# -------- Display score value in game
func _process(delta):
	$cash.text = "Cash :" + str(Global.score)

# ------------ Switch to the store scene
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://game.tscn")
	
