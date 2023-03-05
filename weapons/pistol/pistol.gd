extends Node3D

var damage = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire(raycast):
	$Shot_sound.play()
	if raycast.is_colliding():
		if raycast.get_collider().is_in_group("enemy") and !raycast.get_collider().is_in_group("player"):
			var target = raycast.get_collider()
			target.get_damage(damage)
			
		else:
			pass


