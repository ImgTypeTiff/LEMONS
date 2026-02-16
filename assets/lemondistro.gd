extends Area3D

@onready var functionNode = $"../../../../CanvasLayer/Control/clickscounter"
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("lemon"):
		print("1")
		VAR.gLEMONS += 10
		functionNode.lemon()
		body.constant_force = Vector3.UP * (50 + 9.8)
		
	pass # Replace with function body.
