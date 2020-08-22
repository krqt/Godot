extends Container

"""NOTES:
- Use an object pooling system in place of queue_free().
"""

# Set HSeparation and VSeparation to 0 (enable the properties) in:
# Parent > Control > Custom Constants

# Rectangle Grid Properties
export(int) var minColumns = 1
export(int) var gridColumns = 7
export(int) var gridRows = 2

# 1:1 Item Properties
export(PackedScene) var scene
export(int) var spriteSize = 64
export(int) var itemSize = 64

var width = get_global_rect().size[0]
var height = get_global_rect().size[1]

# Generate grid of instanced scenes (Items)
func generate(c: int = gridColumns) -> void:
	"""Generates grid with integer parameter c, for the number of columns.
	Returns null."""
	# Set global bounds.
	width = get_global_rect().size[0]
	height = get_global_rect().size[1]

	# Free up memory.
	for child in get_children():
		child.queue_free()

	for i in range(c):
		for j in range(gridRows):
			var offset = itemSize / 2
			var position = Vector2(i * itemSize + offset, j * itemSize + offset)
			var item = scene.instance()
			item.set_position(position)
			add_child(item)

func set_minColumns(i: int):
	"""Sets minimum grid column size.
	Returns true if greater than 0."""
	if minColumns > 0:
		minColumns = i
		return true
	return false

func set_gridColumns(i: int):
	"""Sets grid column size.
	Returns true if integer parameter is:
		- Greater than, or equal to the minimum columns.
		- Lesser than, or equal to max_cols()."""
	if i >= minColumns and i <= max_cols() and itemSize * gridColumns <= width:
		gridColumns = i
		#self.width = i * itemSize
		return true
	return false

func set_gridRows(i: int):
	"""Sets grid row size.
	Returns true if integer parameter is:
		- Greater than, or equal to 1.
		- Lesser than, or equal to max_rows()."""
	if i >= 1 and i <= max_rows():
		gridRows = i
		#self.height = i * itemSize
		return true
	return false

func max_cols():
	return width / itemSize

func max_rows():
	return height / itemSize

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	minColumns = max(minColumns, 1)
	gridColumns = max(gridColumns, 1)
	gridRows = max(gridRows, 1)
