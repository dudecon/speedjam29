extends Button


var countdown
var COOLDOWN = 3.618

func _getRchars():
	var studied = $".".owner.player_brain["studied"]
	if len(studied):
		text = studied.pick_random()
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
		$"../..".social_battery -= 12

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if countdown > 0:
		countdown -= delta
		if countdown <= 0:
			_getRchars()
