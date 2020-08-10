extends LinkButton

func _pressed():
	return OS.shell_open(get_text())
