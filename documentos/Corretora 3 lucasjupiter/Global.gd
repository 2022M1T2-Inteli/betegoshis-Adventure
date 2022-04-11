extends Node

var Morrer = false

var dinheiro = 1000.00
var player_name
var temBicicleta = false
var precoTaxi = 20
var precoOnibus = 8
var precoBike = 0
var Gastos_LojaDeItens : Array = []
var Gastos_transporte : Array = []
var Gastos_arcade : Array = []
var Gastos_mercado : Array = []
var Gastos_corretora : Array = []


var quantidadeTaxiRV = 0 
# Aulas/Professora
var comecarAula = false
var ComecarFala_Da_ProfDepoisDaula = false
var Quest_1

var coinJump = false
var tomouDano = false
# Variáveis relacionadas para os teleportes
var inicio_1 = false
var Pong_Game = false
var flapCoin_Game = false
var tiroCoin_Game = false

# Variáveis das barras de energia, fome etc

var BarraEnergia = 100
var BarraFome = 100
var BarraFelicidade = 100

var MenosEnergia = 0.0007
var MenosFome = 0.002
var MenosFelicidade = 0.001


# Variáveis relacionadas aos objetivos do protagonista
var F1_objetivo1 = false
var F1_objetivo2 = false
var F1_objetivo3 = false
var F1_objetivo4 = false
var F1_objetivo5 = false
var F1_objetivo6 = false
var F1_objetivo7 = false
var F1_objetivo8 = false

var F2_objetivo1 = false
var frango = false
var cogumelo = false
var F2_objetivo2 = false
var F2_objetivo3 = false
var F2_objetivo4 = false
var F2_objetivo5 = false

# Tempo
var Tempo = true
var dia = 1
var hora = 8
var minuto = 0
var sent = 0
var FaculdadeTime = 8 # 8 segundos = 1 minuto
var ArcadeTime = 2 # 2 segugundos = 1 minuto
var ShopTime = 5 # Mercadinho, Lojinha e Banco (5 sec = 1 min)
var CidadeTime = 6 # 6 segundos = 1 minuto
var TimeVelocity = 1
var tempoTaxi = 10
var tempoOnibus = 20
var tempoBike = 30

func passaTempo(taime):
	Global.minuto += taime
	if Global.minuto >= 60:
		Global.hora += 1
		Global.minuto = (Global.minuto - 60)


# Contadores

var select 
var corretora = {
			'bought' : [false, false, false, false,],
			'selected': 0,
}

var inflacao
var cdi

var price_grow : float = 0.0



#var save_corretora_path = 'user:'



#func save_corretora():
#		var file = File.new()
##		file.open(save_corretora_path, file.WRITE_READ)
#		file.corretora_var(corretora)
#		file.close()


#func load_corretora():
#	var file = File.new()
##	if not file.file_exists(save_corretora_path):
#		return false
#	file.open(save_corretora_path, file.READ)
#	corretora = file.get_var()
#	file.close()
#	return true


