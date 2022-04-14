extends Area2D

var speed = 700

func _process(delta):
	position += Vector2(0, -speed).rotated(rotation) * delta


func _on_bullet_body_entered(body):
	if body.is_in_group('meteors'):
		body.damage()
		hit_spark()

func hit_spark():
	var hit = preload("res://explosion.tscn").instance()
	hit.global_position = global_position
	hit.animation = 'hit'
	get_node("/root").add_child(hit)
	queue_free()
