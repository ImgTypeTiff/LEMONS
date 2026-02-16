extends Node3D

@export var Focused: Marker3D
@export var Unfocused: Marker3D
var _delta
var focus: bool = false
func _process(delta: float) -> void:
	_delta = delta
	if Input.is_action_just_pressed("Focus"):
		print("focus")
		if !focus:
			focus = true
		elif focus:
			focus = false
	if focus:
		if position != Focused.position:
			_focus()
	if !focus:
		if position != Unfocused.position:
			_unfocus()

func _focus():
	if position != Focused.position:
		position = position.lerp(Focused.position, 0.1 * _delta * 60)


func _unfocus():
	if position != Unfocused.position:
		position = position.lerp(Unfocused.position, 0.1 * _delta * 60)
