extends Button

var usersettings

# Called when the node enters the scene tree for the first time.
func _ready():
	usersettings = get_node("/root/UserSettings")
	print(name)
	if usersettings.helphidden[name]:
		modulate[3] = 0.2

func _toggled(toggled_on):
	$Control.visible = toggled_on
	if !toggled_on:
		modulate[3] = 0.2
		usersettings.helphidden[name] = true
	else:
		modulate[3] = 1
		usersettings.helphidden[name] = false
