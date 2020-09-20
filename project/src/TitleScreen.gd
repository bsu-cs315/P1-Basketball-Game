# Title screen with a start button. Loads gameplay
# scene after button is pressed
extends Node2D

var _gameplay_scene = preload("res://src/Level.tscn").instance()

onready var _button = $HUD/Button
onready var _logo = $HUD/Logo
onready var _title_background = $Background

func _on_Button_pressed():
	_button.hide()
	_logo.hide()
	_title_background.free()
	get_tree().get_root().add_child(_gameplay_scene)
