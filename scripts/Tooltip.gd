extends Label

signal label_finished

func _on_start():
	self.text = "WASD to Move"
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,1), 1)
	tween.tween_property(self, "modulate", Color(1,1,1,0), 2)
	await tween.finished
	label_finished.emit()
