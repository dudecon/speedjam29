extends Sprite2D



var all_books = []
var visible_books = []
var invisible_books = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _set_book_visibility(target_visible = 0):
	if len(all_books) != len(visible_books) + len(invisible_books):
		invisible_books = all_books.duplicate()
	if target_visible == 0:
		target_visible = randi_range(5,10)
	var num_books_visible = len(visible_books)
	var book
	if target_visible > num_books_visible:
		for i in range(target_visible - num_books_visible):
			var j = randi_range(0,len(invisible_books)-1)
			book = invisible_books.pop_at(j)
			book.visible = true
			visible_books.append(book)
	elif target_visible < num_books_visible:
		for i in range( num_books_visible - target_visible):
			var j = randi_range(0,len(visible_books)-1)
			book = visible_books.pop_at(j)
			book.visible = false
			invisible_books.append(book)
	print(len(visible_books))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

