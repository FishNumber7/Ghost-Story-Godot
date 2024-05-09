extends Label

var can_display = false


func _on_tooltip_label_finished():
	can_display = true


func _interact_display():
	if can_display:
		self.visible = true
	else:
		await $"../Tooltip".label_finished
		self.visible = true


func _on_areas_interact_hide():
	self.visible = false


func _disable_interact_envelope():
	self.visible = false
