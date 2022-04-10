extends Node2D

var sent = 0 
var segundo = 0

func _ready():
	$SetaD/ClicaGif.play("AquiClica")
	yield(get_tree().create_timer(2.0), "timeout")
	$SetaD.visible = false
	$SetaE.visible = false

func _process(_delta):
	$Tempo.text = str(segundo) + "/" + str(Global.Taxi_totalTempo)
	#
	sent += _delta
	if sent >= 1:
		segundo += 1
		sent = 0
	#
	if segundo == Global.Taxi_totalTempo:
		yield(get_tree().create_timer(0.4), "timeout")
		get_tree().change_scene("res://Cidade.tscn")
		Global.Jogo_taxi = true
		
		Global.dinheiro += 10
		Global.Gastos_arcade.append(+10)
	#
