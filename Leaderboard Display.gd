extends Button

func _ready():
	$"../Leaderboard".visible = false
	#$"../AccomplishedLabel".visible = false
	
func _toggled(toggled_on):
	$"../Leaderboard".visible = toggled_on
	if toggled_on:
		$"../Leaderboard"._get_leaderboards()
