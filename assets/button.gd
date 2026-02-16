extends Button

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		print("Button received mouse input")

func _ready():
	print("UI ready, mouse mode:", Input.mouse_mode)

func _process(delta: float) -> void:
	print("UI ready, mouse mode:", Input.mouse_mode)
