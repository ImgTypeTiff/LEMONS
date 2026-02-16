extends PanelContainer

func _process(delta: float) -> void:
	$Control2/RichTextLabel.text = "lemons: " + str(VAR.gLEMONS)
