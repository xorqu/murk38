extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel") and !get_tree().is_paused():
		self.set_visible(true)
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().set_pause(true)
	elif Input.is_action_just_pressed("ui_cancel") and get_tree().is_paused():
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		get_tree().set_pause(false)
		self.set_visible(false)

func _on_resume_button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().set_pause(false)
	self.set_visible(false)


func _on_exit_button_pressed():
	get_tree().set_pause(false)
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
