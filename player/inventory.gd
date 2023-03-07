extends Node

var inventory = [[0,0,0,0],["inf",1,2,3]]
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
	if Input.is_action_just_pressed("scroll_up") or Input.is_action_just_pressed("e"):
		if weapon_pointer+1 < inventory[0].size() and typeof(inventory[0][weapon_pointer+1]) != TYPE_INT:
			weapon_pointer += 1
			setup_weapon(weapon_pointer)
		elif weapon_pointer+2 < inventory[0].size() and typeof(inventory[0][weapon_pointer+2]) != TYPE_INT:
			weapon_pointer += 2
			setup_weapon(weapon_pointer)
		elif weapon_pointer+3 < inventory[0].size() and typeof(inventory[0][weapon_pointer+3]) != TYPE_INT:
			weapon_pointer += 3
			setup_weapon(weapon_pointer)

	if Input.is_action_just_pressed("scroll_down") or Input.is_action_just_pressed("q"):
		if weapon_pointer-1 >= 0 and typeof(inventory[0][weapon_pointer-1]) != TYPE_INT:
			weapon_pointer -= 1
			setup_weapon(weapon_pointer)
		elif weapon_pointer-2 >= 0 and typeof(inventory[0][weapon_pointer-2]) != TYPE_INT:
			weapon_pointer -= 2
			setup_weapon(weapon_pointer)
		elif weapon_pointer-3 >= 0 and typeof(inventory[0][weapon_pointer-3]) != TYPE_INT:
			weapon_pointer -= 3
			setup_weapon(weapon_pointer)
		
func collect_weapon(item):
	print("collect weapon: " + str(item))
	#parsing item type
	if item is pistol_item:
		inventory[0][0] = Global.pistol_packed
		setup_weapon(0)
	elif item is shotgun_item:
		inventory[0][1] = Global.shotgun_packed
		setup_weapon(1)
	elif item is plasmagun_item:
		inventory[0][2] = Global.plasma_packed
		setup_weapon(2)
	elif item is railgun_item:
		inventory[0][3] = Global.railgun_packed
		setup_weapon(3)
	
	
func collect_ammo(item):
	print("collect ammo: ")

func setup_weapon(id):
	#clean existant weapon
	if weapon_marker.get_child_count() > 0:
		weapon_marker.get_child(0).queue_free()
	#setup only if weapon is in inventory (olready collected)
	if typeof(inventory[0][id]) != TYPE_INT:
		var weapon = inventory[0][id].instantiate()
		weapon_marker.add_child(weapon)
		weapon_pointer = id
	else:
		pass

