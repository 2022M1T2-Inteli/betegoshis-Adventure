extends Node

var morrer = false

var dormir = false
var dinheiro = 1000.00
var nome_jogador
var temBicicleta = false

var precoTaxi = 20
var precoOnibus = 8
var precoBike = 0

var Gastos_LojaDeItens : Array = []
var Gastos_transporte : Array = []
var Gastos_arcade : Array = []
var Gastos_mercado : Array = []
var Gastos_boleto : Array = []

# Aulas/Professora
var comecarAula = false
var ComecarFala_Da_ProfDepoisDaula = false
var Missao_1

var Pular = false
var tomouDano = false
# Variáveis relacionadas para os teleportes
var inicio_1 = false
var inicio_2 = false
var Gabriela = 15 # gambiarra pro jogo começar tranquilamente
var CenaInvestimentos = false
var Jogo_Pong = false
var Jogo_flapCoin = false
var Jogo_tiroCoin = false
var Jogo_taxi = false

var pontuacaoNave = 0
var pontuacaoFlapCoin = 0
var Taxi_totalTempo = 10

var irTaxi = false
var irOnibus = false
var irBike = false

var irFaculdade = false
var irArcade = false
var irCasa = false
var irMercado = false
var irLoja = false
var irBanco = false


# Variáveis das barras de energia, fome etc
var BarraEnergia = 100
var BarraFome = 100
var BarraFelicidade = 100

var MenosEnergia = 0.0007
var MenosFome = 0.002
var MenosFelicidade = 0.001


# Variáveis relacionadas aos objetivos do protagonista
var objetivo1 = false
var objetivo2 = false
var objetivo3 = false
var objetivo4 = false
var objetivo5 = false
var objetivo6 = false
var objetivo7 = false
var objetivo8 = false
var objetivo9 = false
var objetivo10 = false

var boleto = false
var frango = false
var cogumelo = false

# Tempo
var Tempo = true
var dia = 1
var hora = 8
var minuto = 0
var sent = 0

var FaculdadeTempo = 8 # 8 segundos = 1 minuto
var ArcadeTempo = 2 # 2 segugundos = 1 minuto
var ShopTempo = 5 # Mercadinho, Lojinha e Banco (5 sec = 1 min)
var CidadeTempo = 6 # 6 segundos = 1 minuto
var VelocidadeTempo = 1

# Tempo que leva para ir a algum lugar com o modal
var tempoTaxi = 10
var tempoOnibus = 20
var tempoBike = 30

func passaTempo(taime):
	Global.minuto += taime
	if Global.minuto >= 60:
		Global.hora += 1
		if Global.daVerdade == true:
			Global.contInvest += 1
		Global.minuto = (Global.minuto - 60)


# Contadores
# Fazem aparecer o sinal de exclamação acima da cabeça de cada personagem
var ExclamacaoSecr = false 
var ExclamacaoGui = false
var ExclamacaoTio = false
var ExclamacaoVo = true

# Afim de manter os contadores com a troca de cenas
var contadorBotaoSecrFalas = 0
var contadorBotaoProfFalas = 0
var contadorBotaoJapaFalas = 0
var contadorBotaoVoFalas = 0
var contadorBotaoTioFalas = 0

var contadorBotaoAula = 0

var select # Avatar selecionado


var corretora = {
			'bought' : [false, false, false, false,],
			'selected': 0,
}
	
	
var contInvest = 0
var daVerdade = false
var quantidadeTaxiRV = 0 
var quantidadeBusRV = 0 
var quantidadeMercadoRV = 0 
var quantidadeBancoRV = 0 
var quantidadeCDB = 0
var quantidadeLCI = 0
var quantidadeLCA = 0
var quantidadeTesouro = 0
