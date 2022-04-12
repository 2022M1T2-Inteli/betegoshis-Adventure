extends Button

func _process(_delta): 
	if closeMAP == true: #quando aperta o botao de fechar
		$iPad/apps/MapaB/MapaI.visible = false #o mapa desaparece
		$iPad/apps/MapaB/CloseMAPButton.visible = false #o botao de fechar também desaparece


var closeMAP = false #variavel para fechar o mapa
func _on_MapaB_pressed(): #botão do app "Mapa"
	$iPad/apps/MapaB/MapaI.visible = true #aparece o mapa
	$iPad/apps/MapaB/CloseMAPButton.visible = true #aparece o botao de fechar

func _on_CloseMAPButton_pressed(): #quando aperta no "x"
	closeMAP = true #o mapa fecha
	yield(get_tree().create_timer(.3), "timeout") #após 0.3 segundos
	closeMAP = false #o mapa pode ser aberto novamente
