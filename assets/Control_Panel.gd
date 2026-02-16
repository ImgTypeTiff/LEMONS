extends Node

func _ready():
	$"../CanvasLayer/Control/Control UI".hide()

func Interact():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$"../CanvasLayer/Control/Control UI".show()

func Stop_Interact():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$"../CanvasLayer/Control/Control UI".hide()
