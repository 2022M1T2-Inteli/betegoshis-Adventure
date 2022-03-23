extends Button # Script do Botão AbrirCelular

# App Mapa
func _on_MapaB_pressed(): #botão do app "Mapa"
	$CelularPanel/apps/MapaB/MapaI.visible = true #aparece o mapa
	$CelularPanel/apps/MapaB/CloseMAPButton.visible = true #aparece o botao de fechar

func _on_CloseMAPButton_pressed(): #quando aperta no "x"
	$CelularPanel/apps/MapaB/MapaI.visible = false #o mapa desaparece
	$CelularPanel/apps/MapaB/CloseMAPButton.visible = false #o botao de fechar também desaparece


func _process(_delta):
	# Coisas para os objetivos
	if Global.objetivo1 == true:
		$Notificacao.visible = true
		$CelularPanel/Tasks/Objetivo2.visible = true
		$CelularPanel/Tasks/Objetivo1.modulate.r = 0
		$CelularPanel/Tasks/Objetivo1.modulate.b = 0
	if Global.objetivo2 == true:
		$Notificacao.visible = true
		$CelularPanel/Tasks/Objetivo3.visible = true
		$CelularPanel/Tasks/Objetivo2.modulate.r = 0
		$CelularPanel/Tasks/Objetivo2.modulate.b = 0
	if Global.objetivo3 == true:
		$Notificacao.visible = true
		$CelularPanel/Tasks/Objetivo4.visible = true
		$CelularPanel/Tasks/Objetivo3.modulate.r = 0
		$CelularPanel/Tasks/Objetivo3.modulate.b = 0
	if Global.objetivo4 == true:
		$Notificacao.visible = true
		$CelularPanel/Tasks/Objetivo5.visible = true
		$CelularPanel/Tasks/Objetivo4.modulate.r = 0
		$CelularPanel/Tasks/Objetivo4.modulate.b = 0
	if Global.objetivo5 == true:
		$Notificacao.visible = true
		$CelularPanel/Tasks/Objetivo6.visible = true
		$CelularPanel/Tasks/Objetivo5.modulate.r = 0
		$CelularPanel/Tasks/Objetivo5.modulate.b = 0

