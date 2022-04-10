extends Node2D

signal obstacle_created(obs)

onready var temporizador = $Timer

var Obstaculo = preload("res://Minigames/flappyCoinGame/environment/obstacle.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	spam_obstacle()
	
func spam_obstacle():
	var obstaculo = Obstaculo.instance()
	add_child(obstaculo)
	#Get a random number between 150-350
	obstaculo.position.y = randi()%200 + 150
	emit_signal("obstacle_created", obstaculo)

func start():
	temporizador.start()
	
func stop():
	temporizador.stop()
