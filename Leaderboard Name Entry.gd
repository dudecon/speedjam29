extends LineEdit

var usersettings

# Called when the node enters the scene tree for the first time.
func _ready():
	usersettings = get_node("/root/UserSettings")
	text = usersettings.playername


func _on_text_changed(new_text):
	usersettings.playername = new_text
