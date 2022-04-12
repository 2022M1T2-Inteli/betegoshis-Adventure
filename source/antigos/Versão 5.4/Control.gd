extends Control

var soundoff_buttons = preload("res://images/buttons/audioOff.png")
var soundon_buttons = preload("res://images/buttons/audioOn.png")
var musicon_buttons = preload("res://images/buttons/musicOn.png")
var musicoff_buttons = preload("res://images/buttons/musicOff.png")
var sound = true
var music = true

func _on_TextureButton_pressed():
	if sound:
		sound = false
		$Sprite/TextureButton.texture_normal = soundoff_buttons
	else:
		sound = true
		$Sprite/TextureButton.texture_normal = soundon_buttons

func _on_TextureButton2_pressed():
	if music:
		music = false
		$Sprite/TextureButton2.texture_normal = musicoff_buttons
	else:
		music = true
		$Sprite/TextureButton2.texture_normal = musicon_buttons
