extends Button

func load():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	SceneLoader.load_scene("res://addons/tube/tube_inspector.tscn")
