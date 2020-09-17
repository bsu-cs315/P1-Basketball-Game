extends RigidBody2D
# Controls motion of Player node and applies animation
# when launched
onready var AngleSliderNode = $HUD/AngleSlider
onready var StrengthSliderNode = $HUD/StrengthSlider
onready var AngleArrowNode = $HUD/AngleArrow

var launchChecker = false
# Used to see if projectile has been launched or not

var strength
var vector_one
		
func _process(delta):
	vector_one = AngleSliderNode.value
	strength = StrengthSliderNode.value
	var direction = Vector2(vector_one,-1).normalized()
	var velocity = direction * strength
	AngleArrowNode.rotation_degrees = _calculateAngle(velocity.x,velocity.y)
	if Input.is_action_just_pressed("launch"):
		emit_signal("sleeping_state_changed")
		if launchChecker == false:
			launchChecker = true
			$LaunchSound.play()
			apply_impulse(Vector2.ZERO,velocity)
			
			
func _integrate_forces(state):
	set_scale(Vector2(-1, 1))
	
	
func _on_Player_sleeping_state_changed():
	if Input.is_action_just_pressed("launch"):
		$AnimatedSprite.play("moving")
		
		
func _calculateAngle(x,y):
	if x == 0:
		x = 0.1
	var div_val = y/x
	var calculated_angle = atan(div_val)
	if calculated_angle > -0.1:
		calculated_angle = 0.0
	return rad2deg(calculated_angle)
