extends Control

var books_read

# Called when the node enters the scene tree for the first time.
func _ready():
	books_read = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	%"book count label".text = "Books read: " + str(books_read)
