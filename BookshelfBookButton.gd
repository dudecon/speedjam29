extends Button

var booklist
var this_ID
var title
var contents
var times_read

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
		%Library._set_book_visibility()


func _on_pressed():
	if times_read == 0:
		%"Library UI".books_read += 1
	if title == "":
		title = "this is book " + str(this_ID)
	times_read += 1
	print(title," out of a total of ", len(booklist), 
	" which you have now read ", times_read, " times")
	
