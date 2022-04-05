extends Node2D

var Lazer = preload("res://TiroCoin/projectiles/PlayerLaser.tscn")

var score = 0

func _on_Player_spawn_laser(location):
	var l = Lazer.instance()
	l.global_position = location
	add_child(l)

func _Score():
	score += 10
	$Score.text = "SCORE" + str(score)
