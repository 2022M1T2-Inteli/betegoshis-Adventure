extends Node2D

var spawn_positions = null  

var Obstaculo = preload("res://obstaculo/Obstaculo.tscn")

func _ready():
	randomize()
	spawn_positions = $SpawnPositions.get_children()
	
func spawn_obstaculo():
	var index = randi() % spawn_positions.size()
	var obstaculo = Obstaculo.instance()
	obstaculo.global_position = spawn_positions[index].global_position
	obstaculo.connect("obstaculo_died", self, "obstaculo_died")
	add_child(obstaculo)

func _on_Timer_timeout():
	spawn_obstaculo()
