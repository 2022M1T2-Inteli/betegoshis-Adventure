extends Button # Script do Botão AbrirCelular

func _ready():
	get_parent().get_parent().get_parent().fecharCelular()

func notificar():
	get_parent().get_parent().get_node("Celular/AbrirCelular/Notificacao").visible = true
	
func _process(_delta):
	if Global.dia == 1:
		if Global.objetivo1 == true: # Falou com a vó
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[2]
			notificar()
			Global.objetivo1 = false
		if Global.objetivo2 == true: # Falou com o tio
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[3]
			notificar()
			Global.objetivo2 = false
		if Global.objetivo3 == true: # Falou com a secretária
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[4]
			notificar()
			Global.objetivo3 = false
		if Global.objetivo4 == true: # Pagou o boleto
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[5]
			notificar()
			Global.objetivo4 = false
		if Global.objetivo5 == true: # Falou com a amélia
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[6]
			notificar()
			Global.objetivo5 = false
		if Global.objetivo6 == true: # Teve a primeira aula
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[7]
			notificar()
			Global.objetivo6 = false
		if Global.objetivo7 == true: # Voltou pra casa e vai dormir
			$CelularPanel/Tasks/Objetivo.text = F1_objetivos[8]
			notificar()
		
	if Global.dia == 2: 
		if Global.objetivo1 == false: # Acordou e ainda não acordou o tio
			$CelularPanel/Tasks/Objetivo.text = F2_objetivos[1]
			notificar()
		if Global.objetivo1 == true: # Acordou o tio
			$CelularPanel/Tasks/Objetivo.text = F2_objetivos[2]
			notificar()
			Global.objetivo1 = false
		if Global.objetivo2 == true: # Foi ao mercado e comprou frango e cogumelo
			$CelularPanel/Tasks/Objetivo.text = F2_objetivos[3]
			notificar()
			Global.objetivo2 = false
		if Global.objetivo3 == true: # Voltou para casa e falou com o tio
			$CelularPanel/Tasks/Objetivo.text = F2_objetivos[4]
			notificar()
			Global.objetivo3 = false
		if Global.objetivo4 == true: # Teve a aula de inflação
			$CelularPanel/Tasks/Objetivo.text = F2_objetivos[5]
			notificar()
			Global.objetivo4 = false
		if Global.hora < 18:
			get_parent().get_node("AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa").visible = false
		if Global.hora >= 18:
			get_parent().get_node("AbrirCelular/CelularPanel/apps/Mapaorg/Lugares/BotaoIrCasa").visible = true
		if Global.objetivo5 == true: # Voltou para casa
			Global.objetivo5 = false


var F1_objetivos = [0, # Dia 1, Gastos Diários
"Fale com sua avó", # Primeiro
"Vá à casa do seu tio e fale com ele", # Segundo 
"Vá à faculdade e fale com a secretária", # Terceiro
"Vá até o banco e pague o boleto com o banqueiro",  # Quarto
"Volte para a faculdade e fale com a Amélia novamente",  # Quinto
"Assista às suas primeiras aulas e calcule seu gasto diário", # Sexto
"Volte à casa do seu tio", # Sétimo
"Durma, amanhã um grande dia te espera", # Oitavo
0]

var F2_objetivos = [0, # Dia 2, Inflação
"Acorde seu tio", # 1 
"Vá ao mercado e compre o que seu tio pediu", # 2
"Volte para casa", # 3 
"Vá à faculdade e tenha sua segunda aula", # 4
"Volte para casa depois das 18h e durma",  # 5
0]

var F3_objetivos = [0, # Dia 3, 
"Vá à faculdade e tenha sua terceira aula",
0]

var F4_objetivos = [0,
"",
0]

var F5_objetivos = [0,
"",
0]

var F6_objetivos = [0,
"",
0]


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


