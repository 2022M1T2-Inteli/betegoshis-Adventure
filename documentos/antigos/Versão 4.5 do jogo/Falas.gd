extends Sprite

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

func _on_SairCvsaSecr_pressed(): # botão de "até mais" da secretária
	$SecretariaFalas.visible = false # desaparecem as falas da prof

var contadorSofiaFalasButton = 0 
func _on_SofiaFalasButton_pressed():
	contadorSofiaFalasButton += 1
	if contadorSofiaFalasButton == 1:
		$SofiaFalas/Falas_Da_Sofia.text = "Eu te amo JP"
	if contadorSofiaFalasButton == 3:
		$SofiaFalas/Falas_Da_Sofia.text = "ASLKDOJSAOIDJASODIJASOIDJ"


func _on_SairCvsaSofiaButton_pressed():
	$SofiaFalas.visible = false

var ContadorProfFalasButton = 0
func _on_ProfFalasButton_pressed():
	ContadorProfFalasButton += 1
	if ContadorProfFalasButton == 1:
		$ProfessoraFalas/FalaProfessora.text = "Começaremos com uma mini-aula para você entender um pouco sobre matemática financeira. Clique no botão para começá-la."
		$ProfessoraFalas/IniciarAula.visible = true
		
#	if ContadorProfFalasButton == 2:
#		$ProfessoraFalas.visible = false
