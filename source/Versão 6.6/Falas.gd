extends CanvasLayer

#"O que você deseja pagar hoje?"
# Falas do Banqueiro Guilherme 
var contadorGuiFalasButton = 0
func _on_BotaoFalasGui_pressed(): 
	if Global.dia == 1:
		contadorGuiFalasButton += 1 
		if contadorGuiFalasButton == 1:
			Global.passaTempo(1)
			$GuilhermeFalas/FalaGuilherme.text = "O que você deseja hoje?" 
			$GuilhermeFalas/SairCvsaGui.visible = true
			$GuilhermeFalas/BotaoFalasGui.disabled = true
			if Global.boleto == true:
				$GuilhermeFalas/PagarBoleto.visible = true 
		if contadorGuiFalasButton == 2:
			pass
func _on_SairCvsaGui_pressed():
	$GuilhermeFalas.visible = false 
	get_parent().get_parent().desligarCelularControle(true)
func _on_SairCvsaRafa_pressed(): 
	$RafaelFalas.visible = false 
	get_parent().get_parent().desligarCelularControle(false)

# Falas da Secretária
func _on_SecrFalasButton_pressed(): 
	if Global.dia == 1:
		Global.contadorBotaoSecrFalas += 1 
		if Global.contadorBotaoSecrFalas == 1: 
			Global.passaTempo(1)
			$SecretariaFalas/FalaSecretaria.text = "Imagino que tenha vindo aqui para pagar a taxa de matrícula, certo?"
		if Global.contadorBotaoSecrFalas == 2: 
			Global.passaTempo(1)
			$SecretariaFalas/FalaSecretaria.text = "Certo, então aqui está o boleto no valor de BT$ 80,00 para você pagar no banco."
		if Global.contadorBotaoSecrFalas == 3: 
			Global.passaTempo(1)
			$SecretariaFalas/FalaSecretaria.text = "Agora vá até o banco e pague o boleto, depois volte aqui para a primeira aula."
			$SecretariaFalas/SairCvsaSecr.visible = true 
			$SecretariaFalas/SecrFalasButton.visible = false
			
			get_parent().get_node("Dinheiro/Boleto").visible = true
			Global.boleto = true
			$GuilhermeFalas/PagarBoleto.visible = true
			
			Global.ExclamacaoGui = true
		if Global.contadorBotaoSecrFalas == 4 and Global.F1_objetivo4 == true:
			Global.passaTempo(1)
			$SecretariaFalas/FalaSecretaria.text = "Com isso, você já pode assistir à sua primeira aula. É só continuar reto e virar à primeira esquerda. Boa aula!"
			$SecretariaFalas/SairCvsaSecr.visible = true
			Global.objetivo5 = true
func _on_SairCvsaSecr_pressed(): 
	$SecretariaFalas.visible = false 
	get_parent().get_parent().desligarCelularControle(true)
	if Global.objetivo4 == true and Global.dia == 1:
		Global.objetivo5 = true

