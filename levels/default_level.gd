extends Node3D
class_name default_level

# Called when the node enters the scene tree for the first time.
func _ready():
	texture_filtering_fix()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func texture_filtering_fix():
	var mesh_instances = $NavigationRegion3D.get_child(0).get_children()
	for mesh_instance in mesh_instances:
		for index in mesh_instance.mesh.get_surface_count():
			var material = mesh_instance.mesh.surface_get_material(index)
			material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC
