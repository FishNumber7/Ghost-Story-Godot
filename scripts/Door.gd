extends MeshInstance3D


var activated = false

func _activate_door():
	if !activated:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", Vector3(0, 12, 0), 5)
