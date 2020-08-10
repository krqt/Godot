extends Button

func _pressed():
	print("You wrote in the LineEdit node:")
	print(get_parent().get_child(0).text)
	print("You wrote in the TextEdit node:")
	print(get_parent().get_child(1).text)
