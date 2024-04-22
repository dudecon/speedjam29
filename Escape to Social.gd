extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (%Social.social_battery > 30) and not %Social.visible:
		visible = true


func _pressed():
	%Social.visible = true
	visible = false
