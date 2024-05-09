extends Node3D

var activated = false

func _activate_door():
	if !activated:
		activated = true
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", Vector3(0, -.5, 17), 5)
