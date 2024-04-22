extends Node2D
var usersettings

# this is where the player vocabulary lives
var player_brain

# Called when the node enters the scene tree for the first time.
func _ready():
	var starting_memory = 4
	usersettings = get_node("/root/UserSettings")
	player_brain = {
	"known"       : {},
	"latest"      : [],
	"read"        : [],
	"studied"     : [],
	"converse"    : {},
	"mem_cap"     : 0
	}
	%"book count label"._update_count(starting_memory)

func _add_to_known(stuff, increment = 1):
	stuff = stuff.replace("\n","")
	var known = player_brain["known"]
	for c in stuff:
		if c in known:
			known[c] += increment
		else:
			known[c] = increment
	#print("known",known)


func _add_to_latest(stuff, increment = 1):
	stuff = stuff.replace("\n","")
	_add_to_known(stuff, increment)
	var latest = player_brain["latest"]
	var memcap = player_brain["mem_cap"]
	for c in stuff:
		latest.append(c)
	while len(latest) > memcap:
		latest.pop_front()
	#print("latest",latest)


func _add_to_read(stuff, increment = 1):
	_add_to_latest(stuff, increment)
	var read = player_brain["read"]
	var memcap = player_brain["mem_cap"]
	for p in stuff.split("\n",false):
		read.append(p)
	while len(read) > memcap:
		read.pop_front()
	print("read",read)


func _add_to_studied(stuff, increment = 1):
	_add_to_read(stuff, increment)
	var studied = player_brain["studied"]
	var memcap = player_brain["mem_cap"]
	studied.append(stuff)
	while len(studied) > memcap:
		studied.pop_front()
	#print("studied",studied)


func _add_to_conversation(stuff, character_name, increment = 1):
	stuff = stuff.replace("\n","")
	_add_to_latest(stuff, increment)
	var converse = player_brain["converse"]
	if character_name in converse:
		converse[character_name].append(stuff)
	else:
		converse[character_name] = [stuff,]
	var memcap = player_brain["mem_cap"]
	var charconv = converse[character_name]
	while len(charconv) > memcap:
		charconv.pop_front()
	#print("converse",converse)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
