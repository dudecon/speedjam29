extends Node2D
var usersettings

# this is where the player vocabulary lives
var player_brain

# Called when the node enters the scene tree for the first time.
func _ready():
	usersettings = get_node("/root/UserSettings")
	player_brain = {
	"known"       : {},
	"latest"      : [],
	"read"        : [],
	"studied"     : [],
	"converse"    : {},
	"mem_cap"     : 4
}

func _add_to_known(stuff, increment = 1):
	stuff = stuff.replace("\n","")
	var known = player_brain["known"]
	for c in stuff:
		if c in known:
			known[c] += increment
		else:
			known[c] = increment
	print(known)


func _add_to_latest(stuff, increment = 1):
	stuff = stuff.replace("\n","")
	_add_to_known(stuff, increment)
	var latest = player_brain["latest"]
	var memcap = player_brain["mem_cap"]
	for c in stuff:
		latest.append(c)
	while len(latest) > memcap:
		latest.pop_front()
	print(latest)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
