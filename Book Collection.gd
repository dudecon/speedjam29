extends Node

var shelf_theme = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	#print("book collection ready")
	# 38 collections, 54 themes
	var athemes = %Library.available_themes
	if len(athemes) == 0:
		athemes = %Library.THEMES.keys()
		%Library.available_themes = athemes
	var i = randi_range(0,len(athemes)-1)
	shelf_theme = athemes.pop_at(i)
	%Library.used_themes.append(shelf_theme)
	#print(shelf_theme)
	#print(athemes)

