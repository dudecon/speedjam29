extends Button


var countdown
var COOLDOWN = 3.618

var SOCIAL_COST = 12

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
		$".".owner._deliver_soliliquy(text)
		text = ""
		countdown = COOLDOWN
		$".".owner._update_social(-SOCIAL_COST)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if countdown > 0:
		countdown -= delta
		if countdown <= 0:
			_getRchars()
