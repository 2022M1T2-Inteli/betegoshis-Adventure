extends Node2D

signal obstacle_created(obs)

onready var timer = $Timer

var Obstacle = preload("res://FlapCoin/Flapobstacle.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	spam_obstacle()
	
func spam_obstacle():
	var obstacle = Obstacle.instance()
	add_child(obstacle)
	#Get a random number between 150-350
	obstacle.position.y = randi()%200 + 150
	emit_signal("obstacle_created", obstacle)

func start():
	timer.start()
	
func stop():
	timer.stop()
