extends CheckBox

func _toggled(button_pressed):
	print("You just togged this checkbox!")
	print("The parameter button_pressed is:", str(button_pressed))
