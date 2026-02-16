extends RayCast3D



func _process(delta: float) -> void:
	position = position.lerp(position + Vector3.FORWARD, 10 * delta)
	
	apply_hit_impulse()

func apply_hit_impulse():
		if not is_colliding():
			return
		var collider = get_collider()
		var hit_point = get_collision_point()
		if collider is RigidBody3D:
			# RayCast3D points along -Z
			var shot_dir = -global_transform.basis.z.normalized()
			var impulse = shot_dir * 1
			var local_hit_pos = hit_point - collider.global_position
			collider.apply_impulse(impulse, local_hit_pos)
			print(Vector3.FORWARD)
			queue_free()
