extends Button

onready var grid = get_node("../../Grid")

func _pressed():
	grid.generate()
