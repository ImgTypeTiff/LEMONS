extends RigidBody3D
@onready var raycast = $RayCast3D
@export var speed :float = 50.0
@onready var velocity: Vector3
@onready var distance
func _physics_process(delta: float) -> void:
	velocity = global_basis * Vector3.FORWARD * speed
	#dtarget_position = Vector3.FORWARD * speed * delta
	raycast.force_raycast_update()
	var collider = raycast.get_collider()
	if raycast.is_colliding():
		if not collider.is_in_group("bullet"):
			if collider.is_in_group("physics"):
				if collider is CharacterBody3D:
					collider.velocity += self.constant_force
					

				if collider is RigidBody3D:
					var applied_force = velocity/5
					var idk = raycast.get_collision_point()
					var hit_pos = raycast.get_collision_point()
					var local_offset = hit_pos - collider.global_transform.origin
					collider.apply_impulse(local_offset, applied_force)
					print(applied_force)
					print(raycast.get_collision_point())
					cleanup()
					pass
			global_position = raycast.get_collision_point()
			$RayCast3D/Timer.start()
			self.freeze = true
			set_physics_process(false)
	constant_force = velocity
	distance = velocity.length()*delta



func cleanup() -> void:
	queue_free()
