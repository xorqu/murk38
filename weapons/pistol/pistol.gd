extends default_weapon

func _ready():
	damage = 10

func fire(raycast, player):
	$Shot_sound.play()
	if raycast.is_colliding():
		if raycast.get_collider().is_in_group("enemy"):
			var target = raycast.get_collider()
			target.take_damage(damage)


