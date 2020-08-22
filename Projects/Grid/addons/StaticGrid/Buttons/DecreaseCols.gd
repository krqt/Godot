extends Button

onready var grid = get_node("../../Grid")

func _pressed():
	var cols = max(grid.minColumns, grid.gridColumns - 1)
	if grid.set_gridColumns(cols):
		grid.generate()
