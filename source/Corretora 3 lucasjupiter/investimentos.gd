extends Tabs

onready var price1 = str2var($control/Panel1/Label.text)
onready var price2 = str2var($control/Panel2/Label.text)
onready var price3 = str2var($control/Panel3/Label.text)
onready var price4 = str2var($control/Panel4/Label.text)
onready var panels = $control

func _process(_delta):
	$control.position.x = -$HScrollBar.value
	
func _ready():
#	Global.load_corretora()
	for item in range(panels.get_child_count()-2):
		if Global.corretora.bought[item]== true:
			panels.get_node('Panel'+str(item+1)).get_node('Button').text = 'Select'
#	panels.get_node('Panel'+str(Global.corretora.select+1)).get_node('Button').text = 'selected'
#	panels.get_node('Panel'+str(Global.corretora.select+1)).get_node('Button').add_to_group('selected')
	
	
	


func _selected(node, _no):
#	Global.load_corretora()
	for buttons in get_tree().get_nodes_in_group('selected'):
		buttons.text = 'select'
		buttons.remove_from_group('selected')
	node.text = 'selected'
	node.add_to_group('selected')
	
#	Global.save_corretora()
		
		
func _buy(price, item_no):
#	Global.load_corretora()
	if Global.money >= price:
		Global.money -= price
		Global.corretora.bought[item_no] = true
		panels.get_node('Panel'+str(item_no+1)).get_node('Button').text = 'Select'
#		Global.save_corretora()

	else:
		var rem = price - Global.money
		$ColorRect/Label.text = 'Voce precisa' + str(rem) + 'BT$ para comprar isso'
		$ColorRect.show()
#	else:
		_selected(panels.get_node('Panel'+str(item_no+1)).get_node('Button'), item_no)
		
		
#
#func _on_Button_pressed():
#	_buy(price1, 0)
#func _on_Button2_pressed():
#	_buy(price2, 1)
#func _on_Button3_pressed():
#	_buy(price3, 2)
#func _on_Button4_pressed():
#	_buy(price4, 3)

#Botões Renda Fixa:
func _on_ButtonExit_pressed():
	$ColorRect.hide()
func _on_VerMais_pressed():
	$control/Panel1/ColorRect_CDB.show()
	$control/Panel1/VerMais.hide()
	$control/Panel2.hide()
	$control/Panel3.hide()
	$control/Panel4.hide()
func _on_voltar_pressed():
	$control/Panel1/ColorRect_CDB.hide()
	$control/Panel1/VerMais.show()
	$control/Panel2.show()
	$control/Panel3.show()
	$control/Panel4.show()
func _on_VerMais2_pressed():
	$control/Panel2/ColorRect_LCA.show()
	$control/Panel2/VerMais2.hide()
	$control/Panel1.hide()
	$control/Panel3.hide()
	$control/Panel4.hide()
func _on_voltar2_pressed():
	$control/Panel2/ColorRect_LCA.hide()
	$control/Panel2/VerMais2.show()
	$control/Panel1.show()
	$control/Panel3.show()
	$control/Panel4.show()
func _on_VerMais3_pressed():
	$control/Panel3/ColorRect_LCI.show()
	$control/Panel3/VerMais3.hide()
	$control/Panel1.hide()
	$control/Panel2.hide()
	$control/Panel4.hide()
func _on_voltar3_pressed():
	$control/Panel3/ColorRect_LCI.hide()
	$control/Panel3/VerMais3.show()
	$control/Panel1.show()
	$control/Panel2.show()
	$control/Panel4.show()
func _on_VerMais4_pressed():
	$control/Panel4/ColorRect_Tesouro.show()
	$control/Panel4/VerMais4.hide()
	$control/Panel1.hide()
	$control/Panel2.hide()
	$control/Panel3.hide()
func _on_voltar4_pressed():
	$control/Panel4/ColorRect_Tesouro.hide()
	$control/Panel4/VerMais4.show()
	$control/Panel1.show()
	$control/Panel2.show()
	$control/Panel3.show()

#Botões Renda Variavel:
func _on_VerMaisTaxi_pressed():
	$control/Panel1/ColorRect_Taxi.show()
	$control/Panel1/VerMaisTaxi.hide()
	$control/Panel2.hide()
	$control/Panel3.hide()
	$control/Panel4.hide()
func _on_VoltarTaxi_pressed():
	$control/Panel1/ColorRect_Taxi.hide()
	$control/Panel1/VerMaisTaxi.show()
	$control/Panel1.show()
	$control/Panel2.show()
	$control/Panel3.show()
func _on_VerMaisBus_pressed():
	$control/Panel2/ColorRect_Bus.show()
	$control/Panel2/VerMaisBus.hide()
	$control/Panel1.hide()
	$control/Panel3.hide()
	$control/Panel4.hide()
func _on_voltarBus_pressed():
	$control/Panel2/ColorRect_Bus.hide()
	$control/Panel2/VerMaisBus.show()
	$control/Panel1.show()
	$control/Panel3.show()
	$control/Panel4.show()
func _on_VerMaisMercado_pressed():
	$control/Panel3/ColorRect_Mercado.show()
	$control/Panel3/VerMaisMercado.hide()
	$control/Panel1.hide()
	$control/Panel2.hide()
	$control/Panel4.hide()
func _on_voltarMercado_pressed():
	$control/Panel3/ColorRect_Mercado.hide()
	$control/Panel3/VerMaisMercado.show()
	$control/Panel1.show()
	$control/Panel2.show()
	$control/Panel4.show()
func _on_VerMaisBanco_pressed():
	$control/Panel4/ColorRect_Banco.show()
	$control/Panel4/VerMaisBanco.hide()
	$control/Panel1.hide()
	$control/Panel2.hide()
	$control/Panel3.hide()
