extends Control



func _ready():
	
	var tab_container = get_node("TabContainer")
	tab_container.set_current_tab(1)
	
	

pass
func _process(_delta):
	$dinheiro.text = "dinheiro :" + str(Global.investimentos)
	
	
#	SALVAR
#	if Input.is_key_pressed(KEY_ENTER):
#		get_tree().change_scene("res:game.tscn")
		 
		
func _on_tab_changed(tab):
	print("I have selected tab number" + str(tab))
	


func _on_INVESTIMENTOS_tab_changed(tab):
	pass # Replace with function body.
