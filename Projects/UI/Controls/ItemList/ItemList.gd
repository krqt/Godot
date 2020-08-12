extends ItemList

# Set HSeparation and VSeparation to 0 (enable the properties) in:
# ItemList > Control > Custom Constants

var icon_texture = preload("res://Textures/ItemListIcon.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.connect("item_selected", self, "_item_selected")
	var width = int(self.rect_size[0])
	var height = int(self.rect_size[1])
	if width % 64 == 0:
		max_columns = width / 64
		for _i in range(height / 64):
			for _j in range(width / 64 - 1):
				add_icon_item(icon_texture)
	else:
		max_columns = width / 64
		for _i in range(height / 64):
			for _j in range(width / 64 - 1):
				add_icon_item(icon_texture)

func _item_selected(index) -> void:
	print("Item Selected: " + str(index))
