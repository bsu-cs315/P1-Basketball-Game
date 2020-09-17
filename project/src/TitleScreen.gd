# Title screen with a start button. loads gameplay
# scene after button is pressed
extends Node2D

var gameplay_scene = preload("res://src/Level.tscn").instance()
onready var ButtonNode = $HUD/Button
onready var LabelNode = $HUD/Label
onready var LogoNode = $HUD/Logo
onready var TitleBackground = $Background

func _on_Button_pressed():
	ButtonNode.hide()
	LabelNode.hide()
	LogoNode.hide()
	TitleBackground.free()
	get_tree().get_root().add_child(gameplay_scene)
