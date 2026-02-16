extends Control
var timer = Timer.new()


func _process(delta: float) -> void:
	$RichTextLabel.text = "Engine Temperture:" + str(VAR.Engine_Temperture)
	Progress()

func supply_coolant():
	if VAR.gLEMONS >= 10:
		VAR.gLEMONS -= 10
		VAR.Engine_Temperture -= 150
	pass

func _ready():
	timer.wait_time = 10
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	_calculate_engine_temp()
	pass

func _calculate_engine_temp():
	timer.wait_time = 10
	timer.autostart = true
	timer.one_shot = false

func _on_timer_timeout():
	VAR.Engine_Temperture += 10
	_calculate_engine_temp()

func Progress():
	var percentage = (VAR.Engine_Temperture/10000) * 100
	$TextureProgressBar.value = percentage
