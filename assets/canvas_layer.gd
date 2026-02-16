extends CanvasLayer

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		print("CANVAS GOT CLICK")
