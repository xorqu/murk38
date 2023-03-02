extends CharacterBody3D

var hp = 100

func _physics_process(delta):
	pass
	

func get_damage(damage):
	hp -= damage
	if hp <= 0:
		death()
		
				
func death():
	queue_free()
