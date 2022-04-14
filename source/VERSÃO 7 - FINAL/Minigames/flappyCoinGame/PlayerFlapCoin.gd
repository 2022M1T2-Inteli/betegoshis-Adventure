extends RigidBody2D
class_name FlapPlayer

signal morreu

export var forcaPulo = -150

const maximaRotacao = -5.0

onready var animator = $AnimationPlayer

var iniciou = false 
var vivo = true 

func _physics_process(_delta):
	print(rotation_degrees)
	if Input.is_action_just_pressed("flap") && vivo:
		if iniciou:
			iniciar()
		pular()
		
	if rotation_degrees <= maximaRotacao:
		angular_velocity = 0
		rotation_degrees = maximaRotacao 
		
	if linear_velocity.y > 0:
		if rotation_degrees <= 20:
			angular_velocity = 3
		else:
			angular_velocity = 0
		
func iniciar():
	if iniciou: return
	iniciou = true
	gravity_scale = 5.0
	animator.play("flap")
	
func pular():
	linear_velocity.y = forcaPulo
	angular_velocity = -8.0
	
func morrer():
	if !vivo: return 
	vivo = false
	animator.stop()
	get_parent().game_over()
	get_parent().criadorObstaculo.stop() # para de spawnar os obstaculos (as "paredes")
	get_parent().chao.get_node("AnimationPlayer").stop() # para a animação da moedinha 
	get_parent().get_tree().call_group("obstacles", "set_phisics_process", false) # obstáculos param de se mexer
	get_tree().change_scene("res://Cidade.tscn")
#	emit_signal("morreu")
	

