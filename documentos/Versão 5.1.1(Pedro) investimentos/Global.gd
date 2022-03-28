extends Node


var investimentos = 0
var corretora = {
			'bought' : [true, false, false]
}
	
	
	
#var save_corretora_path = 'user:'



func save_corretora():
		var file = File.new()
#		file.open(save_corretora_path, file.WRITE_READ)
		file.corretora_var(corretora)
		file.close()
		
		
func load_corretora():
	var file = File.new()
#	if not file.file_exists(save_corretora_path):
#		return false
#	file.open(save_corretora_path, file.READ)
	corretora = file.get_var()
	file.close()
	return true
	
	
	
	
var money = 700.00
var player_name

# Aulas/Professora
var comecarAula = false
var ComecarFala_Da_ProfDepoisDaula = false
var Quest_1



# Variáveis relacionadas para os teleportes
var inicio_1 = false
var Pong_Game = false

# Variáveis relacionadas aos objetivos do protagonista
var objetivo1 = false
var objetivo2 = false
var objetivo3 = false
var objetivo4 = false
var objetivo5 = false
var objetivo6 = false

# Tempo
var Tempo = true
var dia = 1
var hora = 6
var minuto = 0
var sent = 0

# Contadores



