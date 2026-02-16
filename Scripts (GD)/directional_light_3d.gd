extends Node3D

@onready var lol: bool = true

@export var rotation_speed: Vector3 = Vector3(0.6, 0, 0) # Degrees per second

func _process(delta):
	# Rotate by the speed amount every second
	rotation_degrees += rotation_speed * delta 
