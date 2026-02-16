extends Node3D

@export var node_with_thing_to_do: Node
@export var dialogue: String = " "
@export var subdialogue: String = " "
@export_enum("text", "control") var DialogueType
@export var ControlType = {
	"control" : "x"
}

func Interact():
	node_with_thing_to_do.Interact()

func stop_interaction():
	node_with_thing_to_do.Stop_Interact()
