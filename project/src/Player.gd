# Controls motion of Player node and applies animation
# when launched
extends RigidBody2D

var is_launched := false

onready var angle_slider_node = $HUD/AngleSlider
onready var strength_slider_node = $HUD/StrengthSlider
onready var angle_arrow_node = $HUD/AngleArrow
onready var launch_sound_node = $LaunchSound
onready var launch_animation_node = $AnimatedSprite
		
func _process(delta):
	var vec_one = angle_slider_node.value
	var strgh = strength_slider_node.value
	var dir = Vector2(vec_one,-1).normalized()
	var vel = dir * strgh
	angle_arrow_node.rotation_degrees = _calculateAngle(vel.x,vel.y)
	if Input.is_action_just_pressed("launch"):
		emit_signal("sleeping_state_changed")
		if is_launched == false:
			is_launched = true
			launch_sound_node.play()
			apply_impulse(Vector2.ZERO,vel)
			
func _on_Player_sleeping_state_changed():
	if Input.is_action_just_pressed("launch"):
		launch_animation_node.play("moving")
		
		
func _integrate_forces(state):
	set_scale(Vector2(-1, 1))
	

func _calculateAngle(x,y):
	if x == 0:
		x = 0.1
	var angle = atan(y/x)
	if angle > -0.1:
		angle = 0.0
	return rad2deg(angle)
