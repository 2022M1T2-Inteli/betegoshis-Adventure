extends Node2D

func _process(delta):
	# --------- Display score
	$Label.text = str(Global.score)
	# ----- Switch scenes
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://store.tscn")


func add_score():
	Global.score += 10