func _on_voltarBanco_pressed():
	$control/Panel4/ColorRect_Banco.hide()
	$control/Panel4/VerMaisBanco.show()
	$control/Panel1.show()
	$control/Panel2.show()
	$control/Panel3.show()
#Botões Cripto:
func _on_VerMaisCripto1_pressed():
	$control/Panel1/ColorRect_Cripto1.show()
	$control/Panel1/VerMaisCripto1.hide()
	$control/Panel2.hide()
	$control/Panel3.hide()
	$control/Panel4.hide()
func _on_voltarCripto1_pressed():
	$control/Panel1/ColorRect_Cripto1.hide()
	$control/Panel1/VerMaisCripto1.show()
	$control/Panel2.show()
	$control/Panel3.show()
	$control/Panel4.show()
func _on_VerMaisCripto2_pressed():
	$control/Panel2/ColorRect_Cripto2.show()
	$control/Panel2/VerMaisCripto2.hide()
	$control/Panel1.hide()
	$control/Panel3.hide()
	$control/Panel4.hide()
func _on_voltarCripto2_pressed():
	$control/Panel2/ColorRect_Cripto2.hide()
	$control/Panel2/VerMaisCripto2.show()
	$control/Panel1.show()
	$control/Panel3.show()
	$control/Panel4.show()
func _on_VerMaisCripto3_pressed():
	$control/Panel3/ColorRect_Cripto3.show()
	$control/Panel3/VerMaisCripto3.hide()
	$control/Panel1.hide()
	$control/Panel2.hide()
	$control/Panel4.hide()
func _on_voltarCripto3_pressed():
	$control/Panel3/ColorRect_Cripto3.hide()
	$control/Panel3/VerMaisCripto3.show()
	$control/Panel1.show()
	$control/Panel2.show()
	$control/Panel4.show()
func _on_VerMaisCripto4_pressed():
	$control/Panel4/ColorRect_Cripto4.show()
	$control/Panel4/VerMaisCripto4.hide()
	$control/Panel1.hide()
	$control/Panel2.hide()
	$control/Panel3.hide()
func _on_voltarCripto4_pressed():
	$control/Panel4/ColorRect_Cripto4.hide()
	$control/Panel4/VerMaisCripto4.show()
	$control/Panel1.show()
	$control/Panel2.show()
	$control/Panel3.show()

#Botões Compra Renda Fixa/Renda Variavel/Cripto
#Botões Compra Renda Fixa
func _on_ButtonCompraCDB_pressed():
	pass # Replace with function body.
func _on_ButtonCompraLCA_pressed():
	pass # Replace with function body.
func _on_ButtonCompraLCI_pressed():
	pass # Replace with function body.
func _on_ButtonCompraTesouro_pressed():
	pass # Replace with function body.
#Botões Compra Renda Variavel
var acontecerUmaVez = false
var horaAtual1 = 0
var horaAtual2 = 0

func ready():
	horaAtual2 = horaAtual1
	horaAtual1 = Global.hora
	if horaAtual1 != horaAtual2:
		valorTaxiRV = valorTaxiRV - 3 + Global.vezesPegouTaxi * 1.2


func renderRV():
	valorTaxiRV = valorTaxiRV - 3
	

func _on_VendaButtonTaxi_pressed():
	Global.dinheiro += valorTaxiRV*(Global.quantidadeTaxiRV)
	Global.quantidadeTaxiRV = 0

var valorTaxiRV = 20
func _on_ButtonCompraTaxi_pressed():
	if Global.dinheiro > valorTaxiRV:
		Global.dinheiro -= valorTaxiRV
		Global.quantidadeTaxiRV += 1
  
	pass # Replace with function body.
func _on_ButtonCompraBus_pressed():
	pass # Replace with function body.
func _on_ButtonCompraMercado_pressed():
	pass # Replace with function body.
func _on_ButtonCompraBanco_pressed():
	pass # Replace with function body.



var dinheiroInvestidoCDB = 0
var dinheiroInvestidoLCI = 0 
var dinheiroInvestidoLCA = 0
var dinheiroInvestidoTesouro = 0

var line_editCDB = 0
var line_editLCI = 0
var line_editLCA = 0
var line_editTesouro = 0

var valorMinCDB = 100
var valorMaxCDB = 250

var valorMinLCA = 100
var valorMaxLCA = 250

var valorMinLCI = 100
var valorMaxLCI = 250

var valorMinTesouro = 100
var valorMaxTesouro = 250

# Investir CDB
func _on_InvestirCDB_pressed():
	line_editCDB = float(get_parent().get_node("RENDA FIXA/control/Panel1/ColorRect_CDB/line_edit").text)
	# digita o dinheiro num line_edit
	if Global.dinheiro > line_editCDB and valorMinCDB < line_editCDB and valorMaxCDB > line_editCDB:
		Global.dinheiro -= line_editCDB
		dinheiroInvestidoCDB += line_editCDB
	
#    Global.Gastos_Investimentos.append(-($line_edit.text))
var juros = 0
func render(capital):
	var juros = capital*0.1
	dinheiroInvestidoCDB += juros
	
	pass
var diaCompraCDB = 0
# Investir LCA
func _on_InvestirLCA_pressed():
	line_editLCA = float(get_parent().get_node("RENDA FIXA/control/Panel2/ColorRect_LCA/investirIsso").text)
	
	if Global.dinheiro > line_editLCA and valorMinLCA < line_editLCA and valorMaxLCA > line_editLCA:
		Global.dinheiro -= line_editLCA
		dinheiroInvestidoLCA += line_editLCA
		diaCompraCDB = Global.dia
	

func _on_ExtrairLCA_pressed():
	
	pass
