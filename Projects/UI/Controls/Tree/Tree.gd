extends Tree

func _ready() -> void:
	var root = create_item()
	root.set_text(0, "Root")
	var header = create_item(root)
	header.set_text(0, "Header")
	var child1 = create_item(root)
	child1.set_text(0, "Child #1")
	var child2 = create_item(root)
	child2.set_text(0, "Child #2")
	var subchild1 = create_item(child1)
	subchild1.set_text(0, "SubChild #1")
	var subchild1_1 = create_item(subchild1)
	subchild1_1.set_text(0, "SubChild #1.1")
	var subchild1_2 = create_item(subchild1)
	subchild1_2.set_text(0, "SubChild #1.2")
