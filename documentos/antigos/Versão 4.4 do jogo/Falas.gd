extends Sprite

func ready():
	$GuilhermeFalas.visible = false
	$SecretariaFalas.visible = false

#"O que você deseja pagar hoje?"
# Falas do Banqueiro Guilherme
var contadorGuiFalasButton = 0
func _on_GuiFalasButton_pressed():
	contadorGuiFalasButton += 1
	if contadorGuiFalasButton == 1:
		$GuilhermeFalas/FalaGuilherme.text = "O que você deseja hoje?"
		$GuilhermeFalas/SairCvsaGui.visible = true
		$GuilhermeFalas/PagarBoleto.visible = true
	if contadorGuiFalasButton == 2:
		pass

func _on_SairCvsaGui_pressed():
	$GuilhermeFalas.visible = false


# Falas da Secretária
var contadorSecrFalasButton = 0
func _on_SecrFalasButton_pressed():
	contadorSecrFalasButton += 1
	if contadorSecrFalasButton == 1:
		$SecretariaFalas/FalaSecretaria.text = "Imagino que tenha vindo aqui para pagar a taxa de matrícula, certo?"
	if contadorSecrFalasButton == 2:
		$SecretariaFalas/FalaSecretaria.text = "Certo, então aqui está o boleto para você pagar no banco"
	if contadorSecrFalasButton == 3:
		$SecretariaFalas/FalaSecretaria.text = "Agora vá até o banco e pague o boleto, depois volte aqui para a primeira aula."
		$SecretariaFalas/SairCvsaSecr.visible = true

func _on_SairCvsaSecr_pressed():
	$SecretariaFalas.visible = false
	$SecretariaFalas/SairCvsaSecr.visible = false
