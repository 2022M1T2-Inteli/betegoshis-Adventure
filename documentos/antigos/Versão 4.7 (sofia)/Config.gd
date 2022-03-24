extends Button # Script do Botão AbrirCelular


func _on_MapaB_pressed(): #botão do app "Mapa"
	$CelularPanel/apps/MapaB/MapaI.visible = true #aparece o mapa
	$CelularPanel/apps/MapaB/CloseMAPButton.visible = true #aparece o botao de fechar

func _on_CloseMAPButton_pressed(): #quando aperta no "x"
	$CelularPanel/apps/MapaB/MapaI.visible = false #o mapa desaparece
	$CelularPanel/apps/MapaB/CloseMAPButton.visible = false #o botao de fechar também desaparece

func _process(_delta):
	if Global.objetivo1 == true:
		$CelularPanel/Tasks/Objetivo2/TampaObjetivo2.visible = false
		$CelularPanel/Tasks/Objetivo1.modulate.r = 0
		$CelularPanel/Tasks/Objetivo1.modulate.b = 0
	if Global.objetivo2 == true:
		$CelularPanel/Tasks/Objetivo3/TampaObjetivo3.visible = false
		$CelularPanel/Tasks/Objetivo2.modulate.r = 0
		$CelularPanel/Tasks/Objetivo2.modulate.b = 0
	if Global.objetivo3 == true:
		$Notificacao.visible = true
		$CelularPanel/Tasks/Objetivo4/TampaObjetivo4.visible = false
		$CelularPanel/Tasks/Objetivo3.modulate.r = 0
		$CelularPanel/Tasks/Objetivo3.modulate.b = 0
	if Global.objetivo4 == true:
		$CelularPanel/Tasks/Objetivo5/TampaObjetivo5.visible = false
		$CelularPanel/Tasks/Objetivo4.modulate.r = 0
		$CelularPanel/Tasks/Objetivo4.modulate.b = 0
	if Global.objetivo5 == true:
		$CelularPanel/Tasks/Objetivo6/TampaObjetivo6.visible = false
		$CelularPanel/Tasks/Objetivo5.modulate.r = 0
		$CelularPanel/Tasks/Objetivo5.modulate.b = 0
