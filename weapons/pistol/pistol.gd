extends default_weapon

func _ready():
	damage = 10
	ammo_slot_id = 0
	reload_time = 0.4

func fire(raycast, player):
	if is_reloaded:
		$Shot_sound.play()
		$Reloading.start(reload_time)
		is_reloaded = false
		if raycast.is_colliding():
			if raycast.get_collider().is_in_group("enemy"):
				var target = raycast.get_collider()
				target.take_damage(damage)
		

