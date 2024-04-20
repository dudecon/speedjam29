extends Label

var number = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	_update_count()

func _update_count(add = 0):
	number += add
	text = str(number)
