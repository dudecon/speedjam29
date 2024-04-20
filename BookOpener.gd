extends ColorRect

var target_width
var target_alpha
var ui_speed
var countdown

# Called when the node enters the scene tree for the first time.
func _ready():
	target_width = 0
	$".".size.x = target_width
	target_alpha = 0
	$".".modulate[3] = target_alpha
	visible = false
	countdown = 0

func _open_book(contents):
	$OpenBook.texture = $OpenBook.book_textures.pick_random().texture
	visible = true
	mouse_filter = Control.MOUSE_FILTER_STOP
	countdown = 5
	target_width = 1100
	$".".size.x = 522
	target_alpha = 1
	ui_speed = 3.5
	$Label.text = contents

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
		var curalpha = $".".modulate[3]
		var newalpha = curalpha + (target_alpha - curalpha) * ui_speed * delta
		$".".modulate[3] = newalpha
		var curwidth = $".".size.x
		var newwidth = curwidth + (target_width - curwidth) * ui_speed * delta
		$".".size.x = newwidth
		if countdown < 0:
			target_width = 0
			target_alpha = .3
			ui_speed = 0.7
			mouse_filter = Control.MOUSE_FILTER_IGNORE
		else:
			countdown -= delta
		if newwidth < 10:
			visible = false
	
