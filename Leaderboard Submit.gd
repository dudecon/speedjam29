extends Button

func _pressed():
	$"../..".change_player_name()
	$"../.."._upload_score($SpinBox.value)
