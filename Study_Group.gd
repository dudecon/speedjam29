extends Node2D
var usersettings

# this is where the player vocabulary lives
var player_brain
var social_battery
var social_books_locked
var npcs_cleared
var game_score

# Called when the node enters the scene tree for the first time.
func _ready():
	game_score = 0
	_update_score()
	npcs_cleared = 0
	_update_escape()
	var starting_memory = 4
	social_battery = 15
	social_books_locked = 0
	_update_social()
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
	_update_social(20,-1)
	#print("read",read)


func _add_to_studied(stuff, increment = 1):	
	_add_to_read(stuff, increment)
	var studied = player_brain["studied"]
	var memcap = player_brain["mem_cap"]
	studied.append(stuff)
	while len(studied) > memcap:
		studied.pop_front()
	_update_social(10,-5)
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
	_update_social(-2)

func _update_social(val=0, book_chng=0):
	social_battery += val
	if social_battery < 0: social_battery = 0
	social_books_locked += book_chng	
	%"social energy".text = str(social_battery)
	%Library._set_book_visibility(social_books_locked)
	#print("social battery ", social_battery)
	for card in $Social_Cards.get_children():
		card.disabled = card.SOCIAL_COST > social_battery
	%StudyBookButton.disabled = 55 < social_battery
	%ReadBookButton.disabled  = 105 < social_battery


func _update_score(val=0):
	game_score += val
	%score.text = str(game_score)
	$"../Leaderboard".current_score = game_score


func _update_escape(val=0):
	npcs_cleared += val
	%cleared.text = str(npcs_cleared)
	if npcs_cleared == 6:
		$"../Leaderboard"._allow_escape()


func _excluded_from_soliliquy(stuff):
	stuff = stuff.replace("\n","")
	for c in stuff:
		_update_score(-1)


func _deliver_soliliquy(stuff):
	for person in $"Study_Group/Social Buttons".get_children():
		if person.thoughts_exposed:
			person._deliver_soliliquy(stuff)
		else:
			_excluded_from_soliliquy(stuff)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

