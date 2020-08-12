extends Button

onready var grid = get_node("../../Grid")

func _pressed():
	var cols = min(grid.gridColumns + 1, grid.max_cols())
	if grid.set_gridColumns(cols):
		grid.generate()
