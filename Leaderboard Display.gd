extends Button

func _ready():
	$"../Leaderboard Text".visible = false
	#$"../AccomplishedLabel".visible = false
	
func _toggled(toggled_on):
	$"../Leaderboard Text".visible = toggled_on
	if toggled_on:
		$".."._get_leaderboards()
