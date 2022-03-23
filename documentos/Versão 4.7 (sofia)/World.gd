extends Node2D

onready var hud = $HUD
onready var obstacle_spawner = $ObstacleSpawner
onready var ground = $Ground

var score = 0 setget set_score

func _ready():
	obstacle_spawner.connect("obstacle_created", self, "_on_obstacle_created")
#	new_game()

func new_game():
	self.score = 0
	obstacle_spawner.start()

func player_score():
	self.score += 1

func set_score(new_score):
	score = new_score
	hud.update_score(score)

func _on_obstacle_created(obs):
	obs.connect("score", self, "player_score")
	
func _on_DeathZone_body_entered(body):
	if body is Player:
		if body.has_method("die"):
			body.die()

func _on_Player_died(): # estado do personagem morto
	game_over() # chama a função "game_over"
	
func game_over(): # função game_over
		obstacle_spawner.stop() # para de spawnar os obstaculos (as "paredes")
		ground.get_node("AnimationPlayer").stop() # para a animação da moedinha 
		get_tree().call_group("obstacles", "set_phisics_process", false) # obstáculos param de se mexer
		get_tree().change_scene("res://ui/MenuCenaReal.tscn")

func _on_MenuLayer_start_game():
	new_game()

