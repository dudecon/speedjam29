extends Button

var booklist
var this_ID

# Called when the node enters the scene tree for the first time.
func _ready():
	booklist = %Library.all_books
	this_ID = len(booklist)
	booklist.append( "this is book " + str(this_ID))


func _on_pressed():
	print(booklist[this_ID]," out of a total of ", len(booklist))


