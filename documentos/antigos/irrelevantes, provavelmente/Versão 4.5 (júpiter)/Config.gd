extends Button


func _on_MapaB_pressed(): #botão do app "Mapa"
	$iPad/apps/MapaB/MapaI.visible = true #aparece o mapa
	$iPad/apps/MapaB/CloseMAPButton.visible = true #aparece o botao de fechar

func _on_CloseMAPButton_pressed(): #quando aperta no "x"
	$iPad/apps/MapaB/MapaI.visible = false #o mapa desaparece
	$iPad/apps/MapaB/CloseMAPButton.visible = false #o botao de fechar também desaparece

