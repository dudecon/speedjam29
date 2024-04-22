extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _pressed():
	$"../LeaderDisplayButton".button_pressed = true
	disabled = true
	$".".owner.escaped_score = $".".owner.current_score
	%"Final Score".text = str($".".owner.escaped_score)
	%Submit.visible = true
	$"Escaped 1".play(0)
	text = "ESCAPED!"
