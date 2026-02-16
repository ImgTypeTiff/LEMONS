extends CharacterBody3D

var health: int = 100

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if health < 1:
		print("lol")
		queue_free()
	move_and_slide()

func hit(damage):
	print(damage)
	health -= damage
	print(health)
