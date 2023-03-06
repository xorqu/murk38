extends default_item

var heal_hp = 25

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		body.heal(heal_hp)
	self.queue_free()
