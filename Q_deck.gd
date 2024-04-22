extends Button


var countdown
var COOLDOWN = 0.618

func _getQchar():
	var latest = $".".owner.player_brain["latest"]
	if len(latest):
		text = latest.pick_random()

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
		$"../..".social_battery -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if countdown > 0:
		countdown -= delta
		if countdown <= 0:
			_getQchar()
			countdown = COOLDOWN
