extends Button


var countdown
var COOLDOWN = 2.618

var WRAPWIDTH = 3

func _getEchars():
	var read = $".".owner.player_brain["read"]
	if len(read):
		var selected_text = read.pick_random()
		var text_list = []
		for c in selected_text:
			text_list.append(c)
		var new_text = ""
		while len(text_list) > WRAPWIDTH:
			for i in range(WRAPWIDTH):
				new_text += text_list.pop_front()
			new_text += "\n"
		for c in text_list:
			new_text += c
		text = new_text
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
