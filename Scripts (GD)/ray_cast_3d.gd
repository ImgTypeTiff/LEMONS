extends RayCast3D

@export var DLabel: RichTextLabel
@export var DLabel2: RichTextLabel
var dialogueType: int
var body
var dialogue
var ControlType
@export var debug_printing: bool = false
func _process(delta: float) -> void:
	if DLabel and DLabel2:
		body = get_collider()
		
		if body == null:
			$"../../../CanvasLayer/InteracrLabelHolder".hide()
			DLabel2.text = ""
			DLabel.text = ""
			return
		


		if body.is_in_group("interactable"):
			if debug_printing:
				print(body.name, " is interactable.")
			check_dialogue()
		elif debug_printing:
			print(body.name, " is not interactable")


func check_dialogue():
	if debug_printing:
		print('Checking Dialogue')
	if body.dialogue:
		dialogue = body.dialogue
		if dialogue == " ":
			if debug_printing:
				print(body.name, " dialogue null")
			return
		if debug_printing:
			print(dialogue)
		check_dialogue_type()


func check_dialogue_type():
	if !VAR.is_interacting:
		$"../../../CanvasLayer/InteracrLabelHolder".show()
	dialogueType = int(body.DialogueType)
	if dialogueType <= 1:
		ControlType = body.ControlType
	Set_Dialogue(dialogueType)

func Set_Dialogue(type):
	if type == 1:
		var finaldialogue = dialogue
		finaldialogue += " press "
		finaldialogue += ControlType["control"]
		DLabel.text = finaldialogue
	if type == 0:
		DLabel.text = dialogue
		DLabel2.text = body.subdialogue
		if Input.is_action_just_pressed("Interact"):
			if !VAR.is_interacting:
				print("Starting Interaction...")
				$"../../..".set_physics_process(false)
				VAR.is_interacting = true
				interact()
			elif VAR.is_interacting:
				print("stopping interaction...")
				$"../../../CanvasLayer/InteracrLabelHolder".show()
				$"../../..".set_physics_process(true)
				VAR.is_interacting = false
				body.stop_interaction()
func interact():
	body.Interact()
	$"../../../CanvasLayer/InteracrLabelHolder".hide()
