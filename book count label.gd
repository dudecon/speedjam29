extends Label

var number = 4
# Called when the node enters the scene tree for the first time.
func _ready():
	_update_count(0)

func _update_count(add = 1):
	number += add
	if number < 3: number = 3
	%Social.player_brain["mem_cap"] = number
	text = str(number)
	
