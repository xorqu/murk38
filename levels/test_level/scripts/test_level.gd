extends Node3D


@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	var mesh_instances = $Geometry.get_child(0).get_children()
	print(mesh_instances)
	for mesh_instance in mesh_instances:
		for index in mesh_instance.mesh.get_surface_count():
			var material = mesh_instance.mesh.surface_get_material(index)
			material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_tree().call_group("enemy", "update_target_location", player.global_transform.origin )
