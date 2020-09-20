# "World" script that uses _ready and _process to continually
# check for a game over and display corresponding data
extends Node2D

onready var PlayerNode = $Player
onready var TargetNode = $Target
onready var WinLabelNode = $Player/GameOver/WinLabel
onready var LoseLabelNode = $Player/GameOver/LoseLabel
onready var ReloadGameLabel = $Player/GameOver/ReloadGameLabel
onready var title_screen = load("res://src/TitleScreen.tscn").instance()
onready var reload_scene = load("res://src/Level.tscn").instance()

func _ready():
	WinLabelNode.hide()
	LoseLabelNode.hide()
	ReloadGameLabel.hide()


func _process(delta):
	if Input.is_action_just_pressed("return_to_menu"):
		queue_free()
		get_tree().get_root().add_child(title_screen)
	if Input.is_action_just_pressed("reload_scene"):
		queue_free()
		get_tree().get_root().add_child(reload_scene)
	_checkForGameOver()


func _checkForGameOver():
	if (PlayerNode.is_launched and PlayerNode.angular_velocity < -0.2) or (PlayerNode.is_launched and PlayerNode.angular_velocity > 0.3):
		if(TargetNode.hit_indicator == 1):
			_gameWin()
		if TargetNode.hit_indicator == 0:
			_gameLoss()
	
	
func _gameWin():
	ReloadGameLabel.show()
	WinLabelNode.show()
	
	
func _gameLoss():
	ReloadGameLabel.show()
	LoseLabelNode.show()
