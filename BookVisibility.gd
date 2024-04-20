extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _toggled(toggled_on):
	var btheme = %Button4.theme#["normal"]#.styles.normal
	print(btheme)
	var newcolor
	#"res://bookbuttons.tres" "Button/styles/normal"
	if toggled_on:
		newcolor = Color(1,1,1,0.7)
		#%Library._set_book_visibility(200)
	else:
		newcolor = Color(1,1,1,0.0)
		#%Library._set_book_visibility(0)
	btheme.set_color("border_color", "Button", newcolor)

