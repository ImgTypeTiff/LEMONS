extends Node

@onready var stuff_to_save = {
	"hi" : "hi but again"
}

@onready var stuff_to_save2 = {}

func shit():
	var save = FileAccess.open("user://rest.VeryProprietarySaveFormat", FileAccess.WRITE)


	if save == null:
		push_error("Failed to open save file!")
		return


	#save.store_var(clicks)
	save.store_string("")
	save.store_var(stuff_to_save)
	save.close()
	print("Save worked")

func load_game():
	var file = FileAccess.open("user://rest.VeryProprietarySaveFormat", FileAccess.READ)
	if file == null:
		return false

	if file.get_length() == 0:
		print("Save file is empty")
		file.close()
		return false

	stuff_to_save2 = file.get_var()
	print(stuff_to_save2)
	stuff_to_save2 = stuff_to_save

	file.close()

func _ready():
	
	shit()
	print(stuff_to_save2)
	load_game()
	print(stuff_to_save2)
