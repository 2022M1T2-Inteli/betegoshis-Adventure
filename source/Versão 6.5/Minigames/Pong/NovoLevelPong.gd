extends Node2D

var PontosDir = 0
var PontosEsq = 0

func _ready():
	$MaoClicaCima/AnimationPlayer.play("ClicaAqui")
	yield(get_tree().create_timer(2.0), "timeout")
	$MaoClicaBaixo.visible = false
	$MaoClicaCima.visible = false 

func _on_LadoEsq_body_entered(body):
	$Bola.position = Vector2(489,249)#lado esq
	PontosEsq += 1


func _on_LadoD_body_entered(body):
	$Bola.position = Vector2(489,249)#lado d
	PontosDir += 1

func _process(delta):
	$PontosD.text = str(PontosDir)
	$PontosEsq.text = str(PontosEsq)
	
	if PontosEsq == 3:
		Global.dinheiro += 10
		get_tree().change_scene("res://Cidade.tscn")
		Global.Jogo_Pong = true
	if PontosDir == 3:
		Global.dinheiro -= 10
		Global.Gastos_arcade.append(-10.00)
		get_tree().change_scene("res://Cidade.tscn")
		Global.Jogo_Pong = true

