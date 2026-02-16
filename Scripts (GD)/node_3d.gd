extends Node3D

# 1. Reference the scene file
@export var ENEMY_SCENE : PackedScene = preload("res://assets/Lemonade.tscn")

func spawn_enemy():
	# 2. Create an instance
	var new_enemy = ENEMY_SCENE.instantiate()

	# (Optional) Set properties before adding to the tree
	new_enemy.position = Vector3.ZERO
	print(new_enemy.position)
	print(self.position)
	print(self.global_position)
	# 3. Add the instance to the scene tree
	
	add_child(new_enemy)

func _ready() -> void:
	spawn_enemy()


func _on_clickscounter_new_lemons() -> void:
	print("repeat")
	spawn_enemy()
