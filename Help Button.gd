extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _toggled(toggled_on):
	$Control.visible = toggled_on
	if !toggled_on:
		modulate[3] = 0.2
	else:
		modulate[3] = 1
