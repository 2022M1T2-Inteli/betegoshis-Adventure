extends KinematicBody2D



func _on_Area2D_body_entered(body):
	$Sprite.texture = load("res://balao de fala.png")
	$AnimationPlayer.play("pop ")
	print("abcd")
