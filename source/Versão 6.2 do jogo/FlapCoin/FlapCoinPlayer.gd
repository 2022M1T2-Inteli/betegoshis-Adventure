extends RigidBody2D
class_name Player

signal died

export var FLAP_FORCE = -150

const MAX_ROTATION_DEGREES = -5.0

onready var animator = $AnimationPlayer

var started = false 
var alive = true 

func _process(delta):
	Global.Pular = false

func _physics_process(_delta):
	print(rotation_degrees)
	if Input.is_action_just_pressed("flap") and alive or Global.Pular == true and alive:
		if started:
			start()
		flap()
		
	if rotation_degrees <= MAX_ROTATION_DEGREES:
		angular_velocity = 0
		rotation_degrees = MAX_ROTATION_DEGREES 
		
	if linear_velocity.y > 0:
		if rotation_degrees <= 20:
			angular_velocity = 3
		else:
			angular_velocity = 0
		
func start():
	if started: return
	started = true
	gravity_scale = 5.0
	animator.play("flap")
	
func flap():
	linear_velocity.y = FLAP_FORCE
	angular_velocity = -8.0
	
func die():
	if !alive: return 
	alive = false
	animator.stop()
	emit_signal("died")
	get_tree().change_scene("res://Cidade.tscn")
	Global.Jogo_flapCoin = true



func _on_JumpButton_pressed():
	Global.Pular = true
