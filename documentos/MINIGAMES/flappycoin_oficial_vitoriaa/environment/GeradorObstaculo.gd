extends Node2D

signal criar_obstaculo (obs)

onready var timer = $Timer

var Obstaculo = preload("res://environment/obstaculo.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	criar_obstaculo()
	
func criar_obstaculo():
	var obstaculo = Obstaculo.instance()
	add_child(obstaculo)
	#Get a random number between 150-350
	obstaculo.position.y = randi()%200 + 150
	emit_signal("criar_obstaculo", obstaculo)

func start():
	timer.start()
	
func stop():
	timer.stop()
