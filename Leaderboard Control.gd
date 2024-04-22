extends Control

var current_score
var escaped_score

func _allow_escape():
	$"Top Level UI/Escape the game".visible = true

# Called when the node enters the scene tree for the first time.
func _ready():
	current_score = 0

