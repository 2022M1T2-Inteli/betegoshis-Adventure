extends Node2D

signal add_score

var spawn_positions = null  

var Inimigo = preload("res://characters/Inimigo/Inimigo.tscn")

func _ready():
	randomize()
	spawn_positions = $SpawnPositions.get_children()
	
func gerador_inimigo():
	var index = randi() % spawn_positions.size()
	var inimigo = Inimigo.instance()
	inimigo.global_position = spawn_positions[index].global_position
	inimigo.connect("inimigo_morre", self, "inimigo_morre")
	add_child(inimigo)

func _on_SpawnTimer_timeout():
	gerador_inimigo()

func inimigo_morre():
	emit_signal("add_score")

