extends Button

func _pressed():
	%Leaderboard.change_player_name()
	%Leaderboard._upload_score(%SpinBox.value)
