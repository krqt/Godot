extends OptionButton

var popup = get_popup()

func _pressed():
	print("Selected:", str(get_selected_id()))

# Called when the node enters the scene tree for the first time.
func _ready():
	popup.add_item("OptionButton")
	popup.add_item("add_item()")
