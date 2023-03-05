extends CharacterBody3D
class_name default_enemy

var SPEED = 3.0
var hp = 100
@onready var nav_agent = $NavigationAgent3D

func get_damage(damage):
	hp -= damage
	if hp <= 0:
		death()
		

func death():
	queue_free()
