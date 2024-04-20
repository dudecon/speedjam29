extends Sprite2D



var all_books = []
var num_books_visible

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _set_book_visibility():
	num_books_visible = randi_range(5,10)
	print(num_books_visible)
	var temp_books = all_books.duplicate()
	for i in range(num_books_visible):
		var j = randi_range(0,len(temp_books)-1)
		temp_books.pop_at(j).visible = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
