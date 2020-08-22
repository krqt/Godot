extends Button

onready var grid = get_node("../../Grid")

func _pressed():
	var rows = max(1, grid.gridRows - 1)
	if grid.set_gridRows(rows):
		grid.generate()
