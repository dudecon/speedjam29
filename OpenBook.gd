extends Sprite2D

var book_textures

# Called when the node enters the scene tree for the first time.
func _ready():
	book_textures = %AllOpenBooks.get_children()

