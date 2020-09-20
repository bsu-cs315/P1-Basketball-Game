# Detect when the player object enters the target, if so
# plays an animation for a few seconds
extends StaticBody2D

var target_hit := false

onready var _hit_animator = $HitAnimator

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	target_hit = true
	var timer = Timer.new()
	timer.set_wait_time(2.2)
	_hit_animator.play('hit_detected')
	add_child(timer)
	timer.start()
	yield(timer, "timeout")
	_hit_animator.stop()
