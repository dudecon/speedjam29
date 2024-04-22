extends AudioStreamPlayer

var fadeout
var fadein
var countdown
var FADELENGTH = 1.618
var INTERSONG = 28.618
var MIDPOINT_OFFSET = 7.618
var LIBRARY_SONGS
var SOCIAL_SONGS
var song
var midpoint_toggle

# Called when the node enters the scene tree for the first time.
func _ready():
	LIBRARY_SONGS = $"Music Library".get_children()
	SOCIAL_SONGS = $"Music Social".get_children()
	song = LIBRARY_SONGS.pick_random()
	stream = song.stream
	volume_db = song.volume_db
	play(randf_range(MIDPOINT_OFFSET,stream.get_length()-MIDPOINT_OFFSET))
	#play(stream.get_length()-MIDPOINT_OFFSET)
	fadeout = false
	fadein = true
	pitch_scale = 0.01
	countdown = 0
	midpoint_toggle = false


func _switch_room():
	midpoint_toggle = true
	fadeout = true

func _play_random(song_library):
	var midpoint = midpoint_toggle
	midpoint_toggle = false
	song = song_library.pick_random()
	stream = song.stream
	volume_db = song.volume_db
	var playhead
	if midpoint:
		playhead = randf_range(MIDPOINT_OFFSET,stream.get_length()-MIDPOINT_OFFSET)
		fadein = true
		pitch_scale = 0.01
	else:
		playhead = 0#stream.get_length()-MIDPOINT_OFFSET
	play(playhead)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playing:
		#print(stream.resource_name," ",get_playback_position()," of ",stream.get_length())
		if fadein:
			pitch_scale += delta/FADELENGTH
			if pitch_scale > 1: fadein = false
		elif  fadeout:
			pitch_scale -= delta/FADELENGTH
			if pitch_scale < 0.02:
				fadeout = false
				stop()
				if midpoint_toggle:
					countdown = 0
				else:
					countdown = randf_range(INTERSONG*0.618,INTERSONG)
	else:
		countdown -= delta
		#print("countdown",countdown)
		if countdown <= 0:
			var library
			if %Social.visible:
				library = SOCIAL_SONGS
			else:
				library = LIBRARY_SONGS
			_play_random(library)
	

func _on_finished():
	#print("song finished")
	if song.get_child_count():
		_play_random(song.get_children())
	else:
		countdown = randf_range(INTERSONG*0.618,INTERSONG)


func _on_social_visibility_changed():
	_switch_room()
