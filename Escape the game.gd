extends Button

func _pressed():
	$"../LeaderDisplayButton".button_pressed = true
	disabled = true
	$".".owner.escaped_score = $".".owner.current_score
	%"Final Score".text = str($".".owner.escaped_score)
	%Submit.visible = true
	$"Escaped 1".play(0)
	text = "ESCAPED!"
