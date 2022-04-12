extends Node2D


# Declare member variables here. Exampl


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Cidade.tscn")
	print(position)
