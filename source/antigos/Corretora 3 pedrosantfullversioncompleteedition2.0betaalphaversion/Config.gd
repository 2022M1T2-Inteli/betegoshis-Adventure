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

var F1_objetivos = [0,
"Fale com sua avó", # Primeiro
"Vá à casa do seu tio e fale com ele", # Segundo 
"Vá à faculdade e fale com a secretária", # Terceiro
"Vá até o banco e pague o boleto com o banqueiro",  # Quarto
"Volte para a faculdade e fale com a Amélia novamente",  # Quinto
"Assista à sua primeira aula", # Sexto
"Volte à casa do seu tio", # Sétimo
"Durma, amanhã um grande dia te espera" # Oitavo
]

var F2_objetivos = [0, 
"Acorde seu tio e vá ao mercado", # Primeiro
"Compre frango e cogumelos e volte para casa", # Segundo 
"Vá à faculdade e tenha sua segunda aula", # Terceiro
"Calcule seus gastos diários",  # Quarto
"Volte para casa e durma" # Quinto
]

func _process(_delta):
	if Global.dia == 1:
		if Global.F1_objetivo1 == false: # Falar com a vó
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[1]
		if Global.F1_objetivo1 == true: # Falou com a vó
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[2]
		if Global.F1_objetivo2 == true: # Falou com o tio
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[3]
		if Global.F1_objetivo3 == true: # Falou com a secretária
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[4]
		if Global.F1_objetivo4 == true: # Pagou o boleto
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[5]
		if Global.F1_objetivo5 == true: # Falou com a amélia
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[6]
		if Global.F1_objetivo6 == true: # Teve a primeira aula
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[7]
		if Global.F1_objetivo7 == true: # Voltou pra casa e vai dormir
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[8]
	if Global.dia == 2: 
		if Global.F1_objetivo8 == true: # Dormiu
			$CelularPanel/Tasks/Objetivo.text = F2_objetivos[1]
		if Global.F2_objetivo1 == true: # Dormiu
			$CelularPanel/Tasks/Objetivo.text = F2_objetivos[2]
		if Global.F2_objetivo2 == true: # Dormiu
			$CelularPanel/Tasks/Objetivo.text = F2_objetivos[3]
		if Global.F2_objetivo3 == true: # Dormiu
			$CelularPanel/Tasks/Objetivo.text = F2_objetivos[4]
		if Global.F2_objetivo4 == true: # Dormiu
			$CelularPanel/Tasks/Objetivo.text = F2_objetivos[5]
		if Global.F2_objetivo5 == true: # Dormiu
			$CelularPanel/Tasks/Objetivo.text = F2_objetivos[6]


#1Falar com a avó
#2Ir à casa do tio para falar com ele
#		Pega os boletos de água, luz e internet
#3Ir à faculdade e falar com a secretária
# 		Pega o boleto da ta
#4Pagar o boleto da taxa de matrícula, da conta de água, da conta de luz e da conta de internet no banco
#5Voltar à faculdade e falar com a secretária
#6Assistir à primeira aula
#7Voltar para casa do tio
#8Dormir


