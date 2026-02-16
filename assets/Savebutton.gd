extends Button

func save_game():
	var save = FileAccess.open("user://save.VeryProprietarySaveFormat", FileAccess.WRITE)


	if save == null:
		push_error("Failed to open save file!")
		return


	#save.store_var(clicks)
	save.store_var(VAR.stuff_to_save)
	save.close()
	print("Save worked")


func _on_pressed() -> void:
	save_game()
