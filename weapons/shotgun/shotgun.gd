extends default_weapon


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	damage = 5
	ammo_slot_id = 1
	reload_time = 1.2
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire(raycast, player):
	if (player.get_inventory().get_ammo_count(ammo_slot_id) > 0) and is_reloaded:
		$Shot_sound.play()
		$Reloading.start(reload_time)
		is_reloaded = false
		player.get_inventory().use_ammo(ammo_slot_id, 1)
		for r in raycast.get_children():
			r.set_rotation(Vector3(randf_range(-0.1,0.1),0,randf_range(-0.1,0.1)))
			print(str(r.get_rotation()))
			if r.is_colliding():
				if r.get_collider().is_in_group("enemy"):
					var target = r.get_collider()
					target.take_damage(damage)
					print("hit " + str(target) + " dmg: " + str(damage))
