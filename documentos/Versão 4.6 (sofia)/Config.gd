extends Button # Script do Botão AbrirCelular


func _on_MapaB_pressed(): #botão do app "Mapa"
	$CelularPanel/apps/MapaB/MapaI.visible = true #aparece o mapa
	$CelularPanel/apps/MapaB/CloseMAPButton.visible = true #aparece o botao de fechar

func _on_CloseMAPButton_pressed(): #quando aperta no "x"
	$CelularPanel/apps/MapaB/MapaI.visible = false #o mapa desaparece
	$CelularPanel/apps/MapaB/CloseMAPButton.visible = false #o botao de fechar também desaparece

