extends RigidBody3D
class_name LemonBox

var normal

func _physics_process(delta: float) -> void:
	self.linear_velocity.normalized()

@export var dialogue: String = " "
@export var subdialogue: String = " "
@export_enum("text", "control") var DialogueType
@export var ControlType = {
	"control" : "x"
}

func area_bounce(direction, strength):
	var vel = linear_velocity
	var n = direction.normalized()

	if vel.dot(n) < 0:
		linear_velocity = vel.bounce(n) * strength
