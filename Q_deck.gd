extends Button


var countdown
var COOLDOWN = 0.618
var SOCIAL_COST = 1
var scene_root

func _getQchar():
	var latest = scene_root.player_brain["latest"]
	if len(latest):
		text = latest.pick_random()
		if randi_range(0,3) == 0:
			scene_root._update_social(-SOCIAL_COST)

# Called when the node enters the scene tree for the first time.
func _ready():
	text = ""
	countdown = COOLDOWN
	scene_root = $".".owner


func _pressed():
	if text == "":
		pass
	else:
		$".".owner._deliver_soliliquy(text)
		text = ""
		countdown = COOLDOWN
		scene_root._update_social(-SOCIAL_COST)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if countdown > 0 and $".".owner.visible:
		countdown -= delta
		if countdown <= 0:
			_getQchar()
			countdown = COOLDOWN
