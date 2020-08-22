extends Button

onready var grid = get_node("../../Grid")

func _pressed():
	var rows = min(grid.gridRows + 1, grid.max_rows())
	if grid.set_gridRows(rows):
		grid.generate()
