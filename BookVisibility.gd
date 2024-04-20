extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _toggled(toggled_on):
	var btheme = %Button4.theme
	"res://bookbuttons.tres"
	theme
	if toggled_on:
		btheme.button.styles.normal.border_width = 3
		%Library._set_book_visibility(200)
	else:
		btheme.button.styles.normal.border_width = 0
		%Library._set_book_visibility(0)
	
"Button/styles/normal"
