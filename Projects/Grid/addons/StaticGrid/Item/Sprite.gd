extends Sprite

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			print("You clicked me!")

#Scale-Position Relationship:
# Scale 0.5, 0.5: 16, 16
# Scale 1.25, 1.25: 40, 40
# every 0.125 scale, move 4.
# 40 / 1.25 = 32 -> 40 - 32 = 8
# 16 / 0.5 = 32 -> 16 - 32 = -16
#Calculate New Position:
# Get sprite's size (width or height)
# (Scale * Size) / Scale = Sub
# Sub - Size = New x + y position
