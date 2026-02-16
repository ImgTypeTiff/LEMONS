extends ColorRect

func _process(delta: float) -> void:
	if get_viewport().get_camera_3d().unproject_position($"../../MeshInstance3D2/Area3D2".global_transform.origin):
		print(position)
		self.position = get_viewport().get_camera_3d().unproject_position($"../../MeshInstance3D2/Area3D2".global_transform.origin)
