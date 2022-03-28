extends Button # Script do Botão AbrirCelular

# App Mapa
func _on_MapaB_pressed(): #botão do app "Mapa"
	$CelularPanel/apps/MapaB/MapaI.visible = true #aparece o mapa
	$CelularPanel/apps/MapaB/CloseMAPButton.visible = true #aparece o botao de fechar

func _on_CloseMAPButton_pressed(): #quando aperta no "x"
	$CelularPanel/apps/MapaB/MapaI.visible = false #o mapa desaparece
	$CelularPanel/apps/MapaB/CloseMAPButton.visible = false #o botao de fechar também desaparece

# App Ajustes
func _on_AjustesB_pressed():
	$CelularPanel/apps/AjustesI.visible = true
func _on_SaveButton_pressed():
	$CelularPanel/apps/AjustesI.visible = false



func _process(_delta):
	# Coisas para os objetivos
	if Global.objetivo1 == true:
		$CelularPanel/Tasks/Objetivo2.visible = true
		$CelularPanel/Tasks/Objetivo1.modulate.r = 0
		$CelularPanel/Tasks/Objetivo1.modulate.b = 0
	if Global.objetivo2 == true:
		$CelularPanel/Tasks/Objetivo3.visible = true
		$CelularPanel/Tasks/Objetivo2.modulate.r = 0
		$CelularPanel/Tasks/Objetivo2.modulate.b = 0
	if Global.objetivo3 == true:
		$CelularPanel/Tasks/Objetivo4.visible = true
		$CelularPanel/Tasks/Objetivo3.modulate.r = 0
		$CelularPanel/Tasks/Objetivo3.modulate.b = 0
	if Global.objetivo4 == true:
		$CelularPanel/Tasks/Objetivo5.visible = true
		$CelularPanel/Tasks/Objetivo4.modulate.r = 0
		$CelularPanel/Tasks/Objetivo4.modulate.b = 0
	if Global.objetivo5 == true:
		$CelularPanel/Tasks/Objetivo6.visible = true
		$CelularPanel/Tasks/Objetivo5.modulate.r = 0
		$CelularPanel/Tasks/Objetivo5.modulate.b = 0






#abrir pagina banco
func _on_BancoB_pressed():
	$CelularPanel/apps/BancoB/PaginaB.visible = true 
	$CelularPanel/apps/AjustesB.visible = false
	$CelularPanel/apps/RevisaoB.visible = false
	$CelularPanel/apps/MapaB.visible = false

# sair Pagina banco
func _on_Button_pressed():
	$CelularPanel/apps/BancoB/PaginaB.visible = false
	$CelularPanel/apps/AjustesB.visible = true
	$CelularPanel/apps/RevisaoB.visible = true
	$CelularPanel/apps/MapaB.visible = true 

#abrir extr
func _on_Bextr_pressed():
	$CelularPanel/apps/BancoB/PaginaB/Bextr/Extrato.visible = true


#sair extr
func _on_SairExt_pressed():
	$CelularPanel/apps/BancoB/PaginaB/Bextr/Extrato.visible = false
	$CelularPanel/apps/BancoB/PaginaB/Bextr/SairExt.visible = false
	

