# Detect when the player object enters the target, if so
# plays an animation for a few seconds
extends StaticBody2D
var hit_indicator = 0

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	hit_indicator = 1
	var timer = Timer.new()
	timer.set_wait_time(2.2)
	$HitAnimator.play('hit_detected')
	add_child(timer)
	timer.start()
	yield(timer, "timeout")
	$HitAnimator.stop()
