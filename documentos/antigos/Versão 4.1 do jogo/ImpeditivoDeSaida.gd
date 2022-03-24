extends StaticBody2D

var variavelImpeditivodeSaida = false
func _process(delta):
	if variavelImpeditivodeSaida == true:
		self.position.x = -5624
		self.position.y = 1439
	elif variavelImpeditivodeSaida == false:
		self.position.x = 0
		self.position.y = 0

func _on_InicioAula1_body_entered(body):
	yield(get_tree().create_timer(1), "timeout")
	variavelImpeditivodeSaida = true


func _on_Professorabotao_pressed():
	variavelImpeditivodeSaida = false
