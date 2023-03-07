extends Node

var inventory = [[null,null,null,null,null],["inf",0,0,0,0]]
var weapon_pointer = 0

@onready var weapon_marker = $"../Camera3D/Weapon_marker"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event: InputEvent) -> void:
	#weapon_selection
	if Input.is_action_just_pressed("1"):
		setup_weapon(0)
	if Input.is_action_just_pressed("2"):
		setup_weapon(1)
	if Input.is_action_just_pressed("scroll_up"):
		if (weapon_pointer + 1) != inventory[0].size():
			weapon_pointer += 1
			setup_weapon(weapon_pointer)
	if Input.is_action_just_pressed("scroll_down"):
		if weapon_pointer != 0:
			weapon_pointer -= 1
			setup_weapon(weapon_pointer)	

func collect_weapon(item):
	print("collect weapon: " + str(item))
	#parsing item type
	if item is pistol_item:
		inventory[0][0] = Global.pistol_packed
		setup_weapon(0)
	elif item is shotgun_item:
		inventory[0][1] = Global.shotgun_packed

func collect_ammo(item):
	print("collect ammo: ")

func setup_weapon(id):
	#clean existant weapon
	if weapon_marker.get_child_count() > 0:
		weapon_marker.get_child(0).queue_free()
	#setup only if weapon is in inventory (olready collected)
	if inventory[0][id] != null:
		var weapon = inventory[0][id].instantiate()
		weapon_marker.add_child(weapon)
		weapon_pointer = id
	else:
		pass

