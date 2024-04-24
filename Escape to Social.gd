extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


func _pressed():
	%Social.visible = true
	visible = false
