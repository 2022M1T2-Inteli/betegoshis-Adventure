extends Label

export(int) var price

var txt

func _ready():
	self.text = str(price)
	txt = self.text
	
