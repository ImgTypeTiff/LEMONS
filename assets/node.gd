extends Control

@onready var label: Label = $Label # Label to display session id
@onready var tube_client: TubeClient = $TubeClient # reference to tube client in scene tree
@onready var line_edit: LineEdit = $TextEdit # text user input for session id

func _on_button_pressed(): # User press create session button
	tube_client.create_session()
	label.text = "Session ID: "+tube_client.session_id

func _on_join_button_pressed(): # User press join session button
	tube_client.join_session(line_edit.text)

func _process(delta: float) -> void:
	print(tube_client.state)
