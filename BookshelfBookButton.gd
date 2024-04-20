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
	if len(booklist) == 396:
		%Library._set_book_visibility(396)


func _on_pressed():
	
	if times_read == 0:
		spine_y = %BookSpines.yvals.pick_random()
		spine_color = Color(randf_range(.5,1),randf_range(.5,1),randf_range(.5,1))
		%"book count label"._update_count(1)
		%BookSpines._set_spine(spine_y,spine_color, $".")
	if title == "":
		title = "this is book " + str(this_ID)
	times_read += 1
	print(title," out of a total of ", len(booklist), 
	" which you have now read ", times_read, " times")
	
