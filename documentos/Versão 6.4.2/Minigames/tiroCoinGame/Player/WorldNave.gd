extends Node2D

var Lazer = preload("res://Minigames/tiroCoinGame/projéteis/PlayerLaser.tscn")


func _on_Player_spawn_laser(location):
	var l = Lazer.instance()
	l.global_position = location
	add_child(l)

func _process(_delta):
	$Pontuacao.text = "SCORE" + str(Global.pontuacaoNave)
