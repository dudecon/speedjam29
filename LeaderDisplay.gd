extends ColorRect

var target_height
var target_alpha
var ui_speed = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	target_height = 0
	$".".size.y = target_height
	target_alpha = 0
	$".".modulate[3] = target_alpha


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if %Leaderboard.visible:
		var curalpha = $".".modulate[3]
		var newalpha = curalpha + (target_alpha - curalpha) * ui_speed
		$".".modulate[3] = newalpha
		var curheight = $".".size.y
		var newheight = curheight + (target_height - curheight) * ui_speed
		$".".size.y = newheight
		if newheight < 10:
			%Leaderboard.visible = false
	
