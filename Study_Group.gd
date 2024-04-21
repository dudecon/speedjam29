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
	"mem_cap"     : 2
}

func _add_to_known(stuff):
	var known = player_brain["known"]
	stuff.replace("\n","")
	for c in stuff:
		#if c == "\n": continue
		if c in known:
			known[c] += 1
		else:
			known[c] = 1
	print(known)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
