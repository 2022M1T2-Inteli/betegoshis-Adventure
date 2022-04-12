extends KinematicBody2D

var acc = Vector2()
var speed = 200
var screen_size = Vector2()

var countdown = 10

# ------------ Player sprite variables
# Please NOTE: all player sprites in the store must be present in this array in their respective order
var textures = [
			'res://icon.png',
			'res://assets/player2.svg',
			'res://assets/player3.svg',
]


func _ready():
# ---------- Load the store
	Global.load_store()
# ------- Choose the selected sprite
	$Sprite.texture = load(textures[Global.store.selected])



func _physics_process(delta):


# ------ Player movement
	var rot = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	rotate(rot*0.1)
	if Input.is_key_pressed(KEY_UP):
		acc.y = -speed
	move_and_slide(acc.rotated(rotation))

# ------------ Gun fire
	countdown -= 1
	if Input.is_action_pressed("ui_select") and countdown <= 0:
		var bullet = preload("res://bullet.tscn").instance()
		bullet.global_position = $gun.global_position
		bullet.rotation = rotation
		get_node("/root").add_child(bullet)
		countdown = 10

	









