extends ColorRect

var interacted = false
signal story_ready

func _on_control_interacted():
	if !interacted:
		interacted = true
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate", Color(1,1,1,0), 1)
		await tween.finished
		await get_tree().create_timer(1).timeout
		story_ready.emit()
