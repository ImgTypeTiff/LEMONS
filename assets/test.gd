extends RigidBody3D
@export var bullet_force: float
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
	if raycast.is_colliding():
		var body = raycast.get_collider()
		if body is RigidBody3D:
			var hit_pos = raycast.get_collision_point()
			var ray_origin = raycast.global_transform.origin
			var bullet_dir = (hit_pos - ray_origin).normalized()

			body.apply_impulse(
				hit_pos - body.global_transform.origin,
				bullet_dir * bullet_force
			)
	constant_force = velocity
