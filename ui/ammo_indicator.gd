extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update(current_weapon_id):
	set_text(str(get_tree().get_first_node_in_group("player").inventory[1][current_weapon_id]))


func _input(event: InputEvent) -> void:
	update(get_tree().get_first_node_in_group("player").current_weapon_id)
