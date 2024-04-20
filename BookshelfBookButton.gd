extends Button

var booklist
var this_ID
var title
var contents
var times_read
var spine_y
var spine_color

# Called when the node enters the scene tree for the first time.
func _ready():
	booklist = %Library.all_books
	this_ID = len(booklist)
	booklist.append($".")
	title = ""
	contents = ""
	times_read = 0
	$".".visible = false
	modulate[3] = 0.4
	if len(booklist) == 394:
		%Library._set_book_visibility(394)

func _read_the_book():
	if times_read == 0:
		%"book count label"._update_count(1)
	times_read += 1
	#%BookSpines._set_spine(spine_y,spine_color, $".")
	modulate = Color(0,1,0,.8)
	contents = "you have now read book #"+ str(this_ID) + " a total of " + str(times_read)+" times"
	%BookOpener._open_book(contents)
	

func _on_pressed():
	if %BookSpines.book_bind == $".":
		_read_the_book()
	elif times_read == 0:
		spine_y = %BookSpines.yvals.pick_random()
		spine_color = Color(randf_range(.5,1),randf_range(.5,1),randf_range(.5,1))
		title = "this is book number " + str(this_ID)
		%BookSpines._set_spine(spine_y,spine_color, $".")
	else:
		%BookSpines._set_spine(spine_y,spine_color, $".")
	
	