# Conversa com a Professora 
func _on_BotaoFalasProf_pressed(): 
	Global.contadorBotaoProfFalas += 1 
	if Global.dia == 1:
		if Global.contadorBotaoProfFalas == 1:
			Global.passaTempo(1)
			$ProfessoraFalas/FalaProfessora.text = "Começaremos com uma mini-aula para você entender um pouco sobre matemática financeira."
		if Global.contadorBotaoProfFalas == 2:
			Global.passaTempo(1)
			$ProfessoraFalas/FalaProfessora.text = "Clique no botão para começá-la."
			$ProfessoraFalas/IniciarAula.visible = true 
			$ProfessoraFalas/BotaoFalasProf.disabled = true
		# Depois da aula
		if Global.contadorBotaoProfFalas == 3 and Global.ComecarFala_Da_ProfDepoisDaula == true: # terceira vez que se aperta
			$ProfessoraFalas/FalaProfessora.text = "Sei que a parte matemática pode assustar, mas está tudo bem, eu te ajudarei quando houver matemática."
			$ProfessoraFalas/BotaoFalasProf.disabled = false
			Global.passaTempo(1)
		if Global.contadorBotaoProfFalas == 4:
			$ProfessoraFalas/FalaProfessora.text = "Agora, por uma questão de cronograma, vamos iniciar a aula de Gastos Diários também."
		if Global.contadorBotaoProfFalas == 5:
			$ProfessoraFalas/FalaProfessora.text = " Aperte no botão para começá-la."
			$ProfessoraFalas/BotaoFalasProf.disabled = true
			$ProfessoraFalas/IniciarAula.visible = true
			Global.passaTempo(1)
		if Global.contadorBotaoProfFalas == 5 and Global.ComecarFala_Da_ProfDepoisDaula == true:
			$ProfessoraFalas/FalaProfessora.text = "Para essa primeira aula, vou te ajudar a calcular seu custo diário máximo. Para isso, coloque seu dinheiro total ao lado."
			$ProfessoraFalas/Quest_1.visible = true
			$ProfessoraFalas/SairCvsaProf.visible = false
			$ProfessoraFalas/BotaoFalasProf.disabled = true
			Global.passaTempo(1)
		if Global.contadorBotaoProfFalas == 6:
			$ProfessoraFalas/FalaProfessora.text = "Dividindo esse valor pela quantidade de dias no mês, cheguei à conclusão de que você tem R$ " + str(CustoMax) + " para gastar por dia."
			$ProfessoraFalas/Quest_1.visible = false
			$GuilhermeFalas/BotaoFalasProf.disabled = false
			Global.passaTempo(3)
		if Global.contadorBotaoProfFalas == 7:
			$ProfessoraFalas/FalaProfessora.text = "É isso por hoje, agora você pode ver seus custos máximo e mínimo no app do banco, até amanhã!"
			Global.passaTempo(1)
		if Global.contadorBotaoProfFalas == 8:
			$ProfessoraFalas/FalaProfessora.text = "Aliás, para a aula de hoje há um aprofundamento, é só falar com o professor na sala ao lado. Até!"
			$ProfessoraFalas/SairCvsaProf.visible = true
			$ProfessoraFalas/BotaoFalasProf.disabled = true
			Global.passaTempo(1)
		if Global.dia == 2:
			pass
	#		Global.Falar_Depois_DaAula = true # possibilita ele a falar com a prof depois da aula (area2D)
func _on_SairCvsaProf_pressed():
	$ProfessoraFalas.visible = false # desaparece o bagulho
	get_parent().get_parent().desligarCelularControle(false)

var CustoMax 
func _on_CalcularGastosDiarios_pressed():
	$ProfessoraFalas/FalaProfessora.text = "Dividindo esse valor pela quantidade de dias no mês, cheguei à conclusão de que você tem BT$ " + str(CustoMax) + " para gastar por dia."
	$ProfessoraFalas/Quest_1.visible = false
	$ProfessoraFalas/BotaoFalasProf.disabled = false
	Global.Missao_1 = int($ProfessoraFalas/Quest_1.text)
	CustoMax = Global.dinheiro / 30
	if Global.CustoMax != Global.Missao_1:
		pass
	
func _process(_delta):
	if Global.dia == 2 and Global.contadorBotaoTioFalas == 4 and Global.frango == true and Global.cogumelo == true:
		$TioClovisFalas/falastio.text = "Obrigado, " + str(Global.nome_jogador) + "! Farei comida agora, em uma horinha estará pronta."
		$TioClovisFalas/nextfala_tio.visible = false
		$TioClovisFalas/sairFala.visible = true
		$TioClovisFalas/sairFala/Atemais2.text = "Okay"
		Global.frango = false
		Global.cogumelo = false



# Conversa com o Japinha do Mercadinho, Senhor Lyorrei
func _on_JapaFalasButton_pressed(): 
	Global.contadorBotaoJapaFalas += 1
	if Global.contadorBotaoJapaFalas == 1: 
		# Muda o texto
		$JapinhaFalas/Falaorg/FalaJapinha.text = "Enfim, como posso te ajudar?"
		$JapinhaFalas/Falaorg/SairCvsaJapa.visible = true
		$JapinhaFalas/Falaorg/BotaoComprarComida.visible = true
## Sair da conversa com o Japa
func _on_SairCvsaJapa_pressed():
	$JapinhaFalas/Falaorg.visible = false
	$JapinhaFalas/Falaorg/JapaFalasButton.visible = true
	get_parent().get_parent().desligarCelularControle(true)

func _on_VoltarComidaJapa_pressed():
	$JapinhaFalas/Comidinhas.visible = false
	$JapinhaFalas/Falaorg.visible = true

