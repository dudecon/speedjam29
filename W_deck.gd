extends Button

var countdown
var COOLDOWN = 1
var SOCIAL_COST = 2

func _getWchar():
	var convs_dict = $".".owner.player_brain["converse"]
	var conversations = convs_dict.keys()
	if len(conversations):
		var valid_social = []
		for social_nodes in conversations:
			if social_nodes.thoughts_exposed:
				valid_social.append(convs_dict[social_nodes])
		if len(valid_social):
			text = valid_social.pick_random().pick_random()
		else:
			countdown = COOLDOWN
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
			_getWchar()
