extends default_weapon


func fire(raycast):
	$Shot_sound.play()
	if raycast.is_colliding():
		if raycast.get_collider().is_in_group("enemy") and !raycast.get_collider().is_in_group("player"):
			var target = raycast.get_collider()
			target.take_damage(damage)


