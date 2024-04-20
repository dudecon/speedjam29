extends Button

var booklist
var this_ID
var bookinfo

# Called when the node enters the scene tree for the first time.
func _ready():
	booklist = %Library.all_books
	this_ID = len(booklist)
	booklist.append({ "title": "this is book " + str(this_ID), "times_read": 0})
	bookinfo = booklist[this_ID]


func _on_pressed():
	if bookinfo["times_read"] == 0:
		%"Library UI".books_read += 1
	bookinfo["times_read"] += 1
	print(bookinfo["title"]," out of a total of ", len(booklist), 
	" which you have now read ", bookinfo["times_read"], " times")
	
