extends Label

var number = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	_update_count(0)

func _update_count(add = 1):
	%Social.player_brain["mem_cap"] += add
	number = %Social.player_brain["mem_cap"]
	text = str(number)
	
