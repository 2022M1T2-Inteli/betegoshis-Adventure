extends RigidBody2D


var hp = 5

func _physics_process(delta):
	if hp <= 0:
		explode()

func damage():
	hp -= 1

func explode():
	get_parent().add_score()
	var explosion = preload("res://explosion.tscn").instance()
	explosion.global_position = global_position
	explosion.animation = 'explode'
	get_node("/root").add_child(explosion)
	queue_free()


