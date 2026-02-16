extends RichTextLabel
signal new_lemons

var value: int
@export var GOTTA_GO_FAST: float = 1

var clicks: int
@export var lemonscounter: RichTextLabel
var stuff_to_save = {
	"coolstuff": 5,
	"number of lemons" : 0,
	"clicks" : 0,
}


func _ready():
	self.text = "clicks " + str(VAR.gCLICKS)
	var timer := Timer.new()
	timer.wait_time = GOTTA_GO_FAST
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)

func clicksl() -> void:
	VAR.gCLICKS += 1
	self.text = "clicks " + str(VAR.gCLICKS)

func lemon() -> void:
	lemonscounter.text = "lemons " + str(VAR.gLEMONS)
	if  lemonscounter:
		lemonscounter.text = "lemons " + str(VAR.gLEMONS)
		if VAR.gCLICKS == 600:
			print(VAR.gCLICKS)
			VAR.gCLICKS = 0
			self.text = "clicks " + str(VAR.gCLICKS)
			lemonscounter.text = "lemons " + str(VAR.gLEMONS)
			new_lemons.emit()

func _on_timer_timeout() -> void:
	clicksl()
	lemon()

func _process(delta: float) -> void:
	VAR.stuff_to_save = stuff_to_save
	stuff_to_save["number of lemons"] = VAR.gLEMONS
	stuff_to_save["clicks"] = VAR.gCLICKS
