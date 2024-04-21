extends Button

var been_pressed_countdown

# Called when the node enters the scene tree for the first time.
func _ready():
	been_pressed_countdown = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if been_pressed_countdown > 0:
		been_pressed_countdown -= delta
		if been_pressed_countdown <= 0:
			text = "Restart Game"
			button_pressed = false


func _on_pressed():
	if been_pressed_countdown > 0:
		get_tree().reload_current_scene()
	else:
		been_pressed_countdown = 2
		text = "ARE YOU SURE?"
