extends Node

@onready var pistol_packed = preload("res://weapons/pistol/pistol.tscn")
@onready var shotgun_packed = preload("res://weapons/shotgun/shotgun.tscn")
@onready var plasma_packed = preload("res://weapons/plasmagun/plasmagun.tscn")
@onready var railgun_packed = preload("res://weapons/railgun/railgun.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func get_player():
	return get_tree().get_first_node_in_group("player")
