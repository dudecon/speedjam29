extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if %Social.social_battery > 30:
		visible = true

	pass

func _pressed():
	%Social.visible = true
	#visible = false
