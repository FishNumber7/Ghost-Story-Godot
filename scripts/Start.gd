extends Button
@export var FadeToWhite : ColorRect

signal play_streelights


func _on_pressed():
	self.visible = false
	var tween = get_tree().create_tween()
	tween.tween_property(FadeToWhite, "modulate", Color(1,1,1,1), 1)
	await tween.finished
	play_streelights.emit()
