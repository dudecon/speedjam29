extends Button

	
func _pressed():
	$".".owner.visible = false
	$".".owner._update_social() # to make sure the "escape to social" button gets enabled


func can_escape():
	if $".".owner.social_battery > 45: return false
	var escapeable = true
	for child in $"../Study_Group/NPCButtons".get_children():
		if child.thoughts_exposed:
			escapeable = false
	return escapeable


func _on_chad_target_toggled(_toggled_on):
	visible = can_escape()


func _on_stacy_target_toggled(_toggled_on):
	visible = can_escape()


func _on_gewn_target_toggled(_toggled_on):
	visible = can_escape()


func _on_beta_target_toggled(_toggled_on):
	visible = can_escape()


func _on_karen_target_toggled(_toggled_on):
	visible = can_escape()


func _on_violet_target_toggled(_toggled_on):
	visible = can_escape()

