extends Tabs

onready var price1 = str2var($control/Panel1/Label.text)
onready var price2 = str2var($control/Panel2/Label.text)
onready var price3 = str2var($control/Panel3/Label.text)
onready var price4 = str2var($control/Panel4/Label.text)
onready var panels = $control

func _process(_delta):
	$control.position.x = -$HScrollBar.value
	
func _ready():
#	Global.load_corretora()
	for item in range(panels.get_child_count()-2):
		if Global.corretora.bought[item]== true:
			panels.get_node('Panel'+str(item+1)).get_node('Button').text = 'Select'
#	panels.get_node('Panel'+str(Global.corretora.select+1)).get_node('Button').text = 'selected'
#	panels.get_node('Panel'+str(Global.corretora.select+1)).get_node('Button').add_to_group('selected')
	
	
	
func _selected(node, no):
#	Global.load_corretora()
	for buttons in get_tree().get_nodes_in_group('selected'):
		buttons.text = 'select'
		buttons.remove_from_group('selected')
	node.text = 'selected'
	node.add_to_group('selected')
	
#	Global.save_corretora()
		
		
func _buy(price, item_no):
#	Global.load_corretora()
	if Global.investimentos >= price:
		Global.investimentos -= price
		Global.corretora.bought[item_no] = true
		panels.get_node('Panel'+str(item_no+1)).get_node('Button').text = 'Select'
#		Global.save_corretora()

	else:
		var rem = price - Global.investimentos
		$ColorRect/Label.text = 'Voce precisa' + str(rem) + 'coins /n para comprar isso'
		$ColorRect.show()
#	else:
		_selected(panels.get_node('Panel'+str(item_no+1)).get_node('Button'), item_no)
		
		
	
func _on_Button_pressed():
	_buy(price1, 0)
func _on_Button2_pressed():
	_buy(price2, 1)
func _on_Button3_pressed():
	_buy(price3, 2)
func _on_Button4_pressed():
	_buy(price4, 3)


func _on_ButtonExit_pressed():
	$ColorRect.hide()
	
