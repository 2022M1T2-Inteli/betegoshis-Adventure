extends Tabs

onready var price2 = str2var($RichTextLabel/control/Panel2/Label.text)
onready var price3 = str2var($RichTextLabel/control/Panel3/Label.text)
onready var panels = $RichTextLabel/control

func _process(delta):
	$RichTextLabel/control.position.x = -$HScrollBar.value
	

func _buy(price, item_no):
	Global.load_corretora()
	if Global.investimentos >= price:
		Global.investimentos -= price
		Global.corretora.bought[item_no] = true
		panels.get_node('Panel'+str(item_no+1)).get_node('Button').text = 'Select'
		Global.save_corretora()
	else:
		var rem = price - Global.investimentos
		$ColorRect/Label.text = 'Voce precisa ' +str(rem)+ 'coins /para comprar isso'
		$ColorRect.show()
	
	
	
func _on_Button_pressed():
	_buy(price2, 1)
func _on_Button2_pressed():
	_buy(price3, 2)


func _on_Button3_pressed():
	$ColorRect.hide()
