extends Button

func _on_clear_save_pressed() -> void:
	var save = FileAccess.open("user://save.VeryProprietarySaveFormat", FileAccess.WRITE)


	if save == null:
		push_error("Failed to open save file!")
		return


	#save.store_var(clicks)
	save.store_string("")
	save.close()
