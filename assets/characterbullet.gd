extends CharacterBody3D
@onready var raycast = $RayCast3D
@export var speed :float = 50.0

func _physics_process(delta: float) -> void:
	position = global_basis * Vector3.FORWARD * speed
	#dtarget_position = Vector3.FORWARD * speed * delta
	raycast.force_raycast_update()
	var collider = raycast.get_collider()
	if raycast.is_colliding():
		if not collider.is_in_group("bullet"):
			if collider.is_in_group("physics"):
				if collider is CharacterBody3D:
					collider.velocity += self.constant_force
					cleanup()
				if collider is RigidBody3D:
					collider.apply_force(Vector3.FORWARD*speed, raycast.get_collision_point())
					velocity.bounce(raycast.get_collision_point())
					pass
			global_position = raycast.get_collision_point()
			$RayCast3D/Timer.start()
			self.freeze = true
			set_physics_process(false)


func cleanup() -> void:
	queue_free()
