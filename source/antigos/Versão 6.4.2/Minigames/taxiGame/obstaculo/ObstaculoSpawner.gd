extends Node2D

var posicao_gerador_obj = null  

var Obstaculo = preload("res://Minigames/taxiGame/obstaculo/Obstaculo.tscn")

func _ready():
	randomize()
	posicao_gerador_obj = $SpawnPositions.get_children()
	
func gerador_obstaculo():
	var index = randi() % posicao_gerador_obj.size()
	var obstaculo = Obstaculo.instance()
	obstaculo.global_position = posicao_gerador_obj[index].global_position
	obstaculo.connect("obstaculo_morrer", self, "obstaculo_morrer")
	add_child(obstaculo)

func _on_Timer_timeout():
	gerador_obstaculo()
