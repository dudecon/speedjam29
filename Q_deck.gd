extends Button


func _getQchar():
	var latest = $".".owner.player_brain["latest"]
	if len(latest):
		text = latest.pick_random()

# Called when the node enters the scene tree for the first time.
func _ready():
	text = ""


func _pressed():
	if text == "":
		_getQchar()
	else:
		# do the conversation thing
		_getQchar()
