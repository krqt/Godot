extends MenuButton

var popup = get_popup()

func _pressed():
	print("The checkbox has been toggled.")
	popup.toggle_item_checked(1)
	print("The radio buttons have been toggled.")
	popup.toggle_item_checked(2)
	popup.toggle_item_checked(3)

func _ready():
	popup.add_item(".add_item()")
	popup.add_check_item(".add_check_item()")
	popup.add_radio_check_item(".add_radio_check_item()")
	popup.add_radio_check_item(".add_radio_check_item()")
	popup.toggle_item_checked(2)
