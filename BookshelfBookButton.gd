extends Button

var booklist
var this_ID
var title
var contents
var times_read
var times_studied
var spine_y
var spine_color
var inside_texture



func title_gen():
	var num_chars = [1,1,2,2,2,2,2,3,3,4,5].pick_random()
	var gtitle = ""
	for i in num_chars:
		gtitle = gtitle + %Library.THEMES.keys().pick_random()
	return gtitle


func content_gen():
	var num_chaps = [1,3,3,3,4,4,5,5,6].pick_random()
	var content = ""
	var titlechars = []
	for c in title:
		titlechars.append(c)
	for i in num_chaps:
		var num_chars = [2,2,3,3,4,4,4,5,5,5,5,6,6,6,6,7,7,8,8,9,10].pick_random()
		for j in num_chars:
			content = content + %Library.THEMES[titlechars.pick_random()].pick_random()
		content = content + "\n"
	return content


# Called when the node enters the scene tree for the first time.
func _ready():
	booklist = %Library.all_books
	this_ID = len(booklist)
	booklist.append($".")
	title = ""
	contents = ""
	times_read = 0
	times_studied = 0
	modulate[3] = 0.4
	inside_texture = 0
	# 54 themes print(len(THEMES))
	"""for s in THEMES.keys():
		if len(s) != 1:
			for c in s:
				print(c)"""

func _read_the_book():
	%BookSpines._set_spine(spine_y, spine_color, title, $".")
	if times_read == 0:
		%"book count label"._update_count(1)
	modulate = Color(0,1,0,.8)
	if times_studied == 0:
		contents = content_gen()
	%BookOpener._open_book(contents)
	times_read += 1

func _study_book_contents():
	times_studied += 1
	

func _on_pressed():
	if %BookSpines.book_bind == $".":
		_read_the_book()
	elif times_read == 0:
		spine_y = %BookSpines.yvals.pick_random()
		spine_color = Color(randf_range(.5,1),randf_range(.5,1),randf_range(.5,1))
		title = title_gen()
	%BookSpines._set_spine(spine_y, spine_color, title, $".")
	
	
