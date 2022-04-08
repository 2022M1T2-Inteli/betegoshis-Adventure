extends Camera2D

func _ready():
	make_current()
	$Controles/Controlesorg.modulate.a = 0.5
	$Dinheiro/Popups/Orientacoes/BalaoTioCasa/TextoBalaoTio.text = "Bom dia, " + str(Global.nome_jogador) + "! Estou Aqui!"
#	$Controles.modulate.a = 0.45
#	$Config/iPad/apps/MapaB/MapaI.visible = false
#	$Config/iPad.visible = false
#	$Fundo/AnimationPlayer.play("gif fundo")
