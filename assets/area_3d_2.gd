extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("physics"):
		if body is LemonBox or RigidBody3D or VehicleBody3D:
			body.linear_velocity = -body.linear_velocity * 0.75 
			print(body.linear_velocity)
			print("heelo")

func _disable():
	$CollisionShape3D.disabled = true

func _physics_process(delta: float) -> void:
	if !visible:
		_disable()
