extends default_item
class_name ammo_item


var count = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body is player:
		body.get_inventory().collect_ammo(self)
		self.queue_free()

func get_count():
	return count
