extends Node3D

@onready var raycast := $RayCast3D
@export var impulse_strength := 2.0

func _physics_process(delta: float) -> void:
	raycast.force_raycast_update()

	if raycast.is_colliding():
		var collider = raycast.get_collider()

		if collider is RigidBody3D:
			var hit_pos = raycast.get_collision_point()
			var offset = hit_pos - collider.global_transform.origin
			var bullet_dir = -raycast.global_transform.basis.z

			# clamp torque leverage
			offset = offset.limit_length(0.4)

			collider.apply_impulse(offset, bullet_dir * impulse_strength)

	queue_free()
