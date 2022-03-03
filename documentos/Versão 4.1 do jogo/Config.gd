extends Button

func _process(_delta):
	if closeMAP == true:
		$iPad/apps/MapaB/MapaI.visible = false
		$iPad/apps/MapaB/CloseMAPButton.visible = false


var closeMAP = false
func _on_MapaB_pressed():
	$iPad/apps/MapaB/MapaI.visible = true
	$iPad/apps/MapaB/CloseMAPButton.visible = true

func _on_CloseMAPButton_pressed():
	closeMAP = true
	yield(get_tree().create_timer(.3), "timeout")
	closeMAP = false
