extends AudioStreamPlayer

var fadeout
var fadein
var countdown
var FADELENGTH = 2.618
var INTERSONG = 2.618
var LIBRARY_SONGS

# Called when the node enters the scene tree for the first time.
func _ready():
	LIBRARY_SONGS = $"Music Library".get_children()
	var song = LIBRARY_SONGS.pick_random()
	stream = song.stream
	volume_db = song.volume_db
	play(randf_range(0,stream.get_length()))
	fadeout = false
	fadein = true
	pitch_scale = 0.01
	countdown = 0
	stream.resource_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playing:
		print(stream.resource_name," ",
			get_playback_position()," of ",stream.get_length())
		if fadein:
			pitch_scale += delta/FADELENGTH
			if pitch_scale > 1: fadein = false
	

func _on_finished():
	print("song finished")
