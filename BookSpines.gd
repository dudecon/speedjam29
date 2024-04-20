extends Sprite2D

var yvals = [0,167,350,644,807,1178,1369,1589]
var book_bind

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _set_spine(s_y,s_color, book):
	region_rect.position.y = s_y
	modulate = s_color
	book_bind = book
