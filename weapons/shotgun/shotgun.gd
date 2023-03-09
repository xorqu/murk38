extends default_weapon


var ammo_slot_id = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	damage = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire(raycast, player):
	if player.get_inventory().get_ammo_count(ammo_slot_id) > 0:
		$Shot_sound.play()
		player.get_inventory().use_ammo(ammo_slot_id, 1)
		for i in range(7):
			raycast.set_rotation(Vector3(randf_range(PI/2-0.1, PI/2+0.1),randf_range(0,0.2),randf_range(0,0.2)))
			if raycast.is_colliding():
				if raycast.get_collider().is_in_group("enemy") and !raycast.get_collider().is_in_group("player"):
					var target = raycast.get_collider()
					target.take_damage(damage)
		raycast.set_rotation(Vector3(PI/2,0,0))
