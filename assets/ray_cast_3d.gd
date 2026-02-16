extends RayCast3D

@export var scene: PackedScene

func _physics_process(delta: float) -> void:
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			if Input.is_action_pressed("Shoot"):
				apply_hit_impulse()
				pass

@onready var can_fire: bool
@onready var timer: Timer = $"../Timer"
@export var knockback: float = 20.0
@onready var playa: AnimationPlayer = $"../AnimationPlayer"
func apply_hit_impulse():
	if !timer.is_stopped():
		
		return
	if is_colliding():
		playa.play("new_animation")
		
		timer.start()
		can_fire= false
		var collider = get_collider()
		var hit_point = get_collision_point()

		if collider is RigidBody3D:
			# RayCast3D points along -Z
			var shot_dir = -global_transform.basis.z.normalized()
			var impulse = shot_dir * knockback
			var local_hit_pos = hit_point - collider.global_position

			collider.apply_impulse(impulse, local_hit_pos)
	else:
		return
