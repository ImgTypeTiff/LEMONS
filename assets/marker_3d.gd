extends Marker3D

var can_shoot: bool = true
@onready var timer: Timer = $"../Timer"
# 1. Reference the scene file
@export var ENEMY_SCENE : PackedScene = preload("res://assets/Lemonade.tscn")

func spawn_enemy():
	if timer.is_stopped():
		var new_enemy = ENEMY_SCENE.instantiate()

		# (Optional) Set properties before adding to the tree
		

		new_enemy.global_transform = global_transform
		# 3. Add the instance to the scene tre
		@warning_ignore("unused_variable")
		var scene_root = get_tree().current_scene
		scene_root.add_child(new_enemy)
		print("lolol")
		timer.start()

func _ready() -> void:
	return
	spawn_enemy()
