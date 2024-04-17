extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _pressed():
	$"../..".change_player_name()
	$"../.."._upload_score($"../../../Hero_Ship".clocktime * 1000)
	$"../.."._get_leaderboards()
