extends Control

export var title_text = "Titlebar"

onready var label = $Titlebar.get_node("Background/CenterContainer/Title")

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = title_text
	pass # Replace with function body.
