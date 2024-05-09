extends Button

func _on_pressed():
	get_tree().quit()


func _on_start_pressed():
	self.visible = false
