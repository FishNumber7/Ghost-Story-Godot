extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "Press Space to Move Forward"


func _on_control_interacted():
	self.visible = false
