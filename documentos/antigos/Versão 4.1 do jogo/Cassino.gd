extends Node2D


# Declare member variables here. Exampl


func _on_Area2D_body_entered(_body):
	get_tree().change_scene("res://Cidade.tscn")
	yield(get_tree().create_timer(3), "timeout")
	self.position.x = 4638
	self.position.y = 676
