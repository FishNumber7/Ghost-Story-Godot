extends AnimatedSprite2D

func _on_start_play_streelights():
	self.play("streetlights")
	self.visible = true
	await get_tree().create_timer(1).timeout
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,0),1)
	tween.tween_property($"../Loading", "modulate", Color(1,1,1,1), .2)
	await tween.finished
	Global.goto_scene("res://scenes/text1.tscn")
