extends Node3D

var activated = false

func _lift_pedestal(body):
	print("I hate myself")
	if !activated:
		activated = true
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", Vector3(4, 1.5, 49), 5)
