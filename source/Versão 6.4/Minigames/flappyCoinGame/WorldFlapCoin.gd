extends Node2D

onready var hud = $HUD
onready var criadorObstaculo = $ObstacleSpawner
onready var chao = $Ground

# Quando começa o jogo, começa a criar obstáculos
func _ready():
	criadorObstaculo.connect("obstacle_created", self, "_on_obstacle_created")
func novoJogo():
	criadorObstaculo.start()
func _on_obstacle_created(obs):
	obs.connect("score", self, "player_score")

func _on_DeathZone_body_entered(body):
	if body.has_method("morrer"):
		get_node("Player").morrer()
		game_over()


func game_over(): # função game_over
	print("morreu")
	criadorObstaculo.stop() # para de spawnar os obstaculos (as "paredes")
	chao.get_node("AnimationPlayer").stop() # para a animação da moedinha 
	get_tree().call_group("obstacles", "set_phisics_process", false) # obstáculos param de se mexer
	get_tree().change_scene("res://ui/MenuCenaReal.tscn")

func _on_MenuLayer_start_game():
	novoJogo()

func _process(_delta):
	if Global.morrer == true:
		game_over()
	
	$HUD/Pontuacao.text = str(Global.pontuacaoFlapCoin)
	
