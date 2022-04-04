extends CanvasModulate


func _process(delta):
	var CurrentFrame = range_lerp(Global.hora, 0, 24, 0, 24)
	$AnimationPlayer.play("CicloDiaNoite")
	$AnimationPlayer.seek(CurrentFrame)
