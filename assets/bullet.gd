extends RayCast3D

@onready var raycast = self
@export var speed :float = 50.0
@onready var velocity: Vector3
func _physics_process(delta: float) -> void:
	velocity += global_basis * Vector3.BACK * speed * delta
	position += velocity
	#dtarget_position = Vector3.FORWARD * speed * delta
	force_raycast_update()
	var collider = raycast.get_collider()
	if raycast.is_colliding():
		if not collider.is_in_group("bullet"):
			if collider.is_in_group("physics"):
				if collider is CharacterBody3D:
					collider.velocity += self.velocity
					cleanup()
				else:
					stick()
				if collider is RigidBody3D:
					collider.apply_force(Vector3.FORWARD*speed, raycast.get_collision_point())
					pass
				else:
					stick()
	stick()
func cleanup() -> void:
	queue_free()

func stick():
	velocity = Vector3(0,0,0)
	global_position = raycast.get_collision_point()
