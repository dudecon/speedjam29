extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _pressed():
	$".".owner.visible = false



func can_escape():
	if $".".owner.social_battery > 45: return false
	var escapeable = true
	for child in $"../Study_Group/Social Buttons".get_children():
		if child.thoughts_exposed:
			escapeable = false
	return escapeable
			




func _on_chad_target_toggled(toggled_on):
	visible = can_escape()


func _on_stacy_target_toggled(toggled_on):
	visible = can_escape()


func _on_gewn_target_toggled(toggled_on):
	visible = can_escape()


func _on_beta_target_toggled(toggled_on):
	visible = can_escape()


func _on_karen_target_toggled(toggled_on):
	visible = can_escape()


func _on_violet_target_toggled(toggled_on):
	visible = can_escape()

