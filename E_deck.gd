extends Button


var countdown
var COOLDOWN = 1

func _getEchars():
	var latest = $".".owner.player_brain["known"].keys()
	if len(latest):
		text = latest.pick_random()
	else:
		countdown = COOLDOWN

# Called when the node enters the scene tree for the first time.
func _ready():
	text = ""
	countdown = COOLDOWN


func _pressed():
	if text == "":
		pass
	else:
		# do the conversation thing
		text = ""
		countdown = COOLDOWN

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if countdown > 0:
		countdown -= delta
		if countdown <= 0:
			_getEchars()