#fala vó
var contadorBotaoFalaVo = 0
func _on_proximafalavo_pressed():
	contadorBotaoFalaVo += 1
	if contadorBotaoFalaVo == 1:
		$VoFalas/falaVo.text = "Vamos, rápido! Você não pode perder essa oportunidade! Arrume suas malas para ir morar com seu tio em sua nova cidade."
		Global.passaTempo(1)
	if contadorBotaoFalaVo == 2:
		$VoFalas/falaVo.text = "Para te ajudar, de 30 em 30 dias irei depositar 1000 BT$ em sua conta. Mas atenção Gracinha da vó, gaste com responsabilidade!"
		Global.passaTempo(1)
	if contadorBotaoFalaVo == 3:
		$VoFalas/falaVo.text = "Não enviarei renda extra caso seus BT$ acabem! Bom, sem enrolação, você precisa pedir um táxi para ir já já!"
		Global.passaTempo(1)
	if contadorBotaoFalaVo == 4:
		$VoFalas/falaVo.text = "Para isso, abra o seu celular, entre no mapa, selecione a opção TÁXI e, em seguida, a casa do seu tio. Boa sorte e tome muito cuidado meu tesouro!"
		$VoFalas/tchau_vo.visible = true
		$VoFalas/proximafalavo.visible = false
		Global.ExclamacaoTio = true
		Global.passaTempo(1)
	



#sair fala vó
func _on_nextfala_tio_pressed():
	Global.contadorBotaoTioFalas += 1
	if Global.dia == 1:
		if Global.contadorBotaoTioFalas == 1:
			$TioClovisFalas/falastio.text = "Sei que você acabou de chegar, mas não temos tempo a perder. A secretária da faculdade me ligou agora pouco pedindo para pagar a mátricula."
			Global.passaTempo(1)
		if Global.contadorBotaoTioFalas == 2:
			Global.passaTempo(1)
			$TioClovisFalas/falastio.text = "Soube que sua avó te deu dinheiro, então você poderia pegar um ônibus até a faculdade e pagar a taxa, são só 80 reais..."
		if Global.contadorBotaoTioFalas == 3:
			Global.passaTempo(1)
			$TioClovisFalas/falastio.text = "Abra o celular e vá de ônibus até a faculdade falar com a Secretária"
			$TioClovisFalas/nextfala_tio.disabled = true
			$TioClovisFalas/sairFala.visible = true
			Global.ExclamacaoSecr = true 
	if Global.dia == 2:
		if Global.contadorBotaoJapaFalas == 4:
			Global.passaTempo(1)
			$TioClovisFalas/falastio.text = "Farei um strogonofe de Leão hoje, pode ir ao mercado e comprar frango e cogumelo, por gentileza?"
			$TioClovisFalas/nextfala_tio.visible = false
			$TioClovisFalas/sairFala.visible = true
			$TioClovisFalas/sairFala/Atemais2.text = "Claro!"
		
		if Global.contadorBotaoJapaFalas == 5:
			pass

func _on_sairFala_pressed():
	$TioClovisFalas.visible = false
	get_parent().get_parent().desligarCelularControle(true)
	if Global.dia == 1:
		Global.ExclamacaoSecr = true
		Global.objetivo2 = true




# Nin Yang
func _on_ComprarButton_NinYang2_pressed():
	$Nin_YangFalas/Falaorg/Falas_Do_NinYang.text = "O que você deseja comprar?"
	$Nin_YangFalas/Falaorg/ComprarButton_NinYang2.visible = false
	$Nin_YangFalas/Falaorg/SairCvrs_NinYang.visible = false
	$Nin_YangFalas/Falaorg/Comprar_Bicicleta.visible = true
	$Nin_YangFalas/Falaorg/Comprar_avatares.visible = true
func _on_SairCvrs_NinYang_pressed():
	$Nin_YangFalas/Falaorg.visible = false
	get_parent().get_parent().desligarCelularControle(true)
func _on_Comprar_avatares_pressed():
	$Nin_YangFalas/Falaorg.visible = false
	$Nin_YangFalas/Avatares.visible = true
func _on_VoltarAvatar_pressed():
	$Nin_YangFalas/Falaorg.visible = true
	$Nin_YangFalas/Avatares.visible = false
	
	$Nin_YangFalas/Falaorg/Falas_Do_NinYang.text = "O que você deseja comprar?"
	$Nin_YangFalas/Falaorg/SairCvrs_NinYang.visible = true
	$Nin_YangFalas/Falaorg/SairCvrs_NinYang/Label.text = "Sair"


