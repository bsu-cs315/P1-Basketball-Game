# "World" script that uses _ready and _process to continually
# check for a game over and display corresponding data
extends Node2D

onready var _player_node = $Player
onready var _target_node = $Target
onready var _win_label = $Player/GameOver/WinLabel
onready var _lose_label = $Player/GameOver/LoseLabel
onready var _reload_game_label = $Player/GameOver/ReloadGameLabel

onready var title_screen = load("res://src/TitleScreen.tscn").instance()
onready var reload_scene = load("res://src/Level.tscn").instance()

func _ready():
	_win_label.hide()
	_lose_label.hide()
	_reload_game_label.hide()


func _process(delta):
	if Input.is_action_just_pressed("return_to_menu"):
		queue_free()
		get_tree().get_root().add_child(title_screen)
	if Input.is_action_just_pressed("reload_scene"):
		queue_free()
		get_tree().get_root().add_child(reload_scene)
	_check_for_game_over()


func _check_for_game_over():
	if (_player_node.is_launched and _player_node.angular_velocity < -0.2) or (_player_node.is_launched and _player_node.angular_velocity > 0.3):
		if _target_node.target_hit:
			_game_win()
		if !_target_node.target_hit:
			_game_loss()
	
	
func _game_win():
	_reload_game_label.show()
	_win_label.show()
	
	
func _game_loss():
	_reload_game_label.show()
	_lose_label.show()
