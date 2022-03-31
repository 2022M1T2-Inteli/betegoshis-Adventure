extends Tabs

# --------- Prices for all items
onready var price2 = str2var($RichTextLabel/control/Panel2/Label.text)
onready var price3 = str2var($RichTextLabel/control/Panel3/Label.text)

# -------- panels node
onready var panels = $RichTextLabel/control

# ------ Scroll bar
func _process(delta):
	$RichTextLabel/control.position.x = -$HScrollBar.value

func _ready():
	# ------- Load store
	Global.load_store()
# ------ Check for all bought items and make them bought
	for item in range(panels.get_child_count()-2):
		if Global.store.bought[item] == true:
			panels.get_node('Panel'+str(item+1)).get_node('Button').text = 'Select'
	panels.get_node('Panel'+str(Global.store.selected+1)).get_node('Button').text = 'selected'
	panels.get_node('Panel'+str(Global.store.selected+1)).get_node('Button').add_to_group('selected')

# ---------- select items
func _selected(node, no):
	Global.load_store()
	for buttons in get_tree().get_nodes_in_group('selected'):
		buttons.text = 'select'
		buttons.remove_from_group('selected')
	node.text = 'selected'
	node.add_to_group('selected')
	Global.store.selected = no
	Global.save_store()



func _buy(price, item_no):
	Global.load_store()
	# --------- Check if already bought
	if Global.store.bought[item_no] == false:
		if Global.score >= price: # Check if there is enough money to buy the item
			Global.score -= price
			Global.store.bought[item_no] = true
			panels.get_node('Panel'+str(item_no+1)).get_node('Button').text = 'Select'
			Global.save_store()
		else:
			var rem = price - Global.score
			$ColorRect/Label.text = 'You need '+str(rem)+' coins \nto buy this'
			$ColorRect.show()
	else: # ---Select the item if clicked and is already bought 
		_selected(panels.get_node('Panel'+str(item_no+1)).get_node('Button'), item_no)





func _on_Button1_pressed():
	_buy(0, 0)
func _on_Button2_pressed():
	_buy(price2, 1)
func _on_Button3_pressed():
	_buy(price3, 2)


func _on_Button_pressed():
	$ColorRect.hide()

