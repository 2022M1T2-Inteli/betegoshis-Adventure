extends Node2D

onready var hud = $HUD
onready var gerador_obstaculo = $ObstacleSpawner
onready var ground = $Ground

var score = 0 setget set_score

func _ready():
	gerador_obstaculo.connect("criar_obstaculo", self, "_on_criar_obstaculo")
#	new_game()

func new_game():
	self.score = 0
	gerador_obstaculo.start()

func player_score():
	self.score += 1

func set_score(new_score):
	score = new_score
	hud.update_score(score)

func _on_criar_obstaculo(obs):
	obs.connect("score", self, "player_score")
	
func _on_DeathZone_body_entered(body):
	if body is Player:
		if body.has_method("die"):
			body.die()

func _on_Player_died(): # estado do personagem morto
	game_over() # chama a função "game_over"
	
func game_over(): # função game_over
		gerador_obstaculo.stop() # para de spawnar os obstaculos (as "paredes")
		ground.get_node("AnimationPlayer").stop() # para a animação da moedinha 
		get_tree().call_group("obstacles", "set_phisics_process", false) # obstáculos param de se mexer
		get_tree().change_scene("res://ui/MenuCenaReal.tscn")

func _on_MenuLayer_start_game():
	new_game()

func _process(_delta):
	if Global.Morrer == true:
		game_over()
