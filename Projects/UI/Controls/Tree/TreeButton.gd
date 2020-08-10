extends Button
class_name TreeView

onready var tree : Tree = get_node("../TreeView")
onready var root : TreeItem = tree.get_root()
onready var item : TreeItem = root
onready var a : Array

onready var reset : Button = get_node("../ResetButton")

func _ready() -> void:
	reset.connect("pressed", self, "_on_ResetButton_pressed")

func _pressed():
	if item.get_children() != null && !a.has(item):
		print("get_children(): ", item.get_children())
		print("Has children: " + item.get_text(0))
		print("Next move will traverse down...")
		a.append(item)
		item = item.get_children()
		return
		#rec(root)
	if item.get_next() != null:
		print("get_next(): ", item.get_next())
		print("Has siblings: " + item.get_text(0))
		print("Next move will traverse right...")
		a.append(item)
		item = item.get_next()
		return
	else:
		if item.get_parent() != null:
			if !a.has(item):
				a.append(item)
			print("Single child: " + item.get_text(0))
			print("Next move will traverse up...")
			item = item.get_parent()
		return

func _on_ResetButton_pressed():
	a = []
	item = root
	print("Reset Tree Traverse Button.")
