extends Sprite


#Variáveis
var SPEED = 15
var velocidadeX = 0
var velocidadeY = 0


func _process(delta):
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED
		velocidadeY = SPEED
		velocidadeX = 0
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED
		velocidadeY = -SPEED
		velocidadeX = 0
	if Input.is_action_pressed("ui_left"):
		position.x -= SPEED
		velocidadeX = -SPEED
		velocidadeY = 0
	if Input.is_action_pressed("ui_right"):
		position.x += SPEED
		velocidadeX = SPEED
		velocidadeY = 0
		
#func _process(delta):
#	$Sprite.move_local_x(velocidadeX)
#	$Sprite.move_local_y(velocidadeY)


func _on_Button_pressed():
	self.position.x = -5392
	self.position.y = 1707

