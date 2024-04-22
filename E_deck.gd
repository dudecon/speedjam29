extends Button


var countdown
var COOLDOWN = 2.618

func _getEchars():
	var read = $".".owner.player_brain["read"]
	if len(read):
		text = read.pick_random()
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
