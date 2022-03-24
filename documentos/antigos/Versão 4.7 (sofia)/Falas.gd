extends CanvasLayer

func ready(): # no início do game, pra não esquecermos:
	$GuilhermeFalas.visible = false # desaparece a falinha do guilherme ali embaixo
	$SecretariaFalas.visible = false # idem

#"O que você deseja pagar hoje?"
# Falas do Banqueiro Guilherme 
var contadorGuiFalasButton = 0 # ordena o botão de falas do guilherme banqueiro
func _on_GuiFalasButton_pressed(): # botão de próximo do guilherme
	contadorGuiFalasButton += 1 # ordenando
	if contadorGuiFalasButton == 1: # na primeira vez que se clica
		$GuilhermeFalas/FalaGuilherme.text = "O que você deseja hoje?" # muda o texto
		$GuilhermeFalas/SairCvsaGui.visible = true # aparece o botão de "até mais"
		$GuilhermeFalas/PagarBoleto.visible = true # aparece o botão de "pagar boleto"
		$GuilhermeFalas/sprite_botao_boleto.visible = true
		$GuilhermeFalas/sprite_atemais_gui.visible = true
	if contadorGuiFalasButton == 2: # na segunda vez que se clica 
		pass # nada ainda
func _on_SairCvsaGui_pressed(): # botao de "até mais"
	$GuilhermeFalas.visible = false # desaparece o bagulho


# Falas da Secretária
var contadorSecrFalasButton = 0 # ordena 
func _on_SecrFalasButton_pressed(): # botão de próximo da secretária
	contadorSecrFalasButton += 1 # ordenando
	if contadorSecrFalasButton == 1: # primeira vez que se clica no botão
		# Muda o texto
		$SecretariaFalas/FalaSecretaria.text = "Imagino que tenha vindo aqui para pagar a taxa de matrícula, certo?"
	if contadorSecrFalasButton == 2: # segunda vez que se clica no botão
		# Muda o texto
		$SecretariaFalas/FalaSecretaria.text = "Certo, então aqui está o boleto para você pagar no banco"
	if contadorSecrFalasButton == 3: # terceira vez que se clica no botao (obs.: ele recebe o boleto também)
		$SecretariaFalas/FalaSecretaria.text = "Agora vá até o banco e pague o boleto, depois volte aqui para a primeira aula."
		$SecretariaFalas/SairCvsaSecr.visible = true # aparece o botão de "até mais"
		$SecretariaFalas/SecrFalasButton.visible = false
		$SecretariaFalas/sprite_atemais_secretaria.visible = true
	if contadorSecrFalasButton == 4:
		$SecretariaFalas/FalaSecretaria.text = "Com isso, você já pode assistir à sua primeira aula, é só continuar reto e virar a primeira esquerda. Boa aula!"
		$SecretariaFalas/SairCvsaSecr.visible = true
		Global.objetivo3 = true
		$Notificacao.visible = true


func _on_SairCvsaSecr_pressed(): # botão de "até mais" da secretária
	$SecretariaFalas.visible = false # desaparecem as falas da prof

# Sofia personagem
var contadorSofiaFalasButton = 0 
func _on_SofiaFalasButton_pressed():
	contadorSofiaFalasButton += 1
	if contadorSofiaFalasButton == 1:
		$SofiaFalas/Falas_Da_Sofia.text = "Eu te amo JP"
	if contadorSofiaFalasButton == 3:
		$SofiaFalas/Falas_Da_Sofia.text = "ASLKDOJSAOIDJASODIJASOIDJ"
func _on_SairCvsaSofiaButton_pressed():
	$SofiaFalas.visible = false

# Conversa com a Professora 
var ContadorProfFalasButton = 0
func _on_ProfFalasButton_pressed(): # botão de próximo da conversa com a prof 
	ContadorProfFalasButton += 1 # ordena as vezes que os botõess são apertados
	if ContadorProfFalasButton == 1: 
		# $ --- (muda o texto)
		$ProfessoraFalas/FalaProfessora.text = "Começaremos com uma mini-aula para você entender um pouco sobre matemática financeira."
		
	if ContadorProfFalasButton == 2: 
		$ProfessoraFalas/FalaProfessora.text = "Clique no botão para começá-la."
		$ProfessoraFalas/IniciarAula.visible = true # Botao pra começar a aula
		$ProfessoraFalas/ProfFalasButton.visible = false # evita bagunçar a ordem
		$ProfessoraFalas/sprite_inicio_aula1.visible = true
		
	if ContadorProfFalasButton == 3 and Global.ComecarFala_Da_ProfAula1 == true: # terceira vez que se aperta
		$ProfessoraFalas/FalaProfessora.text = "Além disso, depois de assistir às aulas, você terá que aplicar o que aprendeu, e eu vou te ajudar com isso."
		
	if ContadorProfFalasButton == 4: 
		$ProfessoraFalas/FalaProfessora.text = "Para essa primeira aula, vou te ajudar a calcular seu custo diário máximo. Para isso, insira a sua quantia de dinheiro atual abaixo."
		$ProfessoraFalas/Quest_1.visible = true
		
	if ContadorProfFalasButton == 5: 
		$ProfessoraFalas/FalaProfessora.text = "Fazendo as contas com o valor que você me passou, cheguei à conclusão de que você tem R$ " + str(CustoMax) + " para gastar por dia."
		$ProfessoraFalas/Quest_1.visible = false
#		Global.Falar_Depois_DaAula = true # possibilita ele a falar com a prof depois da aula (area2D)
func _on_SairCvsaProf_pressed():
		$ProfessoraFalas.visible = false # desaparece o bagulho
var CustoMax 
func _process(_delta):
	Global.Quest_1 = int($ProfessoraFalas/Quest_1.text)
	CustoMax = Global.Quest_1 / 30
	
	if Global.objetivo2 == true: # ou seja, ele pagou o boleto (completando o segundo objetivo)
		$SecretariaFalas/FalaSecretaria.text = "Olá novamente, já confirmamos que o seu boleto foi pago!"
		$SecretariaFalas/SecrFalasButton.visible = true


# Conversa com o Japinha do Mercadinho, Senhor Lyorrei
var contadorJapaFalasButton = 0 
func _on_JapaFalasButton_pressed(): # botão de falas do japinha
	contadorJapaFalasButton += 1
	if contadorJapaFalasButton == 1: # na primeira vez que se clica
		# Muda o texto
		$JapinhaFalas/Sprite/FalaJapinha.text = "Enfim, como posso te ajudar?"
		$JapinhaFalas/Sprite/SairCvsaJapa.visible = true
		$JapinhaFalas/Sprite/BotaoComprarComida.visible = true
		$JapinhaFalas/Sprite/sprite_comprar_comida.visible = true
		$JapinhaFalas/Sprite/sprite_atemais_japinha.visible = true

# Sair da conversa com o Japa
func _on_SairCvsaJapa_pressed():
	$JapinhaFalas.visible = false
	$JapinhaFalas/Sprite/JapaFalasButton.visible = true





func _on_TextureButton_pressed():
	$JapinhaFalas/Comidinhas.visible = false
	$JapinhaFalas/Sprite.visible = true
