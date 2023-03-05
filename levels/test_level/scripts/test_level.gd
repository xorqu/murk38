extends default_level


@onready var player = $Player

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	update_enemies_target()
	

func update_enemies_target():
	get_tree().call_group("enemy", "update_target_location", player.global_transform.origin)
