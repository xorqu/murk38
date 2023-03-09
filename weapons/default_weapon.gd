extends Node3D
class_name default_weapon

var damage = 10
var ammo_slot_id = -1
var reload_time = 1
var is_reloaded = true

func fire(raycast, player):
	pass


func _on_reloading_timeout():
	is_reloaded = true
