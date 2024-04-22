extends Button


func _getQchar():
	var latest = $".".owner.player_brain["latest"]
	print(latest)

# Called when the node enters the scene tree for the first time.
func _ready():
	text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	if text == "":
		_getQchar()
