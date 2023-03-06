extends CharacterBody3D
class_name default_enemy

@export var SPEED = 3.0
@export var hp = 100
@export var damage = 12


@onready var nav_agent = $NavigationAgent3D

func take_damage(dmg):
	hp -= dmg
	if hp <= 0:
		death()
		

func death():
	queue_free()

func attack():
	pass
