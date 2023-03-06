extends default_enemy




var attack_cooldown = 1
var target


func _physics_process(delta):
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	
	velocity = velocity.move_toward(new_velocity, 0.25)
	move_and_slide()
	
func update_target_location(target_location):
	nav_agent.set_target_position(target_location)


func attack():
	target.take_damage(damage)
	$Attack_radius/Attack_cooldown_timer.start(attack_cooldown)

func _on_attack_radius_body_entered(body):
	if body.is_in_group("player"):
		target = body
		attack()

func _on_attack_cooldown_timer_timeout():
	attack()

func _on_attack_radius_body_exited(body):
	if body.is_in_group("player"):
		$Attack_radius/Attack_cooldown_timer.stop()
