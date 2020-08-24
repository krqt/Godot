extends Control

export var title_text = "Titlebar"
export(bool) var debug = false

onready var titlerect = $Titlebar.get_node("TitleRect")
onready var label = titlerect.get_node("CenterContainer/Title")

var dragging = false
var start_position = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = title_text

# Debug logging.
func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() == 1 and _in_rect_bounds(event.position):
			dragging = !dragging
			start_position = get_local_mouse_position()

	# Print statistics if debug is enabled.
	if debug:
		# Mouse in viewport coordinates.
		if event is InputEventMouseButton:
			if event.position.y <= get_rect().size.y:
				print("Mouse Click/Unclick in: Titlebar")
			print("Mouse Click/Unclick at: ", event.position)
		elif event is InputEventMouseMotion:
			print("Mouse Motion at: ", event.position)

		# Print the size of the viewport.
		print("Viewport Resolution is: ", get_viewport_rect().size)
		print("Viewport Position is: ", OS.window_position)

func _process(_delta) -> void:
	if dragging:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - start_position)

func _on_MinimizeButton_pressed() -> void:
	OS.set_window_minimized(true)

func _on_QuitButton_pressed() -> void:
	get_tree().quit()

# Check if mouse position vector is in the bounds of Titlebar's TitleRect node.
func _in_rect_bounds(pos: Vector2):
	return pos.y <= get_rect().size.y and pos.x >= titlerect.rect_position.x and pos.x <= titlerect.get_rect().size.x
