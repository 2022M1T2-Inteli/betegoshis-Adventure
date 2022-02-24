extends KinematicBody2D



func _on_Area2D_body_entered(_body):
	$"BalaoDeFala".texture = load("res://balao de fala.png")
	$Panel.play("pop up")
	print("abcd")
