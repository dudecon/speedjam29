extends Button

func _ready():
	%Leaderboard.visible = false


func _toggled(toggled_on):
	if toggled_on:
		%LeaderDisplay.target_height = 660
		%LeaderDisplay.target_alpha = 1.0
		%Leaderboard.visible = true
		%Leaderboard._get_leaderboards()
	else:
		%LeaderDisplay.target_height = 0
		%LeaderDisplay.target_alpha = 0.3
