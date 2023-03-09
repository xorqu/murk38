extends Node


#aliases
var PISTOL_SLOT = 0
var SHOTGUN_SLOT = 1
var PLASMAGUN_SLOT = 2
var RAILGUN_SLOT = 3

var SHOT_AMMO_SLOT = 1
var PLASMA_AMMO_SLOT = 2
var BOLT_AMMO_SLOT = 3

var WEAPON = 0
var AMMO = 1

var inventory = [[0,0,0,0],["inf",0,0,0]]
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
	if Input.is_action_just_pressed("1") and typeof(inventory[WEAPON][0]) != TYPE_INT:
		weapon_pointer = 0
		setup_weapon(weapon_pointer)
	if Input.is_action_just_pressed("2") and typeof(inventory[WEAPON][1]) != TYPE_INT:
		weapon_pointer = 1
		setup_weapon(weapon_pointer)
	if Input.is_action_just_pressed("3") and typeof(inventory[WEAPON][2]) != TYPE_INT:
		weapon_pointer = 2
		setup_weapon(weapon_pointer)
	if Input.is_action_just_pressed("4") and typeof(inventory[WEAPON][3]) != TYPE_INT:
		weapon_pointer = 3
		setup_weapon(weapon_pointer)

	if Input.is_action_just_pressed("scroll_up") or Input.is_action_just_pressed("e"):
		if weapon_pointer+1 < inventory[WEAPON].size() and typeof(inventory[WEAPON][weapon_pointer+1]) != TYPE_INT:
			weapon_pointer += 1
			setup_weapon(weapon_pointer)
		elif weapon_pointer+2 < inventory[WEAPON].size() and typeof(inventory[WEAPON][weapon_pointer+2]) != TYPE_INT:
			weapon_pointer += 2
			setup_weapon(weapon_pointer)
		elif weapon_pointer+3 < inventory[WEAPON].size() and typeof(inventory[WEAPON][weapon_pointer+3]) != TYPE_INT:
			weapon_pointer += 3
			setup_weapon(weapon_pointer)

	if Input.is_action_just_pressed("scroll_down") or Input.is_action_just_pressed("q"):
		if weapon_pointer-1 >= 0 and typeof(inventory[WEAPON][weapon_pointer-1]) != TYPE_INT:
			weapon_pointer -= 1
			setup_weapon(weapon_pointer)
		elif weapon_pointer-2 >= 0 and typeof(inventory[WEAPON][weapon_pointer-2]) != TYPE_INT:
			weapon_pointer -= 2
			setup_weapon(weapon_pointer)
		elif weapon_pointer-3 >= 0 and typeof(inventory[WEAPON][weapon_pointer-3]) != TYPE_INT:
			weapon_pointer -= 3
			setup_weapon(weapon_pointer)
		
func collect_weapon(item):
	print("collect weapon: " + str(item))
	#parsing item type
	if item is pistol_item:
		inventory[WEAPON][PISTOL_SLOT] = Global.pistol_packed
		setup_weapon(PISTOL_SLOT)
	elif item is shotgun_item:
		inventory[WEAPON][SHOTGUN_SLOT] = Global.shotgun_packed
		setup_weapon(SHOTGUN_SLOT)
	elif item is plasmagun_item:
		inventory[WEAPON][PLASMAGUN_SLOT] = Global.plasma_packed
		setup_weapon(PLASMAGUN_SLOT)
	elif item is railgun_item:
		inventory[WEAPON][RAILGUN_SLOT] = Global.railgun_packed
		setup_weapon(RAILGUN_SLOT)
	
func collect_ammo(item):
	print("collect ammo: " + str(item))
	#parsing ammo type
	if item is shot_ammo_item:
		inventory[AMMO][SHOT_AMMO_SLOT] += item.get_count()
	elif item is plasma_ammo_item:
		inventory[AMMO][PLASMA_AMMO_SLOT] += item.get_count()
	elif item is bolt_ammo_item:
		inventory[AMMO][BOLT_AMMO_SLOT] += item.get_count()


func setup_weapon(slot):
	#clean existant weapon
	if weapon_marker.get_child_count() > 0:
		for child in weapon_marker.get_children():
			child.queue_free()
	#setup only if weapon is in inventory (olready collected)
	if typeof(inventory[WEAPON][slot]) != TYPE_INT:
		var weapon = inventory[WEAPON][slot].instantiate()
		weapon_marker.add_child(weapon)
		weapon_pointer = slot
	else:
		pass

