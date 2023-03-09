extends Label


var current_frame = 0
var checking_frame = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_frame >= checking_frame:
		set_text("fps:" + str(Engine.get_frames_per_second()))
		current_frame = 0
	current_frame += 1	
	
	
