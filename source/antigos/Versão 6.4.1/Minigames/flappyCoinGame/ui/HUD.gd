extends CanvasLayer

onready var pontuacaoLabel = $Score

func atualizarPontuacao(ponto):
	pontuacaoLabel.text = str(ponto)
	
