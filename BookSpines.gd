extends Sprite2D

var yvals = [0,167,350,644,807,1178,1369,1589,1774,1945,2105,2248,2402,2573,2739]
var book_bind
var countdown

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	countdown = 0

func _set_spine(s_y, s_color, title, book):
	region_rect.position.y = s_y
	modulate = s_color
	book_bind = book
	$Label.text = title
	visible = true
	countdown = 4

func _process(delta):
	if visible:
		countdown -= delta
		if countdown < 0:
			visible = false
		elif countdown < 1:
			modulate[3] = countdown
