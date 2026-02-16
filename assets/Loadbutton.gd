extends Button

func load_game():
	var file = FileAccess.open("user://save.VeryProprietarySaveFormat", FileAccess.READ)
	if file == null:
		return false

	if file.get_length() == 0:
		print("Save file is empty")
		file.close()
		return false

	var save_data = file.get_var()
	print(save_data)
	print(save_data["number of lemons"])
	print(save_data["clicks"])
	VAR.gCLICKS = save_data["clicks"]
	VAR.gLEMONS = save_data["number of lemons"]
	file.close()
	return true
