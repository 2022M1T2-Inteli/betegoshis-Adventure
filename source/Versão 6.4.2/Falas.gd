extends CanvasLayer

func ready(): # no início do game, pra não esquecermos:
	$GuilhermeFalas.visible = false # desaparece a falinha do guilherme ali embaixo
	$SecretariaFalas.visible = false # idem
	$RafaelFalas.visible = false
	$ProfessoraFalas.visible = false
	$JapinhaFalas/Falaorg.visible = false
	$VoFalas.visible = false
	$TioClovisFalas.visible = false
	$Nin_YangFalas.visible = false


#"O que você deseja pagar hoje?"
# Falas do Banqueiro Guilherme 
var contadorGuiFalasButton = 0 # ordena o botão de falas do guilherme banqueiro
func _on_GuiFalasButton_pressed(): # botão de próximo do guilherme
	if Global.dia == 1:
		contadorGuiFalasButton += 1 # ordenando
		if contadorGuiFalasButton == 1: # na primeira vez que se clica
			Global.passaTempo(1)
			$GuilhermeFalas/FalaGuilherme.text = "O que você deseja hoje?" # muda o texto
			$GuilhermeFalas/SairCvsaGui.visible = true # aparece o botão de "até mais"
			$GuilhermeFalas/PagarBoleto.visible = true # aparece o botão de "pagar boleto"
		if contadorGuiFalasButton == 2: # na segunda vez que se clica
			pass # nada ainda

func _on_SairCvsaGui_pressed(): # botao de "até mais"
	$GuilhermeFalas.visible = false # desaparece o bagulho


func _on_SairCvsaRafa_pressed(): # botao de "até mais"
	$RafaelFalas.visible = false # desaparece o bagulho


# Falas da Secretária
var contadorSecrFalasButton = 0 # ordena
func _on_SecrFalasButton_pressed(): # botão de próximo da secretária
	if Global.dia == 1:
		contadorSecrFalasButton += 1 # ordenando
		if contadorSecrFalasButton == 1: # primeira vez que se clica no botão
			Global.passaTempo(1)
			$SecretariaFalas/FalaSecretaria.text = "Imagino que tenha vindo aqui para pagar a taxa de matrícula, certo?"
		if contadorSecrFalasButton == 2: # segunda vez que se clica no botão
			Global.passaTempo(1)
			$SecretariaFalas/FalaSecretaria.text = "Certo, então aqui está o boleto no valor de BT$ 80,00 para você pagar no banco."
		if contadorSecrFalasButton == 3: # terceira vez que se clica no botao (obs.: ele recebe o boleto também)
			Global.passaTempo(1)
			$SecretariaFalas/FalaSecretaria.text = "Agora vá até o banco e pague o boleto, depois volte aqui para a primeira aula."
			$SecretariaFalas/SairCvsaSecr.visible = true # aparece o botão de "até mais"
			$SecretariaFalas/SecrFalasButton.visible = false
			Global.ExclamacaoGui = true
		if contadorSecrFalasButton == 4 and Global.F1_objetivo4 == true:
			Global.passaTempo(1)
			$SecretariaFalas/FalaSecretaria.text = "Com isso, você já pode assistir à sua primeira aula. É só continuar reto e virar à primeira esquerda. Boa aula!"
			$SecretariaFalas/SairCvsaSecr.visible = true
			Global.F1_objetivo5 = true
		
	

func _on_SairCvsaSecr_pressed(): # botão de "até mais" da secretária
	$SecretariaFalas.visible = false # desaparecem as falas da prof
	if Global.F1_objetivo4 == true:
		Global.F1_objetivo5 = true

