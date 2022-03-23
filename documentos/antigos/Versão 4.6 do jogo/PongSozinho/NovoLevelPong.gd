extends Node2D

var PontosD = 0
var PontosEsq = 0



func _on_LadoEsq_body_entered(body):
	$Bola.position = Vector2(489,249)#lado esq
	PontosEsq += 1



func _on_LadoD_body_entered(body):
	$Bola.position = Vector2(489,249)#lado d
	PontosD += 1

func _process(delta):
	$PontosD.text = str(PontosD)
	$PontosEsq.text = str(PontosEsq)


