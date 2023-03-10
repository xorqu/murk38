extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_button_pressed():
	get_tree().quit()


func _on_start_button_pressed():
	$VBoxContainer.set_visible(false)
	$Levels_list.set_visible(true)


func _on_test_level_button_pressed():
	get_tree().change_scene_to_file("res://levels/test_level/scenes/test_level.tscn")


func _on_levels_list_back_button_pressed():
	$VBoxContainer.set_visible(true)
	$Levels_list.set_visible(false)