# Conversa com a Professora 
var contadorProfFalasButton = 0
func _on_ProfFalasButton_pressed(): # botão de próximo da conversa com a prof
	contadorProfFalasButton += 1 # ordena as vezes que os botõess são apertados
	if Global.dia == 1:
		if contadorProfFalasButton == 1:
			Global.passaTempo(1)
			$ProfessoraFalas/FalaProfessora.text = "Começaremos com uma mini-aula para você entender um pouco sobre matemática financeira."
		if contadorProfFalasButton == 2:
			Global.passaTempo(1)
			$ProfessoraFalas/FalaProfessora.text = "Clique no botão para começá-la."
			$ProfessoraFalas/IniciarAula.visible = true # Botao pra começar a aula
			$ProfessoraFalas/ProfFalasButton.visible = false # evita bagunçar a ordem
		# Depois da aula
		if contadorProfFalasButton == 3 and Global.ComecarFala_Da_ProfDepoisDaula == true: # terceira vez que se aperta
			$ProfessoraFalas/FalaProfessora.text = "Sei que a parte matemática pode assustar, mas está tudo bem, eu te ajudarei quando houver matemática."
			$ProfessoraFalas/SairCvsaProf.visible = true
			$ProfessoraFalas/ProfFalasButton.visible = false
			Global.F1_objetivo6 = true
			Global.passaTempo(1)
	if Global.dia == 2:
		if contadorProfFalasButton == 4:
			$ProfessoraFalas/FalaProfessora.text = "Sua próxima aula é sobre custos diários, clique no botão para começá-la."
			$ProfessoraFalas/IniciarAula.visible = true
			$ProfessoraFalas/ProfFalasButton.visible = false
			
		if contadorProfFalasButton == 4 and Global.ComecarFala_Da_ProfDepoisDaula == true:
			$ProfessoraFalas/FalaProfessora.text = "Para essa primeira aula, vou te ajudar a calcular seu custo diário máximo. Para isso, insira a sua quantia de dinheiro atual abaixo."
			$ProfessoraFalas/Quest_1.visible = true
			
		if contadorProfFalasButton == 5:
			$ProfessoraFalas/FalaProfessora.text = "Fazendo as contas com o valor que você me passou, cheguei à conclusão de que você tem R$ " + str(CustoMax) + " para gastar por dia."
			$ProfessoraFalas/Quest_1.visible = false
			
	#		Global.Falar_Depois_DaAula = true # possibilita ele a falar com a prof depois da aula (area2D)
func _on_SairCvsaProf_pressed():
	$ProfessoraFalas.visible = false # desaparece o bagulho
		

var CustoMax
func _process(_delta):
	Global.Missao_1 = int($ProfessoraFalas/Quest_1.text)
	CustoMax = Global.Missao_1 / 30
	
	if contadorproximafalatio == 4 and Global.frango == true and Global.cogumelo == true:
		$TioClovisFalas/falastio.text = "Obrigado, " + str(Global.nome_jogador) + "! Farei comida agora, em uma horinha estará pronta."
		$TioClovisFalas/nextfala_tio.visible = false
		$TioClovisFalas/sairFala.visible = true
		$TioClovisFalas/sairFala/Atemais2.text = "Okay"
		Global.frango = false
		Global.cogumelo = false



# Conversa com o Japinha do Mercadinho, Senhor Lyorrei
var contadorJapaFalasButton = 0
func _on_JapaFalasButton_pressed(): # botão de falas do japinha
	contadorJapaFalasButton += 1
	if contadorJapaFalasButton == 1: # na primeira vez que se clica
		# Muda o texto
		$JapinhaFalas/Falaorg/FalaJapinha.text = "Enfim, como posso te ajudar?"
		$JapinhaFalas/Falaorg/SairCvsaJapa.visible = true
		$JapinhaFalas/Falaorg/BotaoComprarComida.visible = true

# Sair da conversa com o Japa
func _on_SairCvsaJapa_pressed():
	$JapinhaFalas/Falaorg.visible = false
	$JapinhaFalas/Falaorg/JapaFalasButton.visible = true


func _on_TextureButton_pressed():
	$JapinhaFalas/Comidinhas.visible = false
	$JapinhaFalas/Falaorg.visible = true


#fala vó
#fala vó
var contadorproximafalavo = 0
func _on_proximafalavo_pressed():
	contadorproximafalavo += 1
	if contadorproximafalavo == 1:
		#muda texto
		$VoFalas/falaVo.text = "Vamos, rápido! Você não pode perder essa oportunidade! Arrume suas malas para ir morar com seu tio em sua nova cidade."
		Global.passaTempo(1)
	if contadorproximafalavo == 2:
		$VoFalas/falaVo.text = "Para te ajudar, de 30 em 30 dias irei depositar 1000 BT$ em sua conta. Mas atenção Gracinha da vó, gaste com responsabilidade!"
		Global.passaTempo(1)
	if contadorproximafalavo == 3:
		$VoFalas/falaVo.text = "Não enviarei renda extra caso seus BT$ acabem! Bom, sem enrolação, você precisa pedir um táxi para ir já já!"
		Global.passaTempo(1)
	if contadorproximafalavo == 4:
		$VoFalas/falaVo.text = "Para isso, abra o seu celular, entre no mapa, selecione a opção TÁXI e, em seguida, a casa do seu tio. Boa sorte e tome muito cuidado meu tesouro!"
		$VoFalas/tchau_vo.visible = true
		$VoFalas/proximafalavo.visible = false
		Global.ExclamacaoTio = true
		Global.passaTempo(1)
	



#sair fala vó
var contadorproximafalatio = 0
func _on_nextfala_tio_pressed():
	contadorproximafalatio += 1
	if Global.dia == 1:
		if contadorproximafalatio == 1:
			$TioClovisFalas/falastio.text = "Sei que você acabou de chegar, mas não tem tempo a perder. A secretária da faculdade me ligou agora pouco pedindo para pagar a mátricula."
			Global.passaTempo(1)
		if contadorproximafalatio == 2:
			Global.passaTempo(1)
			$TioClovisFalas/falastio.text = "Soube que sua avó te deu dinheiro, então você poderia pegar um ônibus até a faculdade e pagar a taxa..."
		if contadorproximafalatio == 3:
			Global.passaTempo(1)
			$TioClovisFalas/falastio.text = "Abra o celular e vá de ônibus até a faculdade falar com a Secretária"
			$TioClovisFalas/nextfala_tio.visible = false
			$TioClovisFalas/sairFala.visible = true
			Global.ExclamacaoSecr = true 
	if Global.dia == 2:
		if contadorproximafalatio == 4:
			Global.passaTempo(1)
			$TioClovisFalas/falastio.text = "Farei um strogonofe de Leão hoje, pode ir ao mercado e comprar frango e cogumelo, por gentileza?"
			$TioClovisFalas/nextfala_tio.visible = false
			$TioClovisFalas/sairFala.visible = true
			$TioClovisFalas/sairFala/Atemais2.text = "Claro!"
		
		if contadorproximafalatio == 5:
			pass




# Nin Yang
func _on_ComprarButton_NinYang2_pressed():
	$Nin_YangFalas/Falaorg/Falas_Do_NinYang.text = "O que você deseja comprar?"
	$Nin_YangFalas/Falaorg/ComprarButton_NinYang2.visible = false
	$Nin_YangFalas/Falaorg/SairCvrs_NinYang.visible = false
	$Nin_YangFalas/Falaorg/Comprar_Bicicleta.visible = true
	$Nin_YangFalas/Falaorg/Comprar_avatares.visible = true
func _on_SairCvrs_NinYang_pressed():
	$Nin_YangFalas/Falaorg.visible = false
func _on_Comprar_avatares_pressed():
	$Nin_YangFalas/Falaorg.visible = false
	$Nin_YangFalas/Avatares.visible = true

func _on_Sair_NinYang_pressed():
	$Nin_YangFalas.visible = false
#	if $Nin_YangFalas/Falas_Do_NinYang.text == 


func _on_VoltarAvatar_pressed():
	$Nin_YangFalas/Falaorg.visible = true
	$Nin_YangFalas/Avatares.visible = false
	
	$Nin_YangFalas/Falaorg/Falas_Do_NinYang.text = "O que você deseja comprar?"
	$Nin_YangFalas/Falaorg/SairCvrs_NinYang.visible = true
